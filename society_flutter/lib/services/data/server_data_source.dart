import 'package:society_client/society_client.dart';
import 'society_data_source.dart';

/// Real Serverpod implementation of [SocietyDataSource].
/// Connects over WebSockets/HTTPS to the authenticated Serverpod cluster.
class ServerDataSource implements SocietyDataSource {
  final Client client;

  ServerDataSource(this.client);

  @override
  Future<List<Society>> getSocieties() => client.society.getSocieties();

  @override
  Future<List<SocietyUser>> getUsers(int societyId) => client.society.getSocietyUsers(societyId);

  @override
  Future<List<Building>> getBuildings(int societyId) => client.society.getBuildings(societyId);

  @override
  Future<List<Flat>> getFlats(int societyId) => client.society.getFlats(societyId);

  @override
  Future<List<SocietyInvitation>> getInvitations(int societyId) => client.society.getInvitations(societyId);

  @override
  Future<List<MaintenanceBill>> getBills(int societyId, {String? flatNumber}) =>
      client.maintenance.getBills(societyId, flatNumber: flatNumber);

  @override
  Future<List<VisitorEntry>> getVisitors({String? flatNumber, VisitorStatus? status}) =>
      client.visitor.getVisitors(flatNumber: flatNumber, status: status);

  @override
  Future<List<VoucherRequest>> getVouchers(int societyId) => client.accounting.getVouchers(societyId);

  @override
  Future<List<LedgerEntry>> getLedgerEntries(int societyId) => client.accounting.getLedgerEntries(societyId);

  @override
  Future<List<Complaint>> getComplaints({String? flatNumber}) =>
      client.communication.getComplaints(flatNumber: flatNumber);

  @override
  Future<List<Notice>> getNotices() => client.communication.getNotices();

  @override
  Future<List<SocietyDocument>> getDocuments({int limit = 50, int offset = 0}) =>
      client.document.getDocuments(limit: limit, offset: offset);

  @override
  Future<List<MeetingMinutes>> getMeetingMinutes({int limit = 50, int offset = 0}) =>
      client.document.getMeetingMinutes(limit: limit, offset: offset);

  @override
  Future<List<SocietyPoll>> getPolls(int societyId) => client.poll.getPolls(societyId);

  @override
  Future<List<PollOption>> getPollOptions(int pollId) => client.poll.getPollOptions(pollId);

  @override
  Future<List<SosAlert>> getActiveSosAlerts() => client.sos.getActiveSosAlerts();

  @override
  Future<List<SocietySubscription>> getAllSubscriptions() => client.saasAdmin.getAllSubscriptions();

  @override
  Future<SaasMetricSummary> getMetricSummary() => client.saasAdmin.getMetricSummary();

  @override
  Future<List<Amenity>> getAmenities({int limit = 50, int offset = 0}) =>
      client.amenity.getAmenities(limit: limit, offset: offset);

  @override
  Future<List<AmenityBooking>> getAmenityBookings({int limit = 50, int offset = 0}) =>
      client.amenity.getBookings(limit: limit, offset: offset);

  @override
  Future<List<AuditLog>> getAuditLogs({int limit = 50, int offset = 0}) =>
      client.audit.getAuditLogs(limit: limit, offset: offset);

  @override
  Future<List<TenantNoc>> getTenantNocs({int limit = 50, int offset = 0}) =>
      client.tenancy.getTenantNocs(limit: limit, offset: offset);

  @override
  Future<OtpSendResult> sendOtp(String phone) => client.auth.sendOtp(phone);

  @override
  Future<AuthResponse> verifyOtp(String phone, String otp) =>
      client.auth.verifyOtp(phone, otp);

  @override
  Future<void> signOut() async {
    try {
      await client.auth.signOut();
    } catch (_) {}
  }

  @override
  Future<AmenityBooking> bookSlot({
    required int amenityId,
    required DateTime date,
    required String slot,
  }) =>
      client.amenity.bookSlot(
        amenityId: amenityId,
        date: date,
        slot: slot,
      );

  @override
  Future<AmenityBooking> cancelBooking({required int bookingId}) =>
      client.amenity.cancelBooking(bookingId: bookingId);

  @override
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
  }) =>
      client.tenancy.submitNoc(
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

  @override
  Future<VisitorEntry> createVisitorEntry(VisitorEntry entry) =>
      client.visitor.createVisitorEntry(entry);

  @override
  Future<VisitorEntry?> updateVisitorStatus(int visitorId, VisitorStatus status) =>
      client.visitor.updateVisitorStatus(visitorId, status);

  @override
  Future<VisitorEntry?> verifyVisitorPasscode(String passcode) =>
      client.visitor.verifyVisitorPasscode(passcode);

  @override
  Future<VoucherRequest> createVoucherRequest(VoucherRequest request) =>
      client.accounting.createVoucherRequest(request);

  @override
  Future<VoucherRequest?> approveVoucher(int voucherId, String approverName) =>
      client.accounting.approveVoucher(voucherId, approverName);

  @override
  Future<VoucherRequest?> rejectVoucher(int voucherId, String reason) =>
      client.accounting.rejectVoucher(voucherId, reason);

  @override
  Future<LedgerEntry> postVoucherToLedger(
    int voucherId,
    String postedByName,
    String description,
    double debit,
    double credit,
  ) =>
      client.accounting.postVoucherToLedger(
        voucherId,
        postedByName,
        description,
        debit,
        credit,
      );

  @override
  Future<Complaint> createComplaint(Complaint complaint) =>
      client.communication.createComplaint(complaint);

  @override
  Future<Complaint?> updateComplaintStatus(
    int complaintId,
    ComplaintStatus status,
    String? notes,
  ) =>
      client.communication.updateComplaintStatus(complaintId, status, notes);

  @override
  Future<Notice> createNotice(Notice notice) => client.communication.createNotice(notice);

  @override
  Future<bool> castVote(int pollId, String flatNumber, String voterName, int optionId) =>
      client.poll.castVote(pollId, flatNumber, voterName, optionId);

  @override
  Future<SosAlert> raiseSosAlert(SosAlert alert) => client.sos.raiseSosAlert(alert);

  @override
  Future<SosAlert?> acknowledgeSos(int alertId, String guardName) =>
      client.sos.acknowledgeSos(alertId, guardName);

  @override
  Future<SosAlert?> resolveSos(int alertId, String resolverName, String notes) =>
      client.sos.resolveSos(alertId, resolverName, notes);

  @override
  Future<SocietySubscription> createSubscription(SocietySubscription subscription) =>
      client.saasAdmin.createSubscription(subscription);

  @override
  Future<UploadDescriptionResponse> getUploadDescription({
    required String fileName,
    required int fileSizeBytes,
    required String category,
  }) =>
      client.document.getUploadDescription(
        fileName: fileName,
        fileSizeBytes: fileSizeBytes,
        category: category,
      );

  @override
  Future<SocietyDocument> saveDocument({
    required String title,
    required String description,
    required DocumentCategory category,
    required String storagePath,
    required String fileSize,
    required bool isCommitteeOnly,
  }) =>
      client.document.saveDocument(
        title: title,
        description: description,
        category: category,
        storagePath: storagePath,
        fileSize: fileSize,
        isCommitteeOnly: isCommitteeOnly,
      );

  @override
  Future<String?> getDownloadUrl({int? documentId, String? storagePath}) =>
      client.document.getDownloadUrl(documentId: documentId, storagePath: storagePath);

  @override
  Future<RazorpayOrderResponse?> createPaymentOrder(int billId) =>
      client.payment.createPaymentOrder(billId);

  @override
  Future<PaymentVerificationResult> verifyPayment(
    String orderId,
    String paymentId,
    String signature,
  ) =>
      client.payment.verifyPayment(orderId, paymentId, signature);

  @override
  Stream<GateBellEvent> streamGateBell({String? requestedFlat}) =>
      client.realtime.streamGateBell(requestedFlat: requestedFlat);

  @override
  Stream<SosAlertEvent> streamSosAlerts({int? requestedSocietyId}) =>
      client.realtime.streamSosAlerts(requestedSocietyId: requestedSocietyId);

  @override
  Future<bool> registerDeviceToken({required String deviceToken, required String platform}) =>
      client.notification.registerDeviceToken(deviceToken: deviceToken, platform: platform);

  @override
  Future<bool> unregisterDeviceToken({required String deviceToken}) =>
      client.notification.unregisterDeviceToken(deviceToken: deviceToken);
}
