import 'package:society_client/society_client.dart';

/// Abstraction layer for Society Management operations.
/// Allows transparent switching between real Serverpod client and in-memory demo data.
abstract class SocietyDataSource {
  // --- Data Read Operations ---
  Future<List<Society>> getSocieties();
  Future<List<SocietyUser>> getUsers(int societyId);
  Future<List<Building>> getBuildings(int societyId);
  Future<List<Flat>> getFlats(int societyId);
  Future<List<SocietyInvitation>> getInvitations(int societyId);
  Future<List<MaintenanceBill>> getBills(int societyId, {String? flatNumber});
  Future<List<VisitorEntry>> getVisitors({String? flatNumber, VisitorStatus? status});
  Future<List<VoucherRequest>> getVouchers(int societyId);
  Future<List<LedgerEntry>> getLedgerEntries(int societyId);
  Future<List<Complaint>> getComplaints({String? flatNumber});
  Future<List<Notice>> getNotices();
  Future<List<SocietyDocument>> getDocuments({int limit = 50, int offset = 0});
  Future<List<MeetingMinutes>> getMeetingMinutes({int limit = 50, int offset = 0});
  Future<List<SocietyPoll>> getPolls(int societyId);
  Future<List<PollOption>> getPollOptions(int pollId);
  Future<List<SosAlert>> getActiveSosAlerts();
  Future<List<SocietySubscription>> getAllSubscriptions();
  Future<SaasMetricSummary> getMetricSummary();
  Future<List<Amenity>> getAmenities({int limit = 50, int offset = 0});
  Future<List<AmenityBooking>> getAmenityBookings({int limit = 50, int offset = 0});
  Future<List<AuditLog>> getAuditLogs({int limit = 50, int offset = 0});
  Future<List<TenantNoc>> getTenantNocs({int limit = 50, int offset = 0});

  // --- Auth Operations ---
  Future<OtpSendResult> sendOtp(String phone);
  Future<AuthResponse> verifyOtp(String phone, String otp);
  Future<void> signOut();

  // --- Mutating Operations ---
  Future<AmenityBooking> bookSlot({required int amenityId, required DateTime date, required String slot});
  Future<AmenityBooking> cancelBooking({required int bookingId});
  Future<TenantNoc> submitNoc({
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
  });
  Future<VisitorEntry> createVisitorEntry(VisitorEntry entry);
  Future<VisitorEntry?> updateVisitorStatus(int visitorId, VisitorStatus status);
  Future<VisitorEntry?> verifyVisitorPasscode(String passcode);
  Future<VoucherRequest> createVoucherRequest(VoucherRequest request);
  Future<VoucherRequest?> approveVoucher(int voucherId, String approverName);
  Future<VoucherRequest?> rejectVoucher(int voucherId, String reason);
  Future<LedgerEntry> postVoucherToLedger(
    int voucherId,
    String postedByName,
    String description,
    double debit,
    double credit,
  );
  Future<Complaint> createComplaint(Complaint complaint);
  Future<Complaint?> updateComplaintStatus(int complaintId, ComplaintStatus status, String? notes);
  Future<Notice> createNotice(Notice notice);
  Future<bool> castVote(int pollId, String flatNumber, String voterName, int optionId);
  Future<SosAlert> raiseSosAlert(SosAlert alert);
  Future<SosAlert?> acknowledgeSos(int alertId, String guardName);
  Future<SosAlert?> resolveSos(int alertId, String resolverName, String notes);
  Future<SocietySubscription> createSubscription(SocietySubscription subscription);
  Future<UploadDescriptionResponse> getUploadDescription({required String fileName, required int fileSizeBytes, required String category});
  Future<SocietyDocument> saveDocument({
    required String title,
    required String description,
    required DocumentCategory category,
    required String storagePath,
    required String fileSize,
    required bool isCommitteeOnly,
  });
  Future<String?> getDownloadUrl({int? documentId, String? storagePath});
  Future<RazorpayOrderResponse?> createPaymentOrder(int billId);
  Future<PaymentVerificationResult> verifyPayment(String orderId, String paymentId, String signature);

  // --- Real-time Streams ---
  Stream<GateBellEvent> streamGateBell({String? requestedFlat});
  Stream<SosAlertEvent> streamSosAlerts({int? requestedSocietyId});
  Future<bool> registerDeviceToken({required String deviceToken, required String platform});
  Future<bool> unregisterDeviceToken({required String deviceToken});
}
