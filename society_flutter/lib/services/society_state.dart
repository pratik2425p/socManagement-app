import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';

class SocietyState extends ChangeNotifier {
  UserRole _currentRole = UserRole.resident;
  final String _societyName = 'Shree Samarth Co-op Housing Society';
  String _currentFlat = 'A-304';
  final String _currentUserName = 'Vicky Patil';

  UserRole get currentRole => _currentRole;
  String get societyName => _societyName;
  String get currentFlat => _currentFlat;
  String get currentUserName => _currentUserName;

  void setRole(UserRole role) {
    _currentRole = role;
    notifyListeners();
  }

  void setFlat(String flat) {
    _currentFlat = flat;
    notifyListeners();
  }

  // --- Sample In-Memory Data ---

  // Maintenance Bills
  final List<MaintenanceBill> _bills = [
    MaintenanceBill(
      societyId: 1,
      flatId: 12,
      flatNumber: 'A-304',
      billNumber: 'BILL-OCT-2026-304',
      billingMonth: 'October 2026',
      dueDate: DateTime.now().add(const Duration(days: 8)),
      amount: 2450.0,
      lateFee: 0.0,
      status: BillStatus.unpaid,
      issuedAt: DateTime.now().subtract(const Duration(days: 5)),
    ),
    MaintenanceBill(
      societyId: 1,
      flatId: 12,
      flatNumber: 'A-304',
      billNumber: 'BILL-SEP-2026-304',
      billingMonth: 'September 2026',
      dueDate: DateTime.now().subtract(const Duration(days: 22)),
      amount: 2450.0,
      lateFee: 0.0,
      status: BillStatus.paid,
      issuedAt: DateTime.now().subtract(const Duration(days: 35)),
    ),
  ];

  List<MaintenanceBill> get bills => _bills;

  void payBill(String billNumber) {
    final idx = _bills.indexWhere((b) => b.billNumber == billNumber);
    if (idx != -1) {
      final bill = _bills[idx];
      _bills[idx] = MaintenanceBill(
        societyId: bill.societyId,
        flatId: bill.flatId,
        flatNumber: bill.flatNumber,
        billNumber: bill.billNumber,
        billingMonth: bill.billingMonth,
        dueDate: bill.dueDate,
        amount: bill.amount,
        lateFee: bill.lateFee,
        status: BillStatus.paid,
        issuedAt: bill.issuedAt,
      );
      notifyListeners();
    }
  }

  // Visitors
  final List<VisitorEntry> _visitors = [
    VisitorEntry(
      id: 1,
      societyId: 1,
      flatNumber: 'A-304',
      visitorName: 'Rahul Shinde (Swiggy)',
      phoneNumber: '9822011223',
      purpose: 'Delivery',
      vehicleNumber: 'MH-12-AB-1234',
      passcode: '4821',
      status: VisitorStatus.inside,
      entryGate: 'Main Gate 1',
      checkInTime: DateTime.now().subtract(const Duration(minutes: 14)),
    ),
    VisitorEntry(
      id: 2,
      societyId: 1,
      flatNumber: 'B-102',
      visitorName: 'Suresh Deshmukh',
      phoneNumber: '9923456789',
      purpose: 'Guest',
      passcode: '8910',
      status: VisitorStatus.expected,
      entryGate: 'Main Gate 1',
    ),
    VisitorEntry(
      id: 3,
      societyId: 1,
      flatNumber: 'A-304',
      visitorName: 'Amit Joshi (Uber)',
      phoneNumber: '9765432100',
      purpose: 'Cab',
      vehicleNumber: 'MH-14-CD-5678',
      status: VisitorStatus.waitingApproval,
      entryGate: 'Main Gate 1',
      checkInTime: DateTime.now().subtract(const Duration(minutes: 2)),
    ),
  ];

  List<VisitorEntry> get visitors => _visitors;

  void preApproveVisitor({
    required String name,
    required String phone,
    required String purpose,
    String? vehicle,
  }) {
    final passcode = (1000 + (_visitors.length * 137) % 9000).toString();
    _visitors.insert(
      0,
      VisitorEntry(
        id: _visitors.length + 1,
        societyId: 1,
        flatNumber: _currentFlat,
        visitorName: name,
        phoneNumber: phone,
        purpose: purpose,
        vehicleNumber: vehicle,
        passcode: passcode,
        status: VisitorStatus.expected,
        entryGate: 'Main Gate 1',
      ),
    );
    notifyListeners();
  }

  void guardRecordEntry({
    required String visitorName,
    required String phone,
    required String flatNumber,
    required String purpose,
    String? vehicle,
  }) {
    _visitors.insert(
      0,
      VisitorEntry(
        id: _visitors.length + 1,
        societyId: 1,
        flatNumber: flatNumber,
        visitorName: visitorName,
        phoneNumber: phone,
        purpose: purpose,
        vehicleNumber: vehicle,
        status: VisitorStatus.waitingApproval,
        entryGate: 'Main Gate 1',
        checkInTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  bool guardVerifyPasscode(String passcode) {
    final idx = _visitors.indexWhere(
      (v) => v.passcode == passcode && v.status == VisitorStatus.expected,
    );
    if (idx != -1) {
      final v = _visitors[idx];
      _visitors[idx] = VisitorEntry(
        id: v.id,
        societyId: v.societyId,
        flatNumber: v.flatNumber,
        visitorName: v.visitorName,
        phoneNumber: v.phoneNumber,
        purpose: v.purpose,
        vehicleNumber: v.vehicleNumber,
        passcode: v.passcode,
        status: VisitorStatus.inside,
        entryGate: v.entryGate,
        checkInTime: DateTime.now(),
      );
      notifyListeners();
      return true;
    }
    return false;
  }

  void updateVisitorStatus(int id, VisitorStatus status) {
    final idx = _visitors.indexWhere((v) => v.id == id);
    if (idx != -1) {
      final v = _visitors[idx];
      _visitors[idx] = VisitorEntry(
        id: v.id,
        societyId: v.societyId,
        flatNumber: v.flatNumber,
        visitorName: v.visitorName,
        phoneNumber: v.phoneNumber,
        purpose: v.purpose,
        vehicleNumber: v.vehicleNumber,
        passcode: v.passcode,
        status: status,
        entryGate: v.entryGate,
        checkInTime: v.checkInTime ?? (status == VisitorStatus.inside ? DateTime.now() : null),
        checkOutTime: status == VisitorStatus.exited ? DateTime.now() : null,
      );
      notifyListeners();
    }
  }

  // Vouchers
  final List<VoucherRequest> _vouchers = [
    VoucherRequest(
      id: 1,
      societyId: 1,
      voucherNumber: 'VCH-2026-089',
      title: 'Water Pump Repair & Motor Rewinding',
      description: 'Emergency plumber & electrician repair for Wing A overhead pump.',
      amount: 4500.0,
      category: 'Plumbing & Electrical',
      requestedByName: 'Sachin Kadam (Committee)',
      status: VoucherStatus.approved,
      approvedByName: 'Anand Rao (Chairman)',
      approvedAt: DateTime.now().subtract(const Duration(hours: 3)),
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    VoucherRequest(
      id: 2,
      societyId: 1,
      voucherNumber: 'VCH-2026-090',
      title: 'Garden Trimming & Plant Manure',
      description: 'Monthly landscape gardener fee and compost purchase.',
      amount: 2200.0,
      category: 'Gardening & Common Area',
      requestedByName: 'Pooja More (Committee)',
      status: VoucherStatus.pendingApproval,
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    VoucherRequest(
      id: 3,
      societyId: 1,
      voucherNumber: 'VCH-2026-085',
      title: 'Security CCTV Camera Cable Replacement',
      description: 'Replaced faulty coaxial cable for Gate 1 camera.',
      amount: 1800.0,
      category: 'Security & Surveillance',
      requestedByName: 'Sachin Kadam (Committee)',
      status: VoucherStatus.postedToLedger,
      approvedByName: 'Anand Rao (Chairman)',
      approvedAt: DateTime.now().subtract(const Duration(days: 4)),
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    ),
  ];

  List<VoucherRequest> get vouchers => _vouchers;

  void createVoucher({
    required String title,
    required String description,
    required double amount,
    required String category,
  }) {
    final vchNumber = 'VCH-2026-${(100 + _vouchers.length).toString()}';
    _vouchers.insert(
      0,
      VoucherRequest(
        id: _vouchers.length + 1,
        societyId: 1,
        voucherNumber: vchNumber,
        title: title,
        description: description,
        amount: amount,
        category: category,
        requestedByName: '$_currentUserName (Committee)',
        status: VoucherStatus.pendingApproval,
        createdAt: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  void approveVoucher(int id) {
    final idx = _vouchers.indexWhere((v) => v.id == id);
    if (idx != -1) {
      final v = _vouchers[idx];
      _vouchers[idx] = VoucherRequest(
        id: v.id,
        societyId: v.societyId,
        voucherNumber: v.voucherNumber,
        title: v.title,
        description: v.description,
        amount: v.amount,
        category: v.category,
        requestedByName: v.requestedByName,
        status: VoucherStatus.approved,
        approvedByName: '$_currentUserName (Chairman)',
        approvedAt: DateTime.now(),
        createdAt: v.createdAt,
      );
      notifyListeners();
    }
  }

  void rejectVoucher(int id, String reason) {
    final idx = _vouchers.indexWhere((v) => v.id == id);
    if (idx != -1) {
      final v = _vouchers[idx];
      _vouchers[idx] = VoucherRequest(
        id: v.id,
        societyId: v.societyId,
        voucherNumber: v.voucherNumber,
        title: v.title,
        description: v.description,
        amount: v.amount,
        category: v.category,
        requestedByName: v.requestedByName,
        status: VoucherStatus.rejected,
        rejectionReason: reason,
        createdAt: v.createdAt,
      );
      notifyListeners();
    }
  }

  // Double-Entry Financial Ledger
  final List<LedgerEntry> _ledgerEntries = [
    LedgerEntry(
      id: 1,
      societyId: 1,
      entryNumber: 'JE-1001',
      voucherId: 3,
      entryDate: DateTime.now().subtract(const Duration(days: 3)),
      description: 'Paid for CCTV camera cable replacement (VCH-2026-085)',
      postedByName: 'Sunil Mehta (Accountant)',
      totalDebit: 1800.0,
      totalCredit: 1800.0,
      postedAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
    LedgerEntry(
      id: 2,
      societyId: 1,
      entryNumber: 'JE-1002',
      entryDate: DateTime.now().subtract(const Duration(days: 2)),
      description: 'September 2026 Maintenance Collections received via UPI/NEFT',
      postedByName: 'Sunil Mehta (Accountant)',
      totalDebit: 85750.0,
      totalCredit: 85750.0,
      postedAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ];

  List<LedgerEntry> get ledgerEntries => _ledgerEntries;

  /// Accountant-only action!
  void postVoucherToLedger(int voucherId) {
    final idx = _vouchers.indexWhere((v) => v.id == voucherId);
    if (idx != -1) {
      final v = _vouchers[idx];
      _vouchers[idx] = VoucherRequest(
        id: v.id,
        societyId: v.societyId,
        voucherNumber: v.voucherNumber,
        title: v.title,
        description: v.description,
        amount: v.amount,
        category: v.category,
        requestedByName: v.requestedByName,
        status: VoucherStatus.postedToLedger,
        approvedByName: v.approvedByName,
        approvedAt: v.approvedAt,
        createdAt: v.createdAt,
      );

      final entryNumber = 'JE-${1000 + _ledgerEntries.length + 1}';
      _ledgerEntries.insert(
        0,
        LedgerEntry(
          id: _ledgerEntries.length + 1,
          societyId: 1,
          entryNumber: entryNumber,
          voucherId: voucherId,
          entryDate: DateTime.now(),
          description: 'Payment voucher settled: ${v.title} (${v.voucherNumber})',
          postedByName: '$_currentUserName (Accountant)',
          totalDebit: v.amount,
          totalCredit: v.amount,
          postedAt: DateTime.now(),
        ),
      );
      notifyListeners();
    }
  }

  // Complaints
  final List<Complaint> _complaints = [
    Complaint(
      id: 1,
      societyId: 1,
      flatNumber: 'A-304',
      reportedByName: 'Vicky Patil',
      title: 'Water Seepage in Master Bathroom',
      description: 'Persistent dampness and seepage from top floor flat A-404 plumbing line.',
      category: 'Plumbing',
      status: ComplaintStatus.inProgress,
      assignedTo: 'Ramesh Plumber',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Complaint(
      id: 2,
      societyId: 1,
      flatNumber: 'B-201',
      reportedByName: 'Sanjay Shinde',
      title: 'Lift Door Sensor Malfunction',
      description: 'Wing B passenger elevator door bounces back before closing.',
      category: 'Lift / Elevator',
      status: ComplaintStatus.open,
      createdAt: DateTime.now().subtract(const Duration(hours: 8)),
    ),
  ];

  List<Complaint> get complaints => _complaints;

  void addComplaint({
    required String title,
    required String description,
    required String category,
  }) {
    _complaints.insert(
      0,
      Complaint(
        id: _complaints.length + 1,
        societyId: 1,
        flatNumber: _currentFlat,
        reportedByName: _currentUserName,
        title: title,
        description: description,
        category: category,
        status: ComplaintStatus.open,
        createdAt: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  void updateComplaintStatus(int id, ComplaintStatus status, {String? notes}) {
    final idx = _complaints.indexWhere((c) => c.id == id);
    if (idx != -1) {
      final c = _complaints[idx];
      _complaints[idx] = Complaint(
        id: c.id,
        societyId: c.societyId,
        flatNumber: c.flatNumber,
        reportedByName: c.reportedByName,
        title: c.title,
        description: c.description,
        category: c.category,
        status: status,
        assignedTo: c.assignedTo,
        resolutionNotes: notes ?? c.resolutionNotes,
        createdAt: c.createdAt,
        resolvedAt: status == ComplaintStatus.resolved ? DateTime.now() : null,
      );
      notifyListeners();
    }
  }

  // Notices
  final List<Notice> _notices = [
    Notice(
      id: 1,
      societyId: 1,
      title: 'Annual General Body Meeting (AGM) 2026',
      content: 'The 14th AGM will be held on Sunday at 10:30 AM in the Clubhouse. Agenda includes solar panel installation and annual accounts approval.',
      category: 'General Meeting',
      priority: 'High',
      postedByName: 'Secretary & Chairman',
      postedAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Notice(
      id: 2,
      societyId: 1,
      title: 'Overhead Water Tank Cleaning Notice',
      content: 'Water supply to Wing A & B will be suspended tomorrow between 11 AM to 4 PM for bi-annual tank chlorination.',
      category: 'Maintenance',
      priority: 'Urgent',
      postedByName: 'Manager',
      postedAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  List<Notice> get notices => _notices;

  void publishNotice({
    required String title,
    required String content,
    required String category,
    required String priority,
  }) {
    _notices.insert(
      0,
      Notice(
        id: _notices.length + 1,
        societyId: 1,
        title: title,
        content: content,
        category: category,
        priority: priority,
        postedByName: '$_currentUserName (Committee)',
        postedAt: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
