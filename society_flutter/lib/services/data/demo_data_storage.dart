import 'dart:async';
import 'package:society_client/society_client.dart';
import 'demo_seed_data.dart';
import 'society_data_source.dart';

/// Storage collections, authentication, documents, and payments state for Demo mode.
abstract class DemoDataStorage implements SocietyDataSource {
  late List<Society> societies;
  late List<SocietyUser> users;
  late List<MaintenanceBill> bills;
  late List<VisitorEntry> visitors;
  late List<VoucherRequest> vouchers;
  late List<LedgerEntry> ledgerEntries;
  late List<Amenity> amenities;
  final List<AmenityBooking> amenityBookings = [];
  final List<TenantNoc> tenantNocs = [];
  final List<AuditLog> auditLogs = [];
  late List<Notice> notices;
  late List<SocietyPoll> polls;
  late Map<int, List<PollOption>> pollOptions;
  final List<SosAlert> sosAlerts = [];
  late List<SocietySubscription> subscriptions;

  final StreamController<GateBellEvent> gateBellController =
      StreamController<GateBellEvent>.broadcast();
  final StreamController<SosAlertEvent> sosController =
      StreamController<SosAlertEvent>.broadcast();

  void initData() {
    societies = List.from(DemoSeedData.societies);
    users = List.from(DemoSeedData.users);
    bills = List.from(DemoSeedData.bills);
    visitors = List.from(DemoSeedData.visitors);
    vouchers = List.from(DemoSeedData.vouchers);
    ledgerEntries = List.from(DemoSeedData.ledgerEntries);
    amenities = List.from(DemoSeedData.amenities);
    notices = List.from(DemoSeedData.notices);
    polls = List.from(DemoSeedData.polls);
    pollOptions = Map.from(DemoSeedData.pollOptions);
    subscriptions = List.from(DemoSeedData.subscriptions);
  }

  @override
  Future<OtpSendResult> sendOtp(String phone) async =>
      OtpSendResult(success: true, message: 'Demo OTP: 123456', cooldownSeconds: 30, expiresInSeconds: 300);

  @override
  Future<AuthResponse> verifyOtp(String phone, String otp) async {
    final matched = users.firstWhere(
      (u) => u.phone == phone,
      orElse: () => users.first,
    );
    return AuthResponse(success: true, message: 'Demo Login Success', user: matched);
  }

  @override
  Future<void> signOut() async {}

  @override
  Future<UploadDescriptionResponse> getUploadDescription({
    required String fileName,
    required int fileSizeBytes,
    required String category,
  }) async =>
      UploadDescriptionResponse(
        uploadDescription: 'demo_upload_ticket',
        storagePath: 'societies/1/demo/$fileName',
      );

  @override
  Future<SocietyDocument> saveDocument({
    required String title,
    required String description,
    required DocumentCategory category,
    required String storagePath,
    required String fileSize,
    required bool isCommitteeOnly,
  }) async {
    final doc = SocietyDocument(
      id: 99,
      societyId: 1,
      title: title,
      description: description,
      category: category,
      fileUrl: 'https://society-demo.storage/mock_view.pdf',
      fileSize: fileSize,
      storagePath: storagePath,
      uploadedByName: 'Demo User',
      uploadedAt: DateTime.now(),
      isCommitteeOnly: isCommitteeOnly,
    );
    return doc;
  }

  @override
  Future<String?> getDownloadUrl({int? documentId, String? storagePath}) async =>
      'https://society-demo.storage/mock_view.pdf';

  @override
  Future<RazorpayOrderResponse?> createPaymentOrder(int billId) async =>
      RazorpayOrderResponse(
        orderId: 'order_demo_${DateTime.now().millisecondsSinceEpoch}',
        billId: billId,
        societyId: 1,
        amountPaise: 625000,
        amountRupees: 6250.0,
        currency: 'INR',
        keyId: 'rzp_demo_key_unlimited',
        billNumber: 'BILL-OCT-101',
        flatNumber: 'A-101',
        payerName: 'Aarav Mehta',
        payerPhone: '9820011111',
        payerEmail: 'aarav@horizon.in',
      );

  @override
  Future<PaymentVerificationResult> verifyPayment(
    String orderId,
    String paymentId,
    String signature,
  ) async {
    final bill = bills.firstWhere((b) => b.status == BillStatus.unpaid, orElse: () => bills.first);
    bill.status = BillStatus.paid;
    return PaymentVerificationResult(
      success: true,
      message: 'Demo payment completed successfully.',
      isAlreadyProcessed: false,
      bill: bill,
    );
  }

  @override
  Stream<GateBellEvent> streamGateBell({String? requestedFlat}) => gateBellController.stream;

  @override
  Stream<SosAlertEvent> streamSosAlerts({int? requestedSocietyId}) => sosController.stream;

  @override
  Future<bool> registerDeviceToken({required String deviceToken, required String platform}) async => true;

  @override
  Future<bool> unregisterDeviceToken({required String deviceToken}) async => true;
}
