import 'package:society_client/society_client.dart';
import 'demo_data_storage.dart';

/// Business operation mutations for [DemoDataSource].
abstract class DemoDataSourceBase extends DemoDataStorage {
  @override
  Future<AmenityBooking> bookSlot({
    required int amenityId,
    required DateTime date,
    required String slot,
  }) async {
    final amenity = amenities.firstWhere((a) => a.id == amenityId);
    final booking = AmenityBooking(
      id: amenityBookings.length + 1,
      societyId: 1,
      amenityId: amenityId,
      amenityName: amenity.name,
      flatNumber: 'A-101',
      bookedById: 1,
      bookedByName: 'Aarav Mehta',
      bookingDate: date,
      slot: slot,
      amountPaid: amenity.rate,
      status: BookingStatus.confirmed,
      createdAt: DateTime.now(),
    );
    amenityBookings.insert(0, booking);
    return booking;
  }

  @override
  Future<AmenityBooking> cancelBooking({required int bookingId}) async {
    final idx = amenityBookings.indexWhere((b) => b.id == bookingId);
    if (idx != -1) {
      amenityBookings[idx].status = BookingStatus.cancelled;
      return amenityBookings[idx];
    }
    throw StateError('Booking #$bookingId not found');
  }

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
  }) async {
    final noc = TenantNoc(
      id: tenantNocs.length + 1,
      societyId: 1,
      flatNumber: flatNumber,
      ownerName: ownerName,
      ownerPhone: ownerPhone,
      tenantName: tenantName,
      tenantPhone: tenantPhone,
      leaseStart: leaseStart,
      leaseEnd: leaseEnd,
      monthlyRent: monthlyRent,
      nocNumber: 'NOC-2026-00${tenantNocs.length + 1}',
      status: NocStatus.pending,
      issuedAt: DateTime.now(),
      documentPath: documentPath,
      documentUrl: documentUrl,
    );
    tenantNocs.insert(0, noc);
    return noc;
  }

  @override
  Future<VisitorEntry> createVisitorEntry(VisitorEntry entry) async {
    entry.id = visitors.length + 1;
    visitors.insert(0, entry);
    if (entry.status == VisitorStatus.waitingApproval) {
      gateBellController.add(
        GateBellEvent(
          visitorId: entry.id!,
          societyId: entry.societyId,
          flatNumber: entry.flatNumber,
          visitorName: entry.visitorName,
          visitorPhone: entry.phoneNumber,
          purpose: entry.purpose,
          vehicleNumber: entry.vehicleNumber,
          status: entry.status,
          createdAt: DateTime.now(),
        ),
      );
    }
    return entry;
  }

  @override
  Future<VisitorEntry?> updateVisitorStatus(int visitorId, VisitorStatus status) async {
    final idx = visitors.indexWhere((v) => v.id == visitorId);
    if (idx != -1) {
      visitors[idx].status = status;
      return visitors[idx];
    }
    return null;
  }

  @override
  Future<VisitorEntry?> verifyVisitorPasscode(String passcode) async {
    return visitors.firstWhere(
      (v) => v.passcode == passcode,
      orElse: () => visitors.first,
    );
  }

  @override
  Future<VoucherRequest> createVoucherRequest(VoucherRequest request) async {
    request.id = vouchers.length + 1;
    vouchers.insert(0, request);
    return request;
  }

  @override
  Future<VoucherRequest?> approveVoucher(int voucherId, String approverName) async {
    final idx = vouchers.indexWhere((v) => v.id == voucherId);
    if (idx != -1) {
      vouchers[idx].status = VoucherStatus.approved;
      vouchers[idx].approvedByName = approverName;
      return vouchers[idx];
    }
    return null;
  }

  @override
  Future<VoucherRequest?> rejectVoucher(int voucherId, String reason) async {
    final idx = vouchers.indexWhere((v) => v.id == voucherId);
    if (idx != -1) {
      vouchers[idx].status = VoucherStatus.rejected;
      vouchers[idx].rejectionReason = reason;
      return vouchers[idx];
    }
    return null;
  }

  @override
  Future<LedgerEntry> postVoucherToLedger(
    int voucherId,
    String postedByName,
    String description,
    double debit,
    double credit,
  ) async {
    final idx = vouchers.indexWhere((v) => v.id == voucherId);
    if (idx != -1) {
      vouchers[idx].status = VoucherStatus.postedToLedger;
    }
    final entry = LedgerEntry(
      id: ledgerEntries.length + 1,
      societyId: 1,
      entryNumber: 'JV-DEMO-$voucherId',
      voucherId: voucherId,
      entryDate: DateTime.now(),
      description: description,
      postedByName: postedByName,
      totalDebit: debit,
      totalCredit: credit,
      postedAt: DateTime.now(),
    );
    ledgerEntries.insert(0, entry);
    return entry;
  }

  @override
  Future<Complaint> createComplaint(Complaint complaint) async {
    complaint.id = 10;
    return complaint;
  }

  @override
  Future<Complaint?> updateComplaintStatus(int complaintId, ComplaintStatus status, String? notes) async => null;

  @override
  Future<Notice> createNotice(Notice notice) async {
    notice.id = notices.length + 1;
    notices.insert(0, notice);
    return notice;
  }

  @override
  Future<bool> castVote(int pollId, String flatNumber, String voterName, int optionId) async {
    final opts = pollOptions[pollId];
    if (opts != null) {
      final opt = opts.firstWhere((o) => o.id == optionId);
      opt.votesCount += 1;
      return true;
    }
    return false;
  }

  @override
  Future<SosAlert> raiseSosAlert(SosAlert alert) async {
    alert.id = sosAlerts.length + 1;
    sosAlerts.insert(0, alert);
    sosController.add(
      SosAlertEvent(
        alertId: alert.id!,
        societyId: alert.societyId,
        flatNumber: alert.flatNumber,
        raisedByName: alert.raisedByName,
        emergencyType: alert.emergencyType,
        status: alert.status,
        description: alert.description,
        raisedAt: alert.raisedAt,
      ),
    );
    return alert;
  }

  @override
  Future<SosAlert?> acknowledgeSos(int alertId, String guardName) async {
    final idx = sosAlerts.indexWhere((a) => a.id == alertId);
    if (idx != -1) {
      sosAlerts[idx].status = SosStatus.acknowledged;
      sosAlerts[idx].acknowledgedByName = guardName;
      return sosAlerts[idx];
    }
    return null;
  }

  @override
  Future<SosAlert?> resolveSos(int alertId, String resolverName, String notes) async {
    final idx = sosAlerts.indexWhere((a) => a.id == alertId);
    if (idx != -1) {
      sosAlerts[idx].status = SosStatus.resolved;
      sosAlerts[idx].resolvedByName = resolverName;
      sosAlerts[idx].resolutionNotes = notes;
      return sosAlerts[idx];
    }
    return null;
  }

  @override
  Future<SocietySubscription> createSubscription(SocietySubscription subscription) async {
    subscription.id = subscriptions.length + 1;
    subscriptions.insert(0, subscription);
    return subscription;
  }
}
