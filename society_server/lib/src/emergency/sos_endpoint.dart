import 'package:serverpod/serverpod.dart';
import '../audit/audit_service.dart';
import '../core/auth_context.dart';
import '../generated/protocol.dart';
import '../notifications/fcm_service.dart';

class SosEndpoint extends Endpoint {
  /// Trigger an immediate Emergency SOS Alert.
  /// Broadcasts an [SosAlertEvent] across the society emergency channel and
  /// dispatches high-priority push notifications to all society members.
  Future<SosAlert> raiseSosAlert(Session session, SosAlert alert) async {
    final auth = await AuthContext.require(session);

    alert.societyId = auth.societyId;
    alert.raisedByName = auth.userName;
    if (alert.flatNumber.trim().isEmpty) {
      alert.flatNumber = auth.flatNumber ?? 'Security Gate';
    }
    alert.status = SosStatus.active;
    alert.raisedAt = DateTime.now();

    final created = await SosAlert.db.insertRow(session, alert);

    final event = SosAlertEvent(
      alertId: created.id!,
      societyId: auth.societyId,
      flatNumber: created.flatNumber,
      raisedByName: created.raisedByName,
      emergencyType: created.emergencyType,
      status: created.status,
      description: created.description,
      raisedAt: created.raisedAt,
    );

    // Broadcast across society-wide emergency channel
    await session.messages.postMessage('society_${auth.societyId}_sos', event);

    // High-priority FCM push
    await FcmService.sendToSociety(
      session,
      societyId: auth.societyId,
      title: '🚨 EMERGENCY SOS: Flat ${created.flatNumber}',
      body: '${created.emergencyType.name.toUpperCase()} emergency reported by ${created.raisedByName}!',
      highPriority: true,
      data: {
        'type': 'sos_alert',
        'alertId': created.id.toString(),
        'flatNumber': created.flatNumber,
      },
    );

    // Server-side audit trail
    await AuditService.record(
      session,
      societyId: auth.societyId,
      category: AuditCategory.gateSecurity,
      action: 'EMERGENCY_SOS_RAISED',
      actorId: auth.userId,
      actorName: auth.userName,
      actorRole: auth.role,
      target: 'Flat ${created.flatNumber}',
      description: 'Emergency SOS (${created.emergencyType.name}) triggered by ${created.raisedByName}',
    );

    return created;
  }

  /// Get active / un-resolved emergency alerts for guards & chairman.
  Future<List<SosAlert>> getActiveSosAlerts(Session session) async {
    final auth = await AuthContext.require(session);

    return await SosAlert.db.find(
      session,
      where: (t) =>
          t.societyId.equals(auth.societyId) &
          (t.status.equals(SosStatus.active) | t.status.equals(SosStatus.acknowledged)),
      orderBy: (t) => t.raisedAt,
      orderDescending: true,
    );
  }

  /// Guard acknowledges emergency and dispatches help.
  Future<SosAlert?> acknowledgeSos(
    Session session,
    int alertId,
    String acknowledgedByName,
  ) async {
    final auth = await AuthContext.require(session);
    final alert = await SosAlert.db.findById(session, alertId);
    if (alert == null || alert.societyId != auth.societyId) return null;

    alert.status = SosStatus.acknowledged;
    alert.acknowledgedByName = acknowledgedByName;
    alert.acknowledgedAt = DateTime.now();

    final updated = await SosAlert.db.updateRow(session, alert);

    final event = SosAlertEvent(
      alertId: updated.id!,
      societyId: auth.societyId,
      flatNumber: updated.flatNumber,
      raisedByName: updated.raisedByName,
      emergencyType: updated.emergencyType,
      status: updated.status,
      description: updated.description,
      raisedAt: updated.raisedAt,
    );
    await session.messages.postMessage('society_${auth.societyId}_sos', event);

    return updated;
  }

  /// Resolve emergency after situation is safe.
  Future<SosAlert?> resolveSos(
    Session session,
    int alertId,
    String resolvedByName,
    String resolutionNotes,
  ) async {
    final auth = await AuthContext.require(session);
    final alert = await SosAlert.db.findById(session, alertId);
    if (alert == null || alert.societyId != auth.societyId) return null;

    alert.status = SosStatus.resolved;
    alert.resolvedByName = resolvedByName;
    alert.resolvedAt = DateTime.now();
    alert.resolutionNotes = resolutionNotes;

    final updated = await SosAlert.db.updateRow(session, alert);

    final event = SosAlertEvent(
      alertId: updated.id!,
      societyId: auth.societyId,
      flatNumber: updated.flatNumber,
      raisedByName: updated.raisedByName,
      emergencyType: updated.emergencyType,
      status: updated.status,
      description: updated.description,
      raisedAt: updated.raisedAt,
    );
    await session.messages.postMessage('society_${auth.societyId}_sos', event);

    return updated;
  }
}
