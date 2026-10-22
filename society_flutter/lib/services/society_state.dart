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

  // --- Maintenance Bills ---
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

  // --- Visitors ---
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

  // --- Vouchers & Accounting ---
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

  // --- Complaints ---
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

  // --- Notices ---
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

  // ==========================================
  // MODULE 4: DOCUMENT VAULT & MEETING MINUTES
  // ==========================================
  final List<SocietyDocument> _documents = [
    SocietyDocument(
      id: 1,
      societyId: 1,
      title: 'Model Housing Society Bye-Laws (Maharashtra)',
      description: 'Official society rules, member rights, elections and penalty clauses.',
      category: DocumentCategory.byeLaws,
      fileUrl: 'https://society.storage/byelaws_2026.pdf',
      fileSize: '3.4 MB',
      uploadedByName: 'Secretary Office',
      isCommitteeOnly: false,
      uploadedAt: DateTime.now().subtract(const Duration(days: 60)),
    ),
    SocietyDocument(
      id: 2,
      societyId: 1,
      title: 'Statutory Audit Report FY 2025-26',
      description: 'Audited balance sheet, income/expenditure and CA certification.',
      category: DocumentCategory.auditReport,
      fileUrl: 'https://society.storage/audit_fy25_26.pdf',
      fileSize: '1.8 MB',
      uploadedByName: 'Sunil Mehta (Accountant)',
      isCommitteeOnly: false,
      uploadedAt: DateTime.now().subtract(const Duration(days: 15)),
    ),
    SocietyDocument(
      id: 3,
      societyId: 1,
      title: 'Lift AMC & Building Fire Safety Certificate',
      description: 'Annual Otis lift fitness certificate and CFO fire safety NOC.',
      category: DocumentCategory.insurance,
      fileUrl: 'https://society.storage/fire_safety_noc.pdf',
      fileSize: '850 KB',
      uploadedByName: 'Managing Committee',
      isCommitteeOnly: false,
      uploadedAt: DateTime.now().subtract(const Duration(days: 20)),
    ),
    SocietyDocument(
      id: 4,
      societyId: 1,
      title: 'Pending Legal Dispute & Municipal Notice (Confidential)',
      description: 'Internal legal counsel brief regarding adjoining boundary dispute.',
      category: DocumentCategory.legal,
      fileUrl: 'https://society.storage/legal_counsel_brief.pdf',
      fileSize: '420 KB',
      uploadedByName: 'Anand Rao (Chairman)',
      isCommitteeOnly: true,
      uploadedAt: DateTime.now().subtract(const Duration(days: 10)),
    ),
  ];

  List<SocietyDocument> get documents => _documents;

  final List<MeetingMinutes> _meetingMinutes = [
    MeetingMinutes(
      id: 1,
      societyId: 1,
      meetingTitle: '14th Annual General Body Meeting (AGM)',
      meetingType: 'AGM',
      meetingDate: DateTime.now().subtract(const Duration(days: 25)),
      agenda: 'Approval of audited balance sheet, appointment of statutory auditor, solar rooftop tender.',
      minutesSummary: 'Resolved: 1. Accounts unanimously passed. 2. Tata Solar proposal approved by majority. 3. Sinking fund contribution increased by ₹200/mo.',
      attendeesCount: 29,
      documentUrl: 'https://society.storage/agm_minutes_2026.pdf',
      recordedByName: 'Rajesh Nair (Secretary)',
      createdAt: DateTime.now().subtract(const Duration(days: 24)),
    ),
    MeetingMinutes(
      id: 2,
      societyId: 1,
      meetingTitle: 'Monthly Managing Committee Review',
      meetingType: 'Monthly Committee',
      meetingDate: DateTime.now().subtract(const Duration(days: 8)),
      agenda: 'Diwali illumination quotes, CCTV repair quotation approval, overdue maintenance collection drive.',
      minutesSummary: 'Resolved: 1. Approved ₹15,000 for Diwali clubhouse lighting. 2. Authorized legal notice to Flat B-402 for 6 months overdue.',
      attendeesCount: 7,
      recordedByName: 'Rajesh Nair (Secretary)',
      createdAt: DateTime.now().subtract(const Duration(days: 7)),
    ),
  ];

  List<MeetingMinutes> get meetingMinutes => _meetingMinutes;

  void uploadDocument({
    required String title,
    required String description,
    required DocumentCategory category,
    required String fileSize,
    required bool isCommitteeOnly,
  }) {
    _documents.insert(
      0,
      SocietyDocument(
        id: _documents.length + 1,
        societyId: 1,
        title: title,
        description: description,
        category: category,
        fileUrl: 'https://society.storage/${title.toLowerCase().replaceAll(' ', '_')}.pdf',
        fileSize: fileSize,
        uploadedByName: _currentUserName,
        isCommitteeOnly: isCommitteeOnly,
        uploadedAt: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  // ==========================================
  // MODULE 5: POLLING & DEMOCRATIC VOTING
  // ==========================================
  final List<SocietyPoll> _polls = [
    SocietyPoll(
      id: 1,
      societyId: 1,
      title: 'Should we install a 15 kW Solar Rooftop Plant for Common Area Lights?',
      description: 'Capital cost estimate is ₹6.8 Lakhs with 40% government subsidy. Expected payback period is 2.5 years with zero common electricity bill.',
      category: 'Infrastructure & Capital Works',
      status: PollStatus.active,
      startDate: DateTime.now().subtract(const Duration(days: 3)),
      endDate: DateTime.now().add(const Duration(days: 4)),
      totalEligibleFlats: 35,
      totalVotesCast: 24,
      createdByName: 'Managing Committee',
      createdAt: DateTime.now().subtract(const Duration(days: 3)),
    ),
    SocietyPoll(
      id: 2,
      societyId: 1,
      title: 'Electric Vehicle (EV) Charging Station Installation in Visitor Parking',
      description: 'Tada Power offers free dual 7.4 kW AC chargers. Residents pay per-unit consumption via RFID card.',
      category: 'Amenities & Green Initiative',
      status: PollStatus.active,
      startDate: DateTime.now().subtract(const Duration(days: 1)),
      endDate: DateTime.now().add(const Duration(days: 6)),
      totalEligibleFlats: 35,
      totalVotesCast: 18,
      createdByName: 'Secretary',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  final Map<int, List<PollOption>> _pollOptions = {
    1: [
      PollOption(id: 101, pollId: 1, optionText: 'Yes, Proceed with Solar Installation', votesCount: 19),
      PollOption(id: 102, pollId: 1, optionText: 'No, Postpone to next financial year', votesCount: 3),
      PollOption(id: 103, pollId: 1, optionText: 'Need more vendor quotes first', votesCount: 2),
    ],
    2: [
      PollOption(id: 201, pollId: 2, optionText: 'Agree (Install 2 EV Chargers)', votesCount: 15),
      PollOption(id: 202, pollId: 2, optionText: 'Disagree (Visitor parking will reduce)', votesCount: 3),
    ],
  };

  // Track which flats have already voted (1 Flat = 1 Vote)
  final Set<String> _votedPollFlats = {'1-B-101', '1-A-102', '1-B-204'};

  List<SocietyPoll> get polls => _polls;
  List<PollOption> getPollOptions(int pollId) => _pollOptions[pollId] ?? [];

  bool hasFlatVoted(int pollId, String flatNumber) {
    return _votedPollFlats.contains('$pollId-$flatNumber');
  }

  bool castVote({
    required int pollId,
    required String flatNumber,
    required int optionId,
  }) {
    final key = '$pollId-$flatNumber';
    if (_votedPollFlats.contains(key)) return false; // Enforce 1 Flat = 1 Vote

    _votedPollFlats.add(key);

    // Increment option count
    final options = _pollOptions[pollId];
    if (options != null) {
      final opt = options.firstWhere((o) => o.id == optionId);
      opt.votesCount += 1;
    }

    // Increment poll total count
    final pollIdx = _polls.indexWhere((p) => p.id == pollId);
    if (pollIdx != -1) {
      _polls[pollIdx].totalVotesCast += 1;
    }

    notifyListeners();
    return true;
  }

  // ==========================================
  // MODULE 6: EMERGENCY SOS & SECURITY ALARM
  // ==========================================
  final List<SosAlert> _sosAlerts = [
    SosAlert(
      id: 1,
      societyId: 1,
      flatNumber: 'B-302',
      raisedByName: 'Sunita Deshpande (Senior Citizen)',
      emergencyType: EmergencyType.medical,
      description: 'Severe chest discomfort. Ambulance required immediately.',
      status: SosStatus.active,
      raisedAt: DateTime.now().subtract(const Duration(minutes: 6)),
    ),
  ];

  List<SosAlert> get sosAlerts => _sosAlerts;
  List<SosAlert> get activeSosAlerts =>
      _sosAlerts.where((a) => a.status != SosStatus.resolved).toList();

  void triggerSos({
    required EmergencyType type,
    String? note,
  }) {
    _sosAlerts.insert(
      0,
      SosAlert(
        id: _sosAlerts.length + 1,
        societyId: 1,
        flatNumber: _currentFlat,
        raisedByName: _currentUserName,
        emergencyType: type,
        description: note,
        status: SosStatus.active,
        raisedAt: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  void acknowledgeSos(int id, String guardName) {
    final idx = _sosAlerts.indexWhere((a) => a.id == id);
    if (idx != -1) {
      final a = _sosAlerts[idx];
      _sosAlerts[idx] = SosAlert(
        id: a.id,
        societyId: a.societyId,
        flatNumber: a.flatNumber,
        raisedByName: a.raisedByName,
        emergencyType: a.emergencyType,
        description: a.description,
        status: SosStatus.acknowledged,
        acknowledgedByName: guardName,
        acknowledgedAt: DateTime.now(),
        raisedAt: a.raisedAt,
      );
      notifyListeners();
    }
  }

  void resolveSos(int id, String resolverName, String notes) {
    final idx = _sosAlerts.indexWhere((a) => a.id == id);
    if (idx != -1) {
      final a = _sosAlerts[idx];
      _sosAlerts[idx] = SosAlert(
        id: a.id,
        societyId: a.societyId,
        flatNumber: a.flatNumber,
        raisedByName: a.raisedByName,
        emergencyType: a.emergencyType,
        description: a.description,
        status: SosStatus.resolved,
        acknowledgedByName: a.acknowledgedByName,
        acknowledgedAt: a.acknowledgedAt,
        resolvedByName: resolverName,
        resolvedAt: DateTime.now(),
        resolutionNotes: notes,
        raisedAt: a.raisedAt,
      );
      notifyListeners();
    }
  }

  // ==========================================
  // MODULE 7: SAAS SUPER ADMIN & SUBSCRIPTIONS
  // ==========================================
  final List<SocietySubscription> _subscriptions = [
    SocietySubscription(
      id: 1,
      societyId: 1,
      societyName: 'Shree Samarth Co-op Housing Society',
      tier: SubscriptionTier.pro,
      flatCount: 35,
      ratePerFlat: 25.0,
      monthlyTotal: 875.0,
      billingCycle: 'Monthly',
      status: 'active',
      nextRenewalDate: DateTime.now().add(const Duration(days: 18)),
      contactEmail: 'committee@samarthsociety.in',
      contactPhone: '9822011223',
      createdAt: DateTime.now().subtract(const Duration(days: 90)),
    ),
    SocietySubscription(
      id: 2,
      societyId: 2,
      societyName: 'Godrej Horizon Township (Phase 1)',
      tier: SubscriptionTier.enterprise,
      flatCount: 480,
      ratePerFlat: 35.0,
      monthlyTotal: 16800.0,
      billingCycle: 'Quarterly',
      status: 'active',
      nextRenewalDate: DateTime.now().add(const Duration(days: 42)),
      contactEmail: 'estate.manager@godrejhorizon.com',
      contactPhone: '9820099881',
      createdAt: DateTime.now().subtract(const Duration(days: 120)),
    ),
    SocietySubscription(
      id: 3,
      societyId: 3,
      societyName: 'Shivneri Residency Wing A-D',
      tier: SubscriptionTier.starter,
      flatCount: 64,
      ratePerFlat: 15.0,
      monthlyTotal: 960.0,
      billingCycle: 'Monthly',
      status: 'trial',
      nextRenewalDate: DateTime.now().add(const Duration(days: 4)),
      contactEmail: 'shivneri.society@gmail.com',
      contactPhone: '9765001122',
      createdAt: DateTime.now().subtract(const Duration(days: 10)),
    ),
    SocietySubscription(
      id: 4,
      societyId: 4,
      societyName: 'Panchsheel Heights CHS',
      tier: SubscriptionTier.pro,
      flatCount: 110,
      ratePerFlat: 25.0,
      monthlyTotal: 2750.0,
      billingCycle: 'Monthly',
      status: 'active',
      nextRenewalDate: DateTime.now().add(const Duration(days: 11)),
      contactEmail: 'chairman@panchsheelchs.org',
      contactPhone: '9922334455',
      createdAt: DateTime.now().subtract(const Duration(days: 45)),
    ),
  ];

  List<SocietySubscription> get subscriptions => _subscriptions;

  SaasMetricSummary get saasMetrics {
    int totalSoc = _subscriptions.length;
    int activeSoc = _subscriptions.where((s) => s.status == 'active').length;
    int trialSoc = _subscriptions.where((s) => s.status == 'trial').length;
    int flats = 0;
    double mrr = 0.0;

    for (final s in _subscriptions) {
      flats += s.flatCount;
      if (s.status == 'active') {
        mrr += s.monthlyTotal;
      }
    }

    return SaasMetricSummary(
      totalSocieties: totalSoc,
      activeSubscriptions: activeSoc,
      trialSocieties: trialSoc,
      totalManagedFlats: flats,
      monthlyRecurringRevenue: mrr,
      averageRevenuePerSociety: totalSoc > 0 ? mrr / totalSoc : 0.0,
    );
  }

  void onboardSociety({
    required String name,
    required int flats,
    required SubscriptionTier tier,
    required String email,
    required String phone,
  }) {
    double rate = tier == SubscriptionTier.starter
        ? 15.0
        : tier == SubscriptionTier.pro
            ? 25.0
            : 35.0;
    _subscriptions.insert(
      0,
      SocietySubscription(
        id: _subscriptions.length + 1,
        societyId: _subscriptions.length + 1,
        societyName: name,
        tier: tier,
        flatCount: flats,
        ratePerFlat: rate,
        monthlyTotal: flats * rate,
        billingCycle: 'Monthly',
        status: 'trial',
        nextRenewalDate: DateTime.now().add(const Duration(days: 14)),
        contactEmail: email,
        contactPhone: phone,
        createdAt: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
