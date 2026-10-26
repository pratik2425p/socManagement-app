import 'package:serverpod/serverpod.dart';
import '../core/auth_context.dart';
import '../generated/protocol.dart';
import '../notifications/fcm_service.dart';

class VisitorEndpoint extends Endpoint {
  /// Get visitors for the authenticated caller's society.
  /// Residents only receive visitor records for their own flat.
  Future<List<VisitorEntry>> getVisitors(
    Session session, {
    String? flatNumber,
    VisitorStatus? status,
  }) async {
    final auth = await AuthContext.require(session);
    final isStaff = auth.role == UserRole.guard ||
        auth.role == UserRole.chairman ||
        auth.role == UserRole.committee ||
        auth.role == UserRole.admin;

    final filterFlat = isStaff ? flatNumber : auth.flatNumber;

    return await VisitorEntry.db.find(
      session,
      where: (t) =>
          t.societyId.equals(auth.societyId) &
          (filterFlat != null ? t.flatNumber.equals(filterFlat) : Constant.bool(true)) &
          (status != null ? t.status.equals(status) : Constant.bool(true)),
      orderBy: (t) => t.id,
      orderDescending: true,
    );
  }

  /// Create visitor entry (pre-approved by resident or recorded by gate guard).
  /// If status is [VisitorStatus.waitingApproval], dispatches a real-time GateBellEvent
  /// to the specific flat's channel and delivers a high-priority FCM push notification.
  Future<VisitorEntry> createVisitorEntry(
    Session session,
    VisitorEntry entry,
  ) async {
    final auth = await AuthContext.require(session);
    entry.societyId = auth.societyId;

    final inserted = await VisitorEntry.db.insertRow(session, entry);

    if (inserted.status == VisitorStatus.waitingApproval) {
      final event = GateBellEvent(
        visitorId: inserted.id!,
        societyId: auth.societyId,
        flatNumber: inserted.flatNumber,
        visitorName: inserted.visitorName,
        visitorPhone: inserted.phoneNumber,
        purpose: inserted.purpose,
        vehicleNumber: inserted.vehicleNumber,
        imageUrl: null,
        status: inserted.status,
        createdAt: DateTime.now(),
      );

      // Post real-time event to the specific flat's channel
      final channel = 'society_${auth.societyId}_flat_${inserted.flatNumber}';
      await session.messages.postMessage(channel, event);

      // Dispatch high-priority background FCM push notification
      await FcmService.sendToFlat(
        session,
        societyId: auth.societyId,
        flatNumber: inserted.flatNumber,
        title: '🔔 Gate Bell: Visitor at Gate',
        body: '${inserted.visitorName} (${inserted.purpose}) is requesting entry to Flat ${inserted.flatNumber}',
        highPriority: true,
        data: {
          'type': 'gate_bell',
          'visitorId': inserted.id.toString(),
          'flatNumber': inserted.flatNumber,
        },
      );
    }

    return inserted;
  }

  /// Update visitor status (e.g., approved/rejected by resident, checked-in/out by guard).
  Future<VisitorEntry?> updateVisitorStatus(
    Session session,
    int visitorId,
    VisitorStatus status,
  ) async {
    final auth = await AuthContext.require(session);
    final visitor = await VisitorEntry.db.findById(session, visitorId);
    if (visitor == null || visitor.societyId != auth.societyId) return null;

    visitor.status = status;
    if (status == VisitorStatus.inside) {
      visitor.checkInTime = DateTime.now();
    } else if (status == VisitorStatus.exited) {
      visitor.checkOutTime = DateTime.now();
    }

    final updated = await VisitorEntry.db.updateRow(session, visitor);

    // Broadcast status update on flat channel
    final event = GateBellEvent(
      visitorId: updated.id!,
      societyId: updated.societyId,
      flatNumber: updated.flatNumber,
      visitorName: updated.visitorName,
      visitorPhone: updated.phoneNumber,
      purpose: updated.purpose,
      vehicleNumber: updated.vehicleNumber,
      imageUrl: null,
      status: updated.status,
      createdAt: DateTime.now(),
    );
    await session.messages.postMessage('society_${auth.societyId}_flat_${updated.flatNumber}', event);

    return updated;
  }

  /// Verify visitor passcode at the gate terminal.
  Future<VisitorEntry?> verifyVisitorPasscode(
    Session session,
    String passcode,
  ) async {
    final auth = await AuthContext.require(session);
    return await VisitorEntry.db.findFirstRow(
      session,
      where: (t) =>
          t.societyId.equals(auth.societyId) &
          t.passcode.equals(passcode) &
          t.status.equals(VisitorStatus.expected),
    );
  }
}
