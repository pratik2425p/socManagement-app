import 'package:flutter/foundation.dart';
import 'package:society_client/society_client.dart';
import 'demo_data_source_base.dart';

/// In-memory demo data source for running the app offline without a backend server.
/// Enforces complete safety: strictly rejected if executed under release builds.
class DemoDataSource extends DemoDataSourceBase {
  DemoDataSource() {
    if (kReleaseMode) {
      throw StateError('DemoDataSource is strictly prohibited in release builds.');
    }
    initData();
  }

  void simulateVisitorArrival({
    String visitorName = 'Blinkit Courier (Rahul)',
    String flatNumber = 'A-101',
    String purpose = 'Instant Delivery',
    String? vehicleNumber = 'MH-01-BK-2026',
  }) {
    final entry = VisitorEntry(
      id: visitors.length + 101,
      societyId: 1,
      flatNumber: flatNumber,
      visitorName: visitorName,
      phoneNumber: '9819998877',
      purpose: purpose,
      vehicleNumber: vehicleNumber,
      status: VisitorStatus.waitingApproval,
      entryGate: 'Main Gate 1',
      checkInTime: DateTime.now(),
    );
    visitors.insert(0, entry);

    gateBellController.add(
      GateBellEvent(
        visitorId: entry.id!,
        societyId: 1,
        flatNumber: flatNumber,
        visitorName: visitorName,
        visitorPhone: entry.phoneNumber,
        purpose: purpose,
        vehicleNumber: vehicleNumber,
        status: VisitorStatus.waitingApproval,
        createdAt: DateTime.now(),
      ),
    );
  }

  void simulateSosAlert({
    String flatNumber = 'A-101',
    EmergencyType type = EmergencyType.medical,
    String? description = 'Immediate doctor needed, resident feeling faint',
  }) {
    final alert = SosAlert(
      id: sosAlerts.length + 101,
      societyId: 1,
      flatNumber: flatNumber,
      raisedByName: 'Aarav Mehta',
      emergencyType: type,
      status: SosStatus.active,
      description: description,
      raisedAt: DateTime.now(),
    );
    sosAlerts.insert(0, alert);

    sosController.add(
      SosAlertEvent(
        alertId: alert.id!,
        societyId: 1,
        flatNumber: flatNumber,
        raisedByName: alert.raisedByName,
        emergencyType: type,
        status: SosStatus.active,
        description: description,
        raisedAt: alert.raisedAt,
      ),
    );
  }

  @override
  Future<List<Society>> getSocieties() async => List.unmodifiable(societies);

  @override
  Future<List<SocietyUser>> getUsers(int societyId) async => List.unmodifiable(users);

  @override
  Future<List<Building>> getBuildings(int societyId) async => [
        Building(id: 1, societyId: 1, name: 'Tower A', totalFloors: 15, createdAt: DateTime(2024, 1, 1)),
        Building(id: 2, societyId: 1, name: 'Tower B', totalFloors: 15, createdAt: DateTime(2024, 1, 1)),
      ];

  @override
  Future<List<Flat>> getFlats(int societyId) async => [
        Flat(id: 1, societyId: 1, buildingId: 1, flatNumber: 'A-101', floor: 1, squareFeet: 1450.0, status: 'occupied'),
        Flat(id: 2, societyId: 1, buildingId: 1, flatNumber: 'A-501', floor: 5, squareFeet: 2200.0, status: 'occupied'),
        Flat(id: 3, societyId: 1, buildingId: 2, flatNumber: 'B-204', floor: 2, squareFeet: 1100.0, status: 'occupied'),
      ];

  @override
  Future<List<SocietyInvitation>> getInvitations(int societyId) async => [];

  @override
  Future<List<MaintenanceBill>> getBills(int societyId, {String? flatNumber}) async =>
      List.unmodifiable(bills);

  @override
  Future<List<VisitorEntry>> getVisitors({String? flatNumber, VisitorStatus? status}) async {
    var list = visitors;
    if (flatNumber != null) list = list.where((v) => v.flatNumber == flatNumber).toList();
    if (status != null) list = list.where((v) => v.status == status).toList();
    return List.unmodifiable(list);
  }

  @override
  Future<List<VoucherRequest>> getVouchers(int societyId) async => List.unmodifiable(vouchers);

  @override
  Future<List<LedgerEntry>> getLedgerEntries(int societyId) async => List.unmodifiable(ledgerEntries);

  @override
  Future<List<Complaint>> getComplaints({String? flatNumber}) async => [
        Complaint(
          id: 1,
          societyId: 1,
          flatNumber: 'A-101',
          reportedByName: 'Aarav Mehta',
          title: 'Intercom Line Static Noise',
          description: 'High buzzing sound when calling security gate.',
          category: 'Intercom',
          status: ComplaintStatus.inProgress,
          createdAt: DateTime.now().subtract(const Duration(days: 1)),
        ),
      ];

  @override
  Future<List<Notice>> getNotices() async => List.unmodifiable(notices);

  @override
  Future<List<SocietyDocument>> getDocuments({int limit = 50, int offset = 0}) async => [
        SocietyDocument(
          id: 1,
          societyId: 1,
          title: 'Society Bye-Laws & Code of Conduct 2026',
          description: 'Official rules and bylaws of the cooperative housing society',
          category: DocumentCategory.byeLaws,
          fileUrl: 'https://society-demo.storage/mock_view.pdf',
          fileSize: '2.0 MB',
          storagePath: 'societies/1/documents/bye_laws_2026.pdf',
          uploadedByName: 'Vikram Patel',
          uploadedAt: DateTime(2024, 1, 1),
          isCommitteeOnly: false,
        ),
      ];

  @override
  Future<List<MeetingMinutes>> getMeetingMinutes({int limit = 50, int offset = 0}) async => [];

  @override
  Future<List<SocietyPoll>> getPolls(int societyId) async => List.unmodifiable(polls);

  @override
  Future<List<PollOption>> getPollOptions(int pollId) async => pollOptions[pollId] ?? [];

  @override
  Future<List<SosAlert>> getActiveSosAlerts() async =>
      sosAlerts.where((a) => a.status != SosStatus.resolved).toList();

  @override
  Future<List<SocietySubscription>> getAllSubscriptions() async => List.unmodifiable(subscriptions);

  @override
  Future<SaasMetricSummary> getMetricSummary() async => SaasMetricSummary(
        totalSocieties: subscriptions.length,
        activeSubscriptions: subscriptions.where((s) => s.status == 'active').length,
        trialSocieties: 0,
        totalManagedFlats: subscriptions.fold(0, (sum, s) => sum + s.flatCount),
        monthlyRecurringRevenue: subscriptions.fold(0.0, (sum, s) => sum + s.monthlyTotal),
        averageRevenuePerSociety: 2250.0,
      );

  @override
  Future<List<Amenity>> getAmenities({int limit = 50, int offset = 0}) async => List.unmodifiable(amenities);

  @override
  Future<List<AmenityBooking>> getAmenityBookings({int limit = 50, int offset = 0}) async =>
      List.unmodifiable(amenityBookings);

  @override
  Future<List<AuditLog>> getAuditLogs({int limit = 50, int offset = 0}) async =>
      List.unmodifiable(auditLogs);

  @override
  Future<List<TenantNoc>> getTenantNocs({int limit = 50, int offset = 0}) async =>
      List.unmodifiable(tenantNocs);
}
