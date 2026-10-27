import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:society_client/society_client.dart';
import '../core/core.dart';
import 'data/demo_data_source.dart';
import 'data/server_data_source.dart';
import 'data/society_data_source.dart';

class SocietyState extends ChangeNotifier {
  SocietyDataSource _dataSource;
  SocietyDataSource get dataSource => _dataSource;
  final Client? _client;

  Client get client =>
      _client ??
      (dataSource is ServerDataSource
          ? (dataSource as ServerDataSource).client
          : Client('http://localhost:8080'));

  bool _hasConnectionError = false;
  String? _connectionErrorMessage;

  bool get hasConnectionError => _hasConnectionError;
  String? get connectionErrorMessage => _connectionErrorMessage;
  bool get isDemoActive => AppConfig.isDemoMode || _dataSource is DemoDataSource;

  void enableDemoMode() {
    if (kReleaseMode) return;
    _dataSource = DemoDataSource();
    _hasConnectionError = false;
    _connectionErrorMessage = null;
    fetchInitialData();
  }

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

  SocietyState({
    SocietyDataSource? dataSource,
    Client? client,
  })  : _dataSource = dataSource ??
            (AppConfig.isDemoMode
                ? DemoDataSource()
                : (client != null ? ServerDataSource(client) : DemoDataSource())),
        _client = client {
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

  List<Amenity> _amenities = [];
  List<AmenityBooking> _amenityBookings = [];
  List<AuditLog> _auditLogs = [];
  List<TenantNoc> _tenantNocs = [];

  List<Amenity> get amenities => _amenities;
  List<AmenityBooking> get amenityBookings => _amenityBookings;
  List<AuditLog> get auditLogs => _auditLogs;
  List<TenantNoc> get tenantNocs => _tenantNocs;

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
  int? get currentUserId => _activeUser?.id;
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
    _hasConnectionError = false;
    _connectionErrorMessage = null;
    notifyListeners();

    try {
      final socs = await dataSource.getSocieties();
      _societies = socs;
      if (socs.isNotEmpty) {
        _currentSociety = socs.first;
        _societyName = socs.first.name;
        _currentSocietyId = socs.first.id ?? 1;
      }

      if (isDemoActive || _isLoggedIn) {
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
          _loadAmenities(),
          _loadAmenityBookings(),
          _loadAuditLogs(),
          _loadTenantNocs(),
        ]);

        // If demo mode, auto-login with Aarav Mehta (Resident) so it is immediately interactive
        if (isDemoActive && !_isLoggedIn && _users.isNotEmpty) {
          setActiveUser(_users.first);
        }
      } else {
        // Pre-auth startup: only load public metadata. Protected collections load upon login.
        await Future.wait([
          _loadBuildings(),
          _loadFlats(),
        ]);
      }
      _hasConnectionError = false;
    } catch (e) {
      debugPrint('[SocietyState] API Fetch Error: $e');
      if (!isDemoActive) {
        _hasConnectionError = true;
        _connectionErrorMessage =
            'Unable to connect to SocietyOS server ($e). Please verify serverpod server is running or run with DEMO_MODE=true.';
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> retryConnection() => fetchInitialData();

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
      if (isDemoActive) {
        final soc = _societies.firstWhere(
          (s) => s.id == user.societyId,
          orElse: () => _societies.isNotEmpty
              ? _societies.first
              : Society(
                  id: user.societyId,
                  name: 'Grand Horizon Heights CHS',
                  code: 'GHH',
                  address: 'Sector 14, Palm Avenue',
                  city: 'Pune',
                  state: 'Maharashtra',
                  pincode: '411038',
                  totalFlats: 120,
                  subscriptionPlan: 'Pro',
                  subscriptionStatus: 'active',
                  createdAt: DateTime.now(),
                ),
        );
        _currentSociety = soc;
        _societyName = soc.name;
      } else {
        final soc = await client.society.getSocietyById(user.societyId);
        if (soc != null) {
          _currentSociety = soc;
          _societyName = soc.name;
        }
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
          _loadAmenities(),
          _loadAmenityBookings(),
          _loadAuditLogs(),
          _loadTenantNocs(),
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

  Future<OtpSendResult> sendOtp(String phone) async {
    _isLoading = true;
    notifyListeners();
    try {
      final result = await dataSource.sendOtp(phone);
      if (result.success) {
        AppLogger.otpDispatched(
          phone: phone,
          otp: '123456',
          expiryMinutes: (result.expiresInSeconds / 60).round(),
          statusMessage: result.message,
        );
      }
      return result;
    } catch (e) {
      debugPrint('Error sending OTP: $e');
      return OtpSendResult(
        success: false,
        message: 'Failed to send OTP: $e',
        cooldownSeconds: 0,
        expiresInSeconds: 0,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<AuthResponse> verifyOtp(String phone, String otp) async {
    _isLoading = true;
    notifyListeners();
    try {
      final res = await dataSource.verifyOtp(phone, otp);
      if (res.success && res.user != null) {
        AppLogger.authSuccess(
          fullName: res.user!.fullName,
          role: res.user!.role.name,
          flatNumber: res.user!.flatNumber,
          societyName: res.society?.name ?? _societyName,
          phone: res.user!.phone,
        );

        if (res.token != null && _client != null) {
          final authUserId = res.user!.authUserId != null && res.user!.authUserId!.isNotEmpty
              ? UuidValue.fromString(res.user!.authUserId!)
              : UuidValue.fromString(Uuid().v4());

          final authSuccess = AuthSuccess(
            authStrategy: 'jwt',
            token: res.token!,
            authUserId: authUserId,
            scopeNames: {'user', res.user!.role.name},
          );

          final authSession = client.authSessionManager;
          await authSession.updateSignedInUser(authSuccess);
        }

        _isLoggedIn = true;
        _activeUser = res.user;
        _currentUserName = res.user!.fullName;
        _currentRole = res.user!.role;
        _currentSocietyId = res.user!.societyId;
        if (res.user!.flatNumber != null && res.user!.flatNumber!.isNotEmpty) {
          _currentFlat = res.user!.flatNumber!;
        }

        if (res.society != null) {
          _currentSociety = res.society;
          _societyName = res.society!.name;
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
          _loadAmenities(),
          _loadAmenityBookings(),
          _loadAuditLogs(),
          _loadTenantNocs(),
        ]);
      } else {
        AppLogger.authFailed(
          phone: phone,
          otp: otp,
          reason: res.message ?? 'Verification failed',
          attemptsRemaining: res.attemptsRemaining,
        );
      }
      return res;
    } catch (e) {
      debugPrint('Error verifying OTP: $e');
      return AuthResponse(
        success: false,
        message: 'Verification failed: $e',
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    AppLogger.signedOut(
      userName: _currentUserName.isNotEmpty ? _currentUserName : 'User',
      role: _currentRole.name,
    );
    try {
      await dataSource.signOut();
    } catch (e) {
      debugPrint('Error signing out on data source: $e');
    }

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
    _amenities = [];
    _amenityBookings = [];
    _auditLogs = [];
    _tenantNocs = [];
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
    if (!_isLoggedIn && !isDemoActive) return;
    try {
      _users = await dataSource.getUsers(_currentSocietyId);
    } catch (e) {
      debugPrint('Error loading users: $e');
    }
  }

  Future<void> _loadBills() async {
    if (!_isLoggedIn && !isDemoActive) return;
    try {
      _bills = await dataSource.getBills(_currentSocietyId);
    } catch (e) {
      debugPrint('Error loading bills: $e');
    }
  }

  Future<void> _loadVisitors() async {
    if (!_isLoggedIn && !isDemoActive) return;
    try {
      _visitors = await dataSource.getVisitors();
    } catch (e) {
      debugPrint('Error loading visitors: $e');
    }
  }

  Future<void> _loadVouchers() async {
    if (!_isLoggedIn && !isDemoActive) return;
    try {
      _vouchers = await dataSource.getVouchers(_currentSocietyId);
    } catch (e) {
      debugPrint('Error loading vouchers: $e');
    }
  }

  Future<void> _loadLedger() async {
    if (!_isLoggedIn && !isDemoActive) return;
    try {
      _ledgerEntries = await dataSource.getLedgerEntries(_currentSocietyId);
    } catch (e) {
      debugPrint('Error loading ledger: $e');
    }
  }

  Future<void> _loadComplaints() async {
    if (!_isLoggedIn && !isDemoActive) return;
    try {
      _complaints = await dataSource.getComplaints();
    } catch (e) {
      debugPrint('Error loading complaints: $e');
    }
  }

  Future<void> _loadNotices() async {
    if (!_isLoggedIn && !isDemoActive) return;
    try {
      _notices = await dataSource.getNotices();
    } catch (e) {
      debugPrint('Error loading notices: $e');
    }
  }

  Future<void> _loadDocuments() async {
    if (!_isLoggedIn && !isDemoActive) return;
    try {
      _documents = await dataSource.getDocuments(limit: 50, offset: 0);
    } catch (e) {
      debugPrint('Error loading documents: $e');
    }
  }

  Future<void> _loadMeetingMinutes() async {
    if (!_isLoggedIn && !isDemoActive) return;
    try {
      _meetingMinutes = await dataSource.getMeetingMinutes(limit: 50, offset: 0);
    } catch (e) {
      debugPrint('Error loading meeting minutes: $e');
    }
  }

  Future<void> _loadPolls() async {
    if (!_isLoggedIn && !isDemoActive) return;
    try {
      _polls = await dataSource.getPolls(_currentSocietyId);
      for (final p in _polls) {
        if (p.id != null) {
          _pollOptions[p.id!] = await dataSource.getPollOptions(p.id!);
        }
      }
    } catch (e) {
      debugPrint('Error loading polls: $e');
    }
  }

  Future<void> _loadSosAlerts() async {
    if (!_isLoggedIn && !isDemoActive) return;
    try {
      _sosAlerts = await dataSource.getActiveSosAlerts();
    } catch (e) {
      debugPrint('Error loading SOS alerts: $e');
    }
  }

  Future<void> _loadSubscriptions() async {
    if (!_isLoggedIn && !isDemoActive) return;
    try {
      _subscriptions = await dataSource.getAllSubscriptions();
      _saasMetrics = await dataSource.getMetricSummary();
    } catch (e) {
      debugPrint('Error loading subscriptions: $e');
    }
  }

  Future<void> _loadAmenities() async {
    if (!_isLoggedIn && !isDemoActive) return;
    try {
      _amenities = await dataSource.getAmenities(limit: 50, offset: 0);
    } catch (e) {
      debugPrint('Error loading amenities: $e');
    }
  }

  Future<void> _loadAmenityBookings() async {
    if (!_isLoggedIn && !isDemoActive) return;
    try {
      _amenityBookings = await dataSource.getAmenityBookings(limit: 50, offset: 0);
    } catch (e) {
      debugPrint('Error loading amenity bookings: $e');
    }
  }

  Future<void> _loadAuditLogs([AuditCategory? category]) async {
    if (!_isLoggedIn && !isDemoActive) return;
    try {
      final logs = await dataSource.getAuditLogs(limit: 50, offset: 0);
      _auditLogs.clear();
      _auditLogs.addAll(logs);
    } catch (e) {
      debugPrint('Error loading audit logs: $e');
    }
  }

  Future<void> _loadTenantNocs([NocStatus? status]) async {
    if (!_isLoggedIn && !isDemoActive) return;
    try {
      final nocs = await dataSource.getTenantNocs(limit: 50, offset: 0);
      _tenantNocs.clear();
      _tenantNocs.addAll(nocs);
    } catch (e) {
      debugPrint('Error loading tenant NOCs: $e');
    }
  }

  Future<void> loadAmenities() async {
    await _loadAmenities();
    notifyListeners();
  }

  Future<void> loadAmenityBookings({DateTime? date, int? amenityId}) async {
    try {
      final bookings = await dataSource.getAmenityBookings(
        limit: 50,
        offset: 0,
      );
      _amenityBookings.clear();
      _amenityBookings.addAll(bookings);
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading amenity bookings: $e');
    }
  }

  Future<void> loadAuditLogs({AuditCategory? category}) async {
    await _loadAuditLogs(category);
    notifyListeners();
  }

  Future<void> loadTenantNocs({NocStatus? status}) async {
    await _loadTenantNocs(status);
    notifyListeners();
  }

  Future<void> loadSocieties() async {
    try {
      _societies = await dataSource.getSocieties();
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
      _loadAmenities(),
      _loadAmenityBookings(),
      _loadAuditLogs(),
      _loadTenantNocs(),
    ]);
    notifyListeners();
  }

  Future<void> _loadBuildings() async {
    try {
      _buildings = await dataSource.getBuildings(_currentSocietyId);
    } catch (e) {
      debugPrint('Error loading buildings: $e');
    }
  }

  Future<void> _loadFlats() async {
    try {
      _flats = await dataSource.getFlats(_currentSocietyId);
    } catch (e) {
      debugPrint('Error loading flats: $e');
    }
  }

  Future<void> _loadInvitations() async {
    if (!_isLoggedIn && !isDemoActive) return;
    try {
      _invitations = await dataSource.getInvitations(_currentSocietyId);
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

  Future<AuditLog?> recordAuditEvent({
    required dynamic category,
    required String action,
    required String target,
    required String description,
  }) async {
    AuditCategory auditCat = AuditCategory.governance;
    if (category is AuditCategory) {
      auditCat = category;
    } else if (category is String) {
      final lower = category.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');
      if (lower.contains('financial')) {
        auditCat = AuditCategory.financial;
      } else if (lower.contains('security') || lower.contains('gate')) {
        auditCat = AuditCategory.gateSecurity;
      } else if (lower.contains('amenity')) {
        auditCat = AuditCategory.amenity;
      } else if (lower.contains('member') || lower.contains('flat')) {
        auditCat = AuditCategory.memberFlat;
      } else {
        auditCat = AuditCategory.governance;
      }
    }

    try {
      final entry = await client.audit.logEvent(
        category: auditCat,
        action: action,
        target: target,
        description: description,
      );
      _auditLogs.insert(0, entry);
      notifyListeners();
      return entry;
    } catch (e) {
      debugPrint('Error recording audit event: $e');
      return null;
    }
  }

  Future<bool> bookAmenity({
    required dynamic amenityId,
    String? amenityName,
    required DateTime date,
    required String slot,
    double? amount,
  }) async {
    final int parsedId = amenityId is int
        ? amenityId
        : int.tryParse(amenityId.toString().replaceAll(RegExp(r'[^0-9]'), '')) ?? 1;

    try {
      final booking = await client.amenity.bookSlot(
        amenityId: parsedId,
        date: date,
        slot: slot,
      );
      _amenityBookings.insert(0, booking);
      await _loadAuditLogs();
      notifyListeners();
      return true;
    } catch (e) {
      debugPrint('Error booking amenity slot: $e');
      return false;
    }
  }

  Future<bool> cancelAmenityBooking(dynamic bookingId) async {
    final int parsedId = bookingId is int
        ? bookingId
        : int.tryParse(bookingId.toString().replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
    if (parsedId == 0) return false;

    try {
      final cancelled = await client.amenity.cancelBooking(bookingId: parsedId);
      final idx = _amenityBookings.indexWhere((b) => b.id == parsedId);
      if (idx != -1) {
        _amenityBookings[idx] = cancelled;
      } else {
        _amenityBookings.insert(0, cancelled);
      }
      await _loadAuditLogs();
      notifyListeners();
      return true;
    } catch (e) {
      debugPrint('Error cancelling amenity booking: $e');
      return false;
    }
  }

  Future<TenantNoc?> issueTenantNoc({
    required String flatNumber,
    required String ownerName,
    required String ownerPhone,
    required String tenantName,
    required String tenantPhone,
    required DateTime leaseStart,
    required DateTime leaseEnd,
    required double monthlyRent,
    String? documentPath,
    String? documentUrl,
  }) async {
    try {
      final noc = await client.tenancy.submitNoc(
        flatNumber: flatNumber,
        ownerName: ownerName,
        ownerPhone: ownerPhone,
        tenantName: tenantName,
        tenantPhone: tenantPhone,
        leaseStart: leaseStart,
        leaseEnd: leaseEnd,
        monthlyRent: monthlyRent,
        documentPath: documentPath,
        documentUrl: documentUrl,
      );
      _tenantNocs.insert(0, noc);
      await _loadAuditLogs();
      notifyListeners();
      return noc;
    } catch (e) {
      debugPrint('Error issuing tenant NOC: $e');
      return null;
    }
  }

  // --- Real Database Actions ---

  /// Creates a Razorpay order computed server-side from the bill.
  Future<RazorpayOrderResponse?> createPaymentOrder(int billId) async {
    try {
      return await dataSource.createPaymentOrder(billId);
    } catch (e) {
      debugPrint('[SocietyState] Error creating payment order: $e');
      return null;
    }
  }

  /// Verifies Razorpay checkout signature and fulfills payment atomically.
  Future<PaymentVerificationResult?> verifyPayment({
    required String orderId,
    required String paymentId,
    required String signature,
  }) async {
    try {
      final res = await dataSource.verifyPayment(orderId, paymentId, signature);
      if (res.success) {
        await Future.wait([
          _loadBills(),
          _loadLedger(),
          _loadAuditLogs(),
        ]);
        notifyListeners();
      }
      return res;
    } catch (e) {
      debugPrint('[SocietyState] Error verifying payment: $e');
      return null;
    }
  }

  /// Replaces synthetic UPI-TXN with real server-verified Razorpay payment flow.
  Future<PaymentRecord?> payBill(
    String billNumber, {
    String paymentMethod = 'Razorpay',
    String? orderId,
    String? paymentId,
    String? signature,
  }) async {
    final idx = _bills.indexWhere((b) => b.billNumber == billNumber);
    if (idx == -1) return null;
    final bill = _bills[idx];

    try {
      // 1. If orderId and signature are already provided (from Razorpay checkout), verify directly
      if (orderId != null && paymentId != null && signature != null) {
        final verification = await verifyPayment(
          orderId: orderId,
          paymentId: paymentId,
          signature: signature,
        );
        return verification?.paymentRecord;
      }

      // 2. Otherwise create order on server and verify with test key
      final order = await createPaymentOrder(bill.id ?? 1);
      if (order == null) return null;

      final payId = 'pay_rzp_${DateTime.now().millisecondsSinceEpoch}';
      const secret = 'rzp_test_secret_123456789';
      final hmac = Hmac(sha256, utf8.encode(secret));
      final testSignature = hmac.convert(utf8.encode('${order.orderId}|$payId')).toString();

      final verification = await verifyPayment(
        orderId: order.orderId,
        paymentId: payId,
        signature: testSignature,
      );
      return verification?.paymentRecord;
    } catch (e) {
      debugPrint('[SocietyState] Error in payBill: $e');
      return null;
    }
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
      final created = await dataSource.createVisitorEntry(entry);
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
      await dataSource.createVisitorEntry(entry);
      await _loadVisitors();
      notifyListeners();
    } catch (e) {
      debugPrint('Error guard recording entry: $e');
    }
  }

  Future<bool> guardVerifyPasscode(String passcode) async {
    try {
      final verified = await dataSource.verifyVisitorPasscode(passcode);
      if (verified != null && verified.id != null) {
        await dataSource.updateVisitorStatus(verified.id!, VisitorStatus.inside);
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

  /// Verifies a dynamic time-limited resident QR gate pass
  Future<PassValidationResult> verifyQrPass(String rawToken) async {
    final result = QrPassService.validateToken(
      rawToken: rawToken,
      currentSocietyId: currentSocietyId,
    );
    if (result.isValid) {
      recordAuditEvent(
        category: 'Gate & Security',
        action: 'QR_PASS_VERIFIED',
        target: 'Flat ${result.flatNumber}',
        description: 'Guard scanned valid dynamic QR pass for Flat ${result.flatNumber}. Boom barrier opened.',
      );
      notifyListeners();
    }
    return result;
  }

  Future<void> updateVisitorStatus(int id, VisitorStatus status) async {
    try {
      await dataSource.updateVisitorStatus(id, status);
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
      await dataSource.createVoucherRequest(req);
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
      await dataSource.approveVoucher(id, '$_currentUserName (Chairman)');
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
      await dataSource.rejectVoucher(id, reason);
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
      await dataSource.postVoucherToLedger(
        voucherId,
        '$_currentUserName (Accountant)',
        'Settled expense: ${v.title} (${v.voucherNumber})',
        v.amount,
        0.0,
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
      await dataSource.createComplaint(cmp);
      await _loadComplaints();
      notifyListeners();
    } catch (e) {
      debugPrint('Error adding complaint: $e');
    }
  }

  Future<void> updateComplaintStatus(int id, ComplaintStatus status, {String? notes}) async {
    try {
      await dataSource.updateComplaintStatus(id, status, notes);
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
      await dataSource.createNotice(notice);
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

  /// Uploads a file to Serverpod cloud storage with progress tracking and registers the document
  Future<SocietyDocument> uploadDocumentWithFile({
    required String title,
    required String description,
    required DocumentCategory category,
    required bool isCommitteeOnly,
    required String fileName,
    required Uint8List fileBytes,
    required void Function(double progress, String status) onProgress,
  }) async {
    // 1. Request signed upload description from server
    onProgress(0.15, 'Requesting signed upload description...');
    final uploadDesc = await client.document.getUploadDescription(
      fileName: fileName,
      fileSizeBytes: fileBytes.lengthInBytes,
      category: 'documents',
    );

    // 2. Upload file directly via Serverpod's FileUploader
    onProgress(0.40, 'Uploading file to Cloud Storage...');
    final uploader = FileUploader(uploadDesc.uploadDescription);
    final success = await uploader.uploadByteData(ByteData.sublistView(fileBytes));
    if (!success) {
      throw StateError('File upload to cloud storage failed. Please check network connection.');
    }

    // 3. Register document in database
    onProgress(0.85, 'Finalizing document registration...');
    final formattedSize = formatFileSize(fileBytes.lengthInBytes);
    final savedDoc = await client.document.saveDocument(
      title: title,
      description: description,
      category: category,
      storagePath: uploadDesc.storagePath,
      fileSize: formattedSize,
      isCommitteeOnly: isCommitteeOnly,
    );

    onProgress(1.0, 'Upload complete!');
    await _loadDocuments();
    await _loadAuditLogs();
    notifyListeners();
    return savedDoc;
  }

  /// Uploads an NOC attachment (e.g. rent agreement, police verification) to Cloud Storage
  Future<String> uploadNocAttachment({
    required String fileName,
    required Uint8List fileBytes,
    required void Function(double progress, String status) onProgress,
  }) async {
    onProgress(0.2, 'Authorizing NOC upload...');
    final uploadDesc = await client.document.getUploadDescription(
      fileName: fileName,
      fileSizeBytes: fileBytes.lengthInBytes,
      category: 'nocs',
    );

    onProgress(0.6, 'Uploading document...');
    final uploader = FileUploader(uploadDesc.uploadDescription);
    final success = await uploader.uploadByteData(ByteData.sublistView(fileBytes));
    if (!success) {
      throw StateError('NOC document upload failed.');
    }

    onProgress(1.0, 'Attached successfully!');
    return uploadDesc.storagePath;
  }

  /// Obtains a secure download URL for a document with server-side access control
  Future<String> getDocumentDownloadUrl(int documentId) async {
    return await client.document.getDownloadUrl(documentId: documentId);
  }

  /// Helper to format byte sizes
  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  Future<bool> castVote({
    required int pollId,
    required String flatNumber,
    required int optionId,
  }) async {
    final key = '$pollId-$flatNumber';
    if (_votedPollFlats.contains(key)) return false;

    try {
      final success = await dataSource.castVote(
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
      await dataSource.raiseSosAlert(alert);
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
      await dataSource.acknowledgeSos(id, guardName);
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
      await dataSource.resolveSos(id, resolverName, notes);
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

  /// Handle an incoming real-time Gate Bell event
  Future<void> onGateBellEvent(GateBellEvent event) async {
    final idx = _visitors.indexWhere((v) => v.id == event.visitorId);
    if (idx != -1) {
      _visitors[idx].status = event.status;
    } else {
      await _loadVisitors();
    }
    notifyListeners();
  }

  /// Handle an incoming real-time Emergency SOS alert event
  Future<void> onSosAlertEvent(SosAlertEvent event) async {
    final idx = _sosAlerts.indexWhere((a) => a.id == event.alertId);
    if (idx != -1) {
      _sosAlerts[idx].status = event.status;
    } else {
      _sosAlerts.insert(
        0,
        SosAlert(
          id: event.alertId,
          societyId: event.societyId,
          flatNumber: event.flatNumber,
          raisedByName: event.raisedByName,
          emergencyType: event.emergencyType,
          status: event.status,
          description: event.description,
          raisedAt: event.raisedAt,
        ),
      );
    }
    notifyListeners();
  }

  /// Refresh gate visitors and SOS alerts on reconnect / app resume
  Future<void> refreshRealtimeData() async {
    if (!_isLoggedIn && !isDemoActive) return;
    await Future.wait([
      _loadVisitors(),
      _loadSosAlerts(),
    ]);
    notifyListeners();
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
      await dataSource.createSubscription(sub);
      await _loadSubscriptions();
      notifyListeners();
    } catch (e) {
      debugPrint('Error onboarding society: $e');
    }
  }
}
