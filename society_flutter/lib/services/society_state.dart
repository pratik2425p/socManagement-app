import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';

class SocietyState extends ChangeNotifier {
  final Client client;

  UserRole _currentRole = UserRole.resident;
  String _societyName = 'Shree Samarth Co-op Housing Society';
  String _currentFlat = 'A-304';
  final String _currentUserName = 'Vicky Patil';
  bool _isLoading = false;

  UserRole get currentRole => _currentRole;
  String get societyName => _societyName;
  String get currentFlat => _currentFlat;
  String get currentUserName => _currentUserName;
  bool get isLoading => _isLoading;

  SocietyState({required this.client}) {
    fetchInitialData();
  }

  void setRole(UserRole role) {
    _currentRole = role;
    notifyListeners();
  }

  void setFlat(String flat) {
    _currentFlat = flat;
    notifyListeners();
  }

  // Real Database Collections
  List<MaintenanceBill> _bills = [];
  List<VisitorEntry> _visitors = [];
  List<VoucherRequest> _vouchers = [];
  List<LedgerEntry> _ledgerEntries = [];
  List<Complaint> _complaints = [];
  List<Notice> _notices = [];
  List<SocietyDocument> _documents = [];
  List<MeetingMinutes> _meetingMinutes = [];
  List<SocietyPoll> _polls = [];
  final Map<int, List<PollOption>> _pollOptions = {};
  final Set<String> _votedPollFlats = {};
  List<SosAlert> _sosAlerts = [];
  List<SocietySubscription> _subscriptions = [];
  SaasMetricSummary? _saasMetrics;

  List<MaintenanceBill> get bills => _bills;
  List<VisitorEntry> get visitors => _visitors;
  List<VoucherRequest> get vouchers => _vouchers;
  List<LedgerEntry> get ledgerEntries => _ledgerEntries;
  List<Complaint> get complaints => _complaints;
  List<Notice> get notices => _notices;
  List<SocietyDocument> get documents => _documents;
  List<MeetingMinutes> get meetingMinutes => _meetingMinutes;
  List<SocietyPoll> get polls => _polls;
  List<PollOption> getPollOptions(int pollId) => _pollOptions[pollId] ?? [];
  List<SosAlert> get sosAlerts => _sosAlerts;
  List<SosAlert> get activeSosAlerts =>
      _sosAlerts.where((a) => a.status != SosStatus.resolved).toList();
  List<SocietySubscription> get subscriptions => _subscriptions;
  SaasMetricSummary get saasMetrics =>
      _saasMetrics ??
      SaasMetricSummary(
        totalSocieties: _subscriptions.length,
        activeSubscriptions: _subscriptions.where((s) => s.status == 'active').length,
        trialSocieties: _subscriptions.where((s) => s.status == 'trial').length,
        totalManagedFlats: _subscriptions.fold(0, (sum, s) => sum + s.flatCount),
        monthlyRecurringRevenue: _subscriptions
            .where((s) => s.status == 'active')
            .fold(0.0, (sum, s) => sum + s.monthlyTotal),
        averageRevenuePerSociety: 0.0,
      );

  bool hasFlatVoted(int pollId, String flatNumber) {
    return _votedPollFlats.contains('$pollId-$flatNumber');
  }

  // --- Real API Data Fetching ---
  Future<void> fetchInitialData() async {
    _isLoading = true;
    notifyListeners();

    try {
      final socs = await client.society.getSocieties();
      if (socs.isNotEmpty) {
        _societyName = socs.first.name;
      }

      await Future.wait([
        _loadBills(),
        _loadVisitors(),
        _loadVouchers(),
        _loadLedger(),
        _loadComplaints(),
        _loadNotices(),
        _loadDocuments(),
        _loadMeetingMinutes(),
        _loadPolls(),
        _loadSosAlerts(),
        _loadSubscriptions(),
      ]);
    } catch (e) {
      debugPrint('[SocietyState] API Fetch Error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _loadBills() async {
    try {
      _bills = await client.maintenance.getBills(1);
    } catch (e) {
      debugPrint('Error loading bills: $e');
    }
  }

  Future<void> _loadVisitors() async {
    try {
      _visitors = await client.visitor.getVisitors(1);
    } catch (e) {
      debugPrint('Error loading visitors: $e');
    }
  }

  Future<void> _loadVouchers() async {
    try {
      _vouchers = await client.accounting.getVouchers(1);
    } catch (e) {
      debugPrint('Error loading vouchers: $e');
    }
  }

  Future<void> _loadLedger() async {
    try {
      _ledgerEntries = await client.accounting.getLedgerEntries(1);
    } catch (e) {
      debugPrint('Error loading ledger: $e');
    }
  }

  Future<void> _loadComplaints() async {
    try {
      _complaints = await client.communication.getComplaints(1);
    } catch (e) {
      debugPrint('Error loading complaints: $e');
    }
  }

  Future<void> _loadNotices() async {
    try {
      _notices = await client.communication.getNotices(1);
    } catch (e) {
      debugPrint('Error loading notices: $e');
    }
  }

  Future<void> _loadDocuments() async {
    try {
      _documents = await client.document.getDocuments(1, includeCommitteeOnly: true);
    } catch (e) {
      debugPrint('Error loading documents: $e');
    }
  }

  Future<void> _loadMeetingMinutes() async {
    try {
      _meetingMinutes = await client.document.getMeetingMinutes(1);
    } catch (e) {
      debugPrint('Error loading meeting minutes: $e');
    }
  }

  Future<void> _loadPolls() async {
    try {
      _polls = await client.poll.getPolls(1);
      for (final p in _polls) {
        if (p.id != null) {
          _pollOptions[p.id!] = await client.poll.getPollOptions(p.id!);
        }
      }
    } catch (e) {
      debugPrint('Error loading polls: $e');
    }
  }

  Future<void> _loadSosAlerts() async {
    try {
      _sosAlerts = await client.sos.getActiveSosAlerts(1);
    } catch (e) {
      debugPrint('Error loading SOS alerts: $e');
    }
  }

  Future<void> _loadSubscriptions() async {
    try {
      _subscriptions = await client.saasAdmin.getAllSubscriptions();
      _saasMetrics = await client.saasAdmin.getMetricSummary();
    } catch (e) {
      debugPrint('Error loading subscriptions: $e');
    }
  }

  // --- Real Database Actions ---

  Future<void> payBill(String billNumber) async {
    final idx = _bills.indexWhere((b) => b.billNumber == billNumber);
    if (idx != -1) {
      final bill = _bills[idx];
      try {
        final payment = PaymentRecord(
          societyId: 1,
          billId: bill.id ?? 1,
          flatId: bill.flatId,
          flatNumber: bill.flatNumber,
          payerName: _currentUserName,
          amount: bill.amount,
          paymentMethod: 'UPI',
          transactionReference: 'UPI-TXN-${DateTime.now().millisecondsSinceEpoch}',
          receiptNumber: 'RCP-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
          paymentDate: DateTime.now(),
          isVerified: true,
        );
        await client.maintenance.recordPayment(payment);
        await _loadBills();
        await _loadLedger();
        notifyListeners();
      } catch (e) {
        debugPrint('Error recording payment: $e');
      }
    }
  }

  Future<void> preApproveVisitor({
    required String name,
    required String phone,
    required String purpose,
    String? vehicle,
  }) async {
    final passcode = (1000 + (DateTime.now().millisecondsSinceEpoch % 9000)).toString();
    final entry = VisitorEntry(
      societyId: 1,
      flatNumber: _currentFlat,
      visitorName: name,
      phoneNumber: phone,
      purpose: purpose,
      vehicleNumber: vehicle,
      passcode: passcode,
      status: VisitorStatus.expected,
      entryGate: 'Main Gate 1',
    );
    try {
      await client.visitor.createVisitorEntry(entry);
      await _loadVisitors();
      notifyListeners();
    } catch (e) {
      debugPrint('Error creating visitor: $e');
    }
  }

  Future<void> guardRecordEntry({
    required String visitorName,
    required String phone,
    required String flatNumber,
    required String purpose,
    String? vehicle,
  }) async {
    final entry = VisitorEntry(
      societyId: 1,
      flatNumber: flatNumber,
      visitorName: visitorName,
      phoneNumber: phone,
      purpose: purpose,
      vehicleNumber: vehicle,
      status: VisitorStatus.waitingApproval,
      entryGate: 'Main Gate 1',
      checkInTime: DateTime.now(),
    );
    try {
      await client.visitor.createVisitorEntry(entry);
      await _loadVisitors();
      notifyListeners();
    } catch (e) {
      debugPrint('Error guard recording entry: $e');
    }
  }

  Future<bool> guardVerifyPasscode(String passcode) async {
    try {
      final verified = await client.visitor.verifyVisitorPasscode(1, passcode);
      if (verified != null && verified.id != null) {
        await client.visitor.updateVisitorStatus(verified.id!, VisitorStatus.inside);
        await _loadVisitors();
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint('Error verifying passcode: $e');
    }
    return false;
  }

  Future<void> updateVisitorStatus(int id, VisitorStatus status) async {
    try {
      await client.visitor.updateVisitorStatus(id, status);
      await _loadVisitors();
      notifyListeners();
    } catch (e) {
      debugPrint('Error updating visitor status: $e');
    }
  }

  Future<void> createVoucher({
    required String title,
    required String description,
    required double amount,
    required String category,
  }) async {
    final vchNumber = 'VCH-2026-${(100 + _vouchers.length + 1).toString()}';
    final req = VoucherRequest(
      societyId: 1,
      voucherNumber: vchNumber,
      title: title,
      description: description,
      amount: amount,
      category: category,
      requestedByName: '$_currentUserName (Committee)',
      status: VoucherStatus.pendingApproval,
      createdAt: DateTime.now(),
    );
    try {
      await client.accounting.createVoucherRequest(req);
      await _loadVouchers();
      notifyListeners();
    } catch (e) {
      debugPrint('Error creating voucher: $e');
    }
  }

  Future<void> approveVoucher(int id) async {
    try {
      await client.accounting.approveVoucher(id, '$_currentUserName (Chairman)');
      await _loadVouchers();
      notifyListeners();
    } catch (e) {
      debugPrint('Error approving voucher: $e');
    }
  }

  Future<void> rejectVoucher(int id, String reason) async {
    try {
      await client.accounting.rejectVoucher(id, reason);
      await _loadVouchers();
      notifyListeners();
    } catch (e) {
      debugPrint('Error rejecting voucher: $e');
    }
  }

  Future<void> postVoucherToLedger(int voucherId) async {
    final v = _vouchers.firstWhere((item) => item.id == voucherId);
    try {
      await client.accounting.postVoucherToLedger(
        voucherId,
        '$_currentUserName (Accountant)',
        'Settled expense: ${v.title} (${v.voucherNumber})',
        v.amount,
        v.amount,
      );
      await _loadVouchers();
      await _loadLedger();
      notifyListeners();
    } catch (e) {
      debugPrint('Error posting voucher to ledger: $e');
    }
  }

  Future<void> addComplaint({
    required String title,
    required String description,
    required String category,
  }) async {
    final cmp = Complaint(
      societyId: 1,
      flatNumber: _currentFlat,
      reportedByName: _currentUserName,
      title: title,
      description: description,
      category: category,
      status: ComplaintStatus.open,
      createdAt: DateTime.now(),
    );
    try {
      await client.communication.createComplaint(cmp);
      await _loadComplaints();
      notifyListeners();
    } catch (e) {
      debugPrint('Error adding complaint: $e');
    }
  }

  Future<void> updateComplaintStatus(int id, ComplaintStatus status, {String? notes}) async {
    try {
      await client.communication.updateComplaintStatus(id, status, notes);
      await _loadComplaints();
      notifyListeners();
    } catch (e) {
      debugPrint('Error updating complaint status: $e');
    }
  }

  Future<void> publishNotice({
    required String title,
    required String content,
    required String category,
    required String priority,
  }) async {
    final notice = Notice(
      societyId: 1,
      title: title,
      content: content,
      category: category,
      priority: priority,
      postedByName: '$_currentUserName (Committee)',
      postedAt: DateTime.now(),
    );
    try {
      await client.communication.createNotice(notice);
      await _loadNotices();
      notifyListeners();
    } catch (e) {
      debugPrint('Error publishing notice: $e');
    }
  }

  Future<void> uploadDocument({
    required String title,
    required String description,
    required DocumentCategory category,
    required String fileSize,
    required bool isCommitteeOnly,
  }) async {
    final doc = SocietyDocument(
      societyId: 1,
      title: title,
      description: description,
      category: category,
      fileUrl: 'https://society.storage/${title.toLowerCase().replaceAll(' ', '_')}.pdf',
      fileSize: fileSize,
      uploadedByName: _currentUserName,
      isCommitteeOnly: isCommitteeOnly,
      uploadedAt: DateTime.now(),
    );
    try {
      await client.document.uploadDocument(doc);
      await _loadDocuments();
      notifyListeners();
    } catch (e) {
      debugPrint('Error uploading document: $e');
    }
  }

  Future<bool> castVote({
    required int pollId,
    required String flatNumber,
    required int optionId,
  }) async {
    final key = '$pollId-$flatNumber';
    if (_votedPollFlats.contains(key)) return false;

    try {
      final success = await client.poll.castVote(
        pollId,
        flatNumber,
        _currentUserName,
        optionId,
      );
      if (success) {
        _votedPollFlats.add(key);
        await _loadPolls();
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint('Error casting vote: $e');
    }
    return false;
  }

  Future<void> triggerSos({
    required EmergencyType type,
    String? note,
  }) async {
    final alert = SosAlert(
      societyId: 1,
      flatNumber: _currentFlat,
      raisedByName: _currentUserName,
      emergencyType: type,
      description: note,
      status: SosStatus.active,
      raisedAt: DateTime.now(),
    );
    try {
      await client.sos.raiseSosAlert(alert);
      await _loadSosAlerts();
      notifyListeners();
    } catch (e) {
      debugPrint('Error triggering SOS: $e');
    }
  }

  Future<void> acknowledgeSos(int id, String guardName) async {
    try {
      await client.sos.acknowledgeSos(id, guardName);
      await _loadSosAlerts();
      notifyListeners();
    } catch (e) {
      debugPrint('Error acknowledging SOS: $e');
    }
  }

  Future<void> resolveSos(int id, String resolverName, String notes) async {
    try {
      await client.sos.resolveSos(id, resolverName, notes);
      await _loadSosAlerts();
      notifyListeners();
    } catch (e) {
      debugPrint('Error resolving SOS: $e');
    }
  }

  Future<void> onboardSociety({
    required String name,
    required int flats,
    required SubscriptionTier tier,
    required String email,
    required String phone,
  }) async {
    final double rate = tier == SubscriptionTier.starter
        ? 15.0
        : tier == SubscriptionTier.pro
            ? 25.0
            : 35.0;

    final sub = SocietySubscription(
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
    );

    try {
      await client.saasAdmin.createSubscription(sub);
      await _loadSubscriptions();
      notifyListeners();
    } catch (e) {
      debugPrint('Error onboarding society: $e');
    }
  }
}
