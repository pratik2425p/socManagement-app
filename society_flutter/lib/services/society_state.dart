import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import 'extended_features.dart';

class SocietyState extends ChangeNotifier {
  final Client client;

  UserRole _currentRole = UserRole.chairman;
  String _societyName = '';
  String _currentFlat = '';
  String _currentUserName = '';
  bool _isLoading = false;
  bool _isLoggedIn = false;
  SocietyUser? _activeUser;
  List<SocietyUser> _users = [];
  Society? _currentSociety;

  UserRole get currentRole => _currentRole;
  String get societyName => _societyName;
  String get currentFlat => _currentFlat;
  String get currentUserName => _currentUserName;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;
  SocietyUser? get activeUser => _activeUser;
  List<SocietyUser> get users => _users;
  Society? get currentSociety => _currentSociety;

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
  List<Society> _societies = [];
  List<Building> _buildings = [];
  List<Flat> _flats = [];
  List<SocietyInvitation> _invitations = [];
  int _currentSocietyId = 1;

  static final List<Amenity> defaultAmenities = [
    const Amenity(
      id: 'amenity-clubhouse',
      name: 'Clubhouse Banquet Hall',
      icon: Icons.celebration,
      capacity: 100,
      rate: 2500.0,
      unit: 'per event slot',
      timeSlots: ['09:00 AM - 01:00 PM', '02:00 PM - 06:00 PM', '07:00 PM - 11:00 PM'],
      description: 'Air-conditioned community hall with dining space and stage for family functions and meetings.',
      rules: 'Music allowed till 10 PM. Mandatory cleaning deposit required.',
    ),
    const Amenity(
      id: 'amenity-pool',
      name: 'Swimming Pool',
      icon: Icons.pool,
      capacity: 20,
      rate: 0.0,
      unit: 'free for residents',
      timeSlots: ['06:00 AM - 07:30 AM', '07:30 AM - 09:00 AM', '05:00 PM - 06:30 PM', '06:30 PM - 08:00 PM'],
      description: 'Temperature regulated clean swimming pool with toddler shallow section and lifeguard.',
      rules: 'Proper nylon/spandex swimming costumes compulsory. Shower before entering.',
    ),
    const Amenity(
      id: 'amenity-turf',
      name: 'Badminton & Tennis Court',
      icon: Icons.sports_tennis,
      capacity: 8,
      rate: 150.0,
      unit: 'per hour',
      timeSlots: ['06:00 AM - 07:00 AM', '07:00 AM - 08:00 AM', '06:00 PM - 07:00 PM', '07:00 PM - 08:00 PM', '08:00 PM - 09:00 PM'],
      description: 'Synthetic rubberized multi-sport court with floodlights and spectator seating.',
      rules: 'Non-marking sports shoes only. Maximum 1 hour consecutive booking per flat.',
    ),
    const Amenity(
      id: 'amenity-gym',
      name: 'Gymnasium & Fitness Studio',
      icon: Icons.fitness_center,
      capacity: 25,
      rate: 0.0,
      unit: 'free for residents',
      timeSlots: ['06:00 AM - 10:00 AM', '05:00 PM - 09:30 PM'],
      description: 'Modern cardio machines, free weights, treadmills, and yoga/aerobics floor.',
      rules: 'Towels and clean gym shoes mandatory. Sanitize equipment after use.',
    ),
    const Amenity(
      id: 'amenity-terrace',
      name: 'Rooftop Community Lounge',
      icon: Icons.deck,
      capacity: 40,
      rate: 1000.0,
      unit: 'per evening slot',
      timeSlots: ['06:00 PM - 09:00 PM', '09:00 PM - 11:30 PM'],
      description: 'Scenic terrace deck with ambient lighting and BBQ counter for small gatherings.',
      rules: 'No open fire allowed. Respect silence hours after 10 PM.',
    ),
  ];

  final List<AmenityBooking> _amenityBookings = [];
  final List<AuditLogEntry> _auditLogs = [];
  final List<TenantNocRecord> _tenantNocs = [];

  List<Amenity> get amenities => defaultAmenities;
  List<AmenityBooking> get amenityBookings => _amenityBookings;
  List<AuditLogEntry> get auditLogs => _auditLogs;
  List<TenantNocRecord> get tenantNocs => _tenantNocs;

  List<MaintenanceBill> get bills => _bills;
  List<VisitorEntry> get visitors => _visitors;
  List<VoucherRequest> get vouchers => _vouchers;
  List<LedgerEntry> get ledgerEntries => _ledgerEntries;
  List<Complaint> get complaints => _complaints;
  List<Notice> get notices => _notices;
  List<SocietyDocument> get documents => _documents;
  List<MeetingMinutes> get meetingMinutes => _meetingMinutes;
  List<SocietyPoll> get polls => _polls;
  List<Society> get societies => _societies;
  List<Building> get buildings => _buildings;
  List<Flat> get flats => _flats;
  List<SocietyInvitation> get invitations => _invitations;
  int get currentSocietyId => _currentSocietyId;
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
      _societies = socs;
      if (socs.isNotEmpty) {
        _currentSociety = socs.first;
        _societyName = socs.first.name;
        _currentSocietyId = socs.first.id ?? 1;
      }

      await Future.wait([
        _loadUsers(),
        _loadBuildings(),
        _loadFlats(),
        _loadInvitations(),
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

  void setActiveUser(SocietyUser user) async {
    _isLoggedIn = true;
    _activeUser = user;
    _currentUserName = user.fullName;
    _currentRole = user.role;
    _currentSocietyId = user.societyId;
    if (user.flatNumber != null && user.flatNumber!.isNotEmpty) {
      _currentFlat = user.flatNumber!;
    }
    try {
      final soc = await client.society.getSocietyById(user.societyId);
      if (soc != null) {
        _currentSociety = soc;
        _societyName = soc.name;
      }
    } catch (_) {}
    notifyListeners();
  }

  Future<SocietyUser?> loginWithPhone(String phone) async {
    _isLoading = true;
    notifyListeners();
    try {
      final user = await client.society.loginWithPhone(phone.trim());
      if (user != null) {
        _isLoggedIn = true;
        _activeUser = user;
        _currentUserName = user.fullName;
        _currentRole = user.role;
        _currentSocietyId = user.societyId;
        if (user.flatNumber != null && user.flatNumber!.isNotEmpty) {
          _currentFlat = user.flatNumber!;
        }

        final soc = await client.society.getSocietyById(user.societyId);
        if (soc != null) {
          _currentSociety = soc;
          _societyName = soc.name;
        }

        await Future.wait([
          _loadUsers(),
          _loadBuildings(),
          _loadFlats(),
          _loadInvitations(),
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
        return user;
      }
      return null;
    } catch (e) {
      debugPrint('Error logging in with phone: $e');
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void logout() {
    _isLoggedIn = false;
    _activeUser = null;
    _currentSociety = null;
    _currentUserName = '';
    _societyName = '';
    _currentFlat = '';
    _bills = [];
    _visitors = [];
    _vouchers = [];
    _ledgerEntries = [];
    _complaints = [];
    _notices = [];
    _documents = [];
    _meetingMinutes = [];
    _polls = [];
    _sosAlerts = [];
    notifyListeners();
  }

  Future<SocietyUser?> createNewUser({
    required String fullName,
    required String phone,
    required String email,
    required UserRole role,
    String? flatNumber,
    bool makeActive = true,
  }) async {
    final newUser = SocietyUser(
      societyId: _currentSocietyId,
      fullName: fullName,
      phone: phone,
      email: email,
      role: role,
      flatNumber: flatNumber,
      status: 'active',
      createdAt: DateTime.now(),
    );

    try {
      final created = await client.society.createSocietyUser(newUser);
      await _loadUsers();
      if (makeActive) {
        setActiveUser(created);
      }
      notifyListeners();
      return created;
    } catch (e) {
      debugPrint('Error creating new user: $e');
      return null;
    }
  }

  Future<void> refreshUsers() async {
    await _loadUsers();
    notifyListeners();
  }

  Future<void> _loadUsers() async {
    try {
      _users = await client.society.getSocietyUsers(_currentSocietyId);
    } catch (e) {
      debugPrint('Error loading users: $e');
    }
  }

  Future<void> _loadBills() async {
    try {
      _bills = await client.maintenance.getBills(_currentSocietyId);
    } catch (e) {
      debugPrint('Error loading bills: $e');
    }
  }

  Future<void> _loadVisitors() async {
    try {
      _visitors = await client.visitor.getVisitors(_currentSocietyId);
    } catch (e) {
      debugPrint('Error loading visitors: $e');
    }
  }

  Future<void> _loadVouchers() async {
    try {
      _vouchers = await client.accounting.getVouchers(_currentSocietyId);
    } catch (e) {
      debugPrint('Error loading vouchers: $e');
    }
  }

  Future<void> _loadLedger() async {
    try {
      _ledgerEntries = await client.accounting.getLedgerEntries(_currentSocietyId);
    } catch (e) {
      debugPrint('Error loading ledger: $e');
    }
  }

  Future<void> _loadComplaints() async {
    try {
      _complaints = await client.communication.getComplaints(_currentSocietyId);
    } catch (e) {
      debugPrint('Error loading complaints: $e');
    }
  }

  Future<void> _loadNotices() async {
    try {
      _notices = await client.communication.getNotices(_currentSocietyId);
    } catch (e) {
      debugPrint('Error loading notices: $e');
    }
  }

  Future<void> _loadDocuments() async {
    try {
      _documents = await client.document.getDocuments(_currentSocietyId, includeCommitteeOnly: true);
    } catch (e) {
      debugPrint('Error loading documents: $e');
    }
  }

  Future<void> _loadMeetingMinutes() async {
    try {
      _meetingMinutes = await client.document.getMeetingMinutes(_currentSocietyId);
    } catch (e) {
      debugPrint('Error loading meeting minutes: $e');
    }
  }

  Future<void> _loadPolls() async {
    try {
      _polls = await client.poll.getPolls(_currentSocietyId);
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
      _sosAlerts = await client.sos.getActiveSosAlerts(_currentSocietyId);
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

  Future<void> loadSocieties() async {
    try {
      _societies = await client.society.getSocieties();
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading societies: $e');
    }
  }

  Future<void> switchSociety(Society society) async {
    _currentSocietyId = society.id ?? 1;
    _societyName = society.name;
    await Future.wait([
      _loadUsers(),
      _loadBuildings(),
      _loadFlats(),
      _loadInvitations(),
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
    ]);
    notifyListeners();
  }

  Future<void> _loadBuildings() async {
    try {
      _buildings = await client.society.getBuildings(_currentSocietyId);
    } catch (e) {
      debugPrint('Error loading buildings: $e');
    }
  }

  Future<void> _loadFlats() async {
    try {
      _flats = await client.society.getFlats(_currentSocietyId);
    } catch (e) {
      debugPrint('Error loading flats: $e');
    }
  }

  Future<void> _loadInvitations() async {
    try {
      _invitations = await client.society.getInvitations(_currentSocietyId);
    } catch (e) {
      debugPrint('Error loading invitations: $e');
    }
  }

  Future<void> refreshInvitations() async {
    await _loadInvitations();
    notifyListeners();
  }

  Future<Society?> onboardNewSociety({
    required String name,
    required String code,
    required String address,
    required String city,
    required String stateName,
    required String pincode,
    required int totalFlats,
    required String planName,
    required String adminName,
    required String adminPhone,
    required String adminEmail,
  }) async {
    final society = Society(
      name: name,
      code: code.toUpperCase(),
      address: address,
      city: city,
      state: stateName,
      pincode: pincode,
      totalFlats: totalFlats,
      subscriptionPlan: planName,
      subscriptionStatus: 'active',
      createdAt: DateTime.now(),
    );

    try {
      final created = await client.society.onboardNewSocietyWithAdmin(
        society,
        adminName,
        adminPhone,
        adminEmail,
        planName,
      );
      await loadSocieties();
      await _loadSubscriptions();
      notifyListeners();
      return created;
    } catch (e) {
      debugPrint('Error onboarding new society: $e');
      return null;
    }
  }

  Future<Building?> addBuilding({
    required String name,
    required int totalFloors,
  }) async {
    final b = Building(
      societyId: _currentSocietyId,
      name: name,
      totalFloors: totalFloors,
      createdAt: DateTime.now(),
    );
    try {
      final created = await client.society.createBuilding(b);
      await _loadBuildings();
      notifyListeners();
      return created;
    } catch (e) {
      debugPrint('Error creating building: $e');
      return null;
    }
  }

  Future<int> autoGenerateFlatsForWing({
    required int buildingId,
    required String wingName,
    required int floors,
    required int flatsPerFloor,
    double sqFt = 950.0,
  }) async {
    final newFlats = <Flat>[];
    for (int floor = 1; floor <= floors; floor++) {
      for (int unit = 1; unit <= flatsPerFloor; unit++) {
        final flatNum = '$wingName-${floor * 100 + unit}';
        if (!_flats.any((f) => f.flatNumber == flatNum)) {
          newFlats.add(Flat(
            societyId: _currentSocietyId,
            buildingId: buildingId,
            flatNumber: flatNum,
            floor: floor,
            squareFeet: sqFt,
            intercomNumber: '${floor * 100 + unit}',
            status: 'unassigned',
          ));
        }
      }
    }

    if (newFlats.isEmpty) return 0;
    try {
      final inserted = await client.society.bulkCreateFlats(newFlats);
      await _loadFlats();
      notifyListeners();
      return inserted.length;
    } catch (e) {
      debugPrint('Error auto-generating flats: $e');
      return 0;
    }
  }

  Future<SocietyInvitation?> sendInvitation({
    required String flatNumber,
    required String inviteeName,
    required String phone,
    String? email,
    UserRole role = UserRole.resident,
    String occupancyType = 'owner',
  }) async {
    final randomSuffix = (1000 + DateTime.now().millisecond * 7 % 9000).toString();
    final cleanFlat = flatNumber.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
    final code = 'INV-$cleanFlat-$randomSuffix'.toUpperCase();

    final inv = SocietyInvitation(
      societyId: _currentSocietyId,
      flatNumber: flatNumber,
      inviteeName: inviteeName,
      phone: phone,
      email: email,
      role: role,
      occupancyType: occupancyType,
      inviteCode: code,
      status: 'pending',
      expiresAt: DateTime.now().add(const Duration(days: 14)),
      createdAt: DateTime.now(),
    );

    try {
      final created = await client.society.createInvitation(inv);
      await _loadInvitations();
      notifyListeners();
      return created;
    } catch (e) {
      debugPrint('Error creating invitation: $e');
      return null;
    }
  }

  Future<int> bulkImportMembersAndInvite(List<SocietyInvitation> invites) async {
    try {
      final inserted = await client.society.bulkCreateInvitations(invites);
      await _loadInvitations();
      notifyListeners();
      return inserted.length;
    } catch (e) {
      debugPrint('Error bulk importing invitations: $e');
      return 0;
    }
  }

  Future<SocietyUser?> acceptMemberInvitation({
    required String inviteCode,
    required String phone,
  }) async {
    try {
      final user = await client.society.verifyAndAcceptInvitation(inviteCode, phone);
      if (user != null) {
        await _loadUsers();
        await _loadInvitations();
        setActiveUser(user);
        notifyListeners();
      }
      return user;
    } catch (e) {
      debugPrint('Error accepting invitation: $e');
      return null;
    }
  }

  // --- Extended Features: Audit Trail, Amenities, and Tenancy ---

  void recordAuditEvent({
    required String category,
    required String action,
    required String target,
    required String description,
  }) {
    final entry = AuditLogEntry(
      id: 'AUD-${DateTime.now().millisecondsSinceEpoch}',
      societyId: _currentSocietyId,
      category: category,
      action: action,
      actorName: _currentUserName.isNotEmpty ? _currentUserName : 'System Admin',
      actorRole: _currentRole.name.toUpperCase(),
      target: target,
      description: description,
      timestamp: DateTime.now(),
    );
    _auditLogs.insert(0, entry);
    notifyListeners();
  }

  Future<bool> bookAmenity({
    required String amenityId,
    required String amenityName,
    required DateTime date,
    required String slot,
    required double amount,
  }) async {
    // Collision check for same amenity, date, and slot
    final collision = _amenityBookings.any((b) =>
        b.amenityId == amenityId &&
        b.status == 'confirmed' &&
        b.bookingDate.year == date.year &&
        b.bookingDate.month == date.month &&
        b.bookingDate.day == date.day &&
        b.slot == slot);

    if (collision) return false;

    final booking = AmenityBooking(
      id: 'BK-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
      societyId: _currentSocietyId,
      amenityId: amenityId,
      amenityName: amenityName,
      flatNumber: _currentFlat.isNotEmpty ? _currentFlat : 'Flat Office',
      bookedByName: _currentUserName.isNotEmpty ? _currentUserName : 'Resident',
      bookingDate: date,
      slot: slot,
      amountPaid: amount,
      status: 'confirmed',
      createdAt: DateTime.now(),
    );

    _amenityBookings.insert(0, booking);
    recordAuditEvent(
      category: 'Amenity',
      action: 'AMENITY_RESERVED',
      target: '$amenityName ($slot)',
      description: 'Flat ${_currentFlat.isNotEmpty ? _currentFlat : "Office"} reserved $amenityName for ${date.day}/${date.month}/${date.year} ($slot)',
    );
    notifyListeners();
    return true;
  }

  void cancelAmenityBooking(String bookingId) {
    final idx = _amenityBookings.indexWhere((b) => b.id == bookingId);
    if (idx != -1) {
      final b = _amenityBookings[idx];
      _amenityBookings.removeAt(idx);
      recordAuditEvent(
        category: 'Amenity',
        action: 'AMENITY_CANCELLED',
        target: '${b.amenityName} (${b.slot})',
        description: 'Flat ${b.flatNumber} cancelled booking ${b.id}',
      );
      notifyListeners();
    }
  }

  TenantNocRecord issueTenantNoc({
    required String flatNumber,
    required String ownerName,
    required String ownerPhone,
    required String tenantName,
    required String tenantPhone,
    required DateTime leaseStart,
    required DateTime leaseEnd,
    required double monthlyRent,
  }) {
    final noc = TenantNocRecord(
      id: 'NOC-${DateTime.now().millisecondsSinceEpoch.toString().substring(6)}',
      societyId: _currentSocietyId,
      flatNumber: flatNumber,
      ownerName: ownerName,
      ownerPhone: ownerPhone,
      tenantName: tenantName,
      tenantPhone: tenantPhone,
      leaseStart: leaseStart,
      leaseEnd: leaseEnd,
      monthlyRent: monthlyRent,
      nocNumber: 'MH/CHS/NOC/${DateTime.now().year}/${(100 + _tenantNocs.length + 1)}',
      status: 'Approved',
      issuedAt: DateTime.now(),
    );
    _tenantNocs.insert(0, noc);
    recordAuditEvent(
      category: 'Member & Flat',
      action: 'TENANT_NOC_ISSUED',
      target: 'Flat $flatNumber ($tenantName)',
      description: 'Tenancy NOC ${noc.nocNumber} granted for $tenantName by owner $ownerName until ${leaseEnd.day}/${leaseEnd.month}/${leaseEnd.year}',
    );
    notifyListeners();
    return noc;
  }

  // --- Real Database Actions ---

  Future<PaymentRecord?> payBill(String billNumber, {String paymentMethod = 'UPI'}) async {
    final idx = _bills.indexWhere((b) => b.billNumber == billNumber);
    if (idx != -1) {
      final bill = _bills[idx];
      try {
        final payment = PaymentRecord(
          societyId: _currentSocietyId,
          billId: bill.id ?? 1,
          flatId: bill.flatId,
          flatNumber: bill.flatNumber,
          payerName: _currentUserName.isNotEmpty ? _currentUserName : 'Resident Member',
          amount: bill.amount,
          paymentMethod: paymentMethod,
          transactionReference: 'UPI-TXN-${DateTime.now().millisecondsSinceEpoch}',
          receiptNumber: 'RCP-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
          paymentDate: DateTime.now(),
          isVerified: true,
        );
        final recorded = await client.maintenance.recordPayment(payment);
        await _loadBills();
        await _loadLedger();
        recordAuditEvent(
          category: 'Financial',
          action: 'MAINTENANCE_PAID',
          target: 'Bill $billNumber (${bill.flatNumber})',
          description: 'Payment of ₹${bill.amount.toInt()} received via $paymentMethod. Receipt: ${payment.receiptNumber}',
        );
        notifyListeners();
        return recorded;
      } catch (e) {
        debugPrint('Error recording payment: $e');
      }
    }
    return null;
  }

  Future<VisitorEntry?> preApproveVisitor({
    required String name,
    required String phone,
    required String purpose,
    String? vehicle,
  }) async {
    final passcode = (1000 + (DateTime.now().millisecondsSinceEpoch % 9000)).toString();
    final entry = VisitorEntry(
      societyId: _currentSocietyId,
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
      final created = await client.visitor.createVisitorEntry(entry);
      await _loadVisitors();
      recordAuditEvent(
        category: 'Gate & Security',
        action: 'VISITOR_PRE_APPROVED',
        target: 'Passcode $passcode ($name)',
        description: 'Flat $_currentFlat generated visitor pass for $name ($purpose)',
      );
      notifyListeners();
      return created;
    } catch (e) {
      debugPrint('Error creating visitor: $e');
      return null;
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
      societyId: _currentSocietyId,
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
      final verified = await client.visitor.verifyVisitorPasscode(_currentSocietyId, passcode);
      if (verified != null && verified.id != null) {
        await client.visitor.updateVisitorStatus(verified.id!, VisitorStatus.inside);
        await _loadVisitors();
        recordAuditEvent(
          category: 'Gate & Security',
          action: 'GATE_PASS_VERIFIED',
          target: 'Passcode $passcode (${verified.visitorName})',
          description: 'Guard verified passcode $passcode for ${verified.visitorName} visiting Flat ${verified.flatNumber}. Gate opened.',
        );
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
      societyId: _currentSocietyId,
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
      recordAuditEvent(
        category: 'Financial',
        action: 'VOUCHER_CREATED',
        target: '$vchNumber (₹${amount.toInt()})',
        description: '$_currentUserName requested expense voucher for "$title"',
      );
      notifyListeners();
    } catch (e) {
      debugPrint('Error creating voucher: $e');
    }
  }

  Future<void> approveVoucher(int id) async {
    try {
      final v = _vouchers.firstWhere((item) => item.id == id);
      await client.accounting.approveVoucher(id, '$_currentUserName (Chairman)');
      await _loadVouchers();
      recordAuditEvent(
        category: 'Financial',
        action: 'VOUCHER_APPROVED',
        target: '${v.voucherNumber} (₹${v.amount.toInt()})',
        description: 'Chairman $_currentUserName approved expense voucher for "${v.title}"',
      );
      notifyListeners();
    } catch (e) {
      debugPrint('Error approving voucher: $e');
    }
  }

  Future<void> rejectVoucher(int id, String reason) async {
    try {
      final v = _vouchers.firstWhere((item) => item.id == id);
      await client.accounting.rejectVoucher(id, reason);
      await _loadVouchers();
      recordAuditEvent(
        category: 'Financial',
        action: 'VOUCHER_REJECTED',
        target: '${v.voucherNumber} (₹${v.amount.toInt()})',
        description: 'Voucher rejected by $_currentUserName. Reason: $reason',
      );
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
      recordAuditEvent(
        category: 'Financial',
        action: 'VOUCHER_POSTED_TO_LEDGER',
        target: '${v.voucherNumber} (₹${v.amount.toInt()})',
        description: 'Accountant $_currentUserName posted voucher to double-entry general ledger',
      );
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
      societyId: _currentSocietyId,
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
      societyId: _currentSocietyId,
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
      recordAuditEvent(
        category: 'Governance',
        action: 'NOTICE_PUBLISHED',
        target: title,
        description: 'Notice "$title" ($priority priority) published by $_currentUserName',
      );
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
      societyId: _currentSocietyId,
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
      recordAuditEvent(
        category: 'Governance',
        action: 'DOCUMENT_UPLOADED',
        target: title,
        description: 'Document "$title" (${category.name}) uploaded to Vault',
      );
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
        recordAuditEvent(
          category: 'Governance',
          action: 'POLL_VOTE_CAST',
          target: 'Resolution #$pollId',
          description: 'Flat $flatNumber cast secret ballot vote on Resolution #$pollId (1 Flat = 1 Vote)',
        );
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
      societyId: _currentSocietyId,
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
      recordAuditEvent(
        category: 'Gate & Security',
        action: 'SOS_EMERGENCY_TRIGGERED',
        target: 'Flat $_currentFlat (${type.name.toUpperCase()})',
        description: 'EMERGENCY SOS: Flat $_currentFlat raised ${type.name.toUpperCase()} alert: ${note ?? "Immediate assistance requested"}',
      );
      notifyListeners();
    } catch (e) {
      debugPrint('Error triggering SOS: $e');
    }
  }

  Future<void> acknowledgeSos(int id, String guardName) async {
    try {
      await client.sos.acknowledgeSos(id, guardName);
      await _loadSosAlerts();
      recordAuditEvent(
        category: 'Gate & Security',
        action: 'SOS_ACKNOWLEDGED',
        target: 'SOS Alert #$id',
        description: 'Security guard $guardName acknowledged emergency and dispatched response team',
      );
      notifyListeners();
    } catch (e) {
      debugPrint('Error acknowledging SOS: $e');
    }
  }

  Future<void> resolveSos(int id, String resolverName, String notes) async {
    try {
      await client.sos.resolveSos(id, resolverName, notes);
      await _loadSosAlerts();
      recordAuditEvent(
        category: 'Gate & Security',
        action: 'SOS_CLEARED',
        target: 'SOS Alert #$id',
        description: 'Emergency resolved by $resolverName. Resolution notes: $notes',
      );
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
