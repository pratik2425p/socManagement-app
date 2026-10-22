import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class SosEndpoint extends Endpoint {
  /// Trigger an immediate Emergency SOS Alert
  Future<SosAlert> raiseSosAlert(Session session, SosAlert alert) async {
    alert.status = SosStatus.active;
    alert.raisedAt = DateTime.now();
    return await SosAlert.db.insertRow(session, alert);
  }

  /// Get active / un-resolved emergency alerts for guards & chairman
  Future<List<SosAlert>> getActiveSosAlerts(
    Session session,
    int societyId,
  ) async {
    return await SosAlert.db.find(
      session,
      where: (t) =>
          t.societyId.equals(societyId) &
          (t.status.equals(SosStatus.active) | t.status.equals(SosStatus.acknowledged)),
      orderBy: (t) => t.raisedAt,
      orderDescending: true,
    );
  }

  /// Guard acknowledges emergency and dispatches help
  Future<SosAlert?> acknowledgeSos(
    Session session,
    int alertId,
    String acknowledgedByName,
  ) async {
    final alert = await SosAlert.db.findById(session, alertId);
    if (alert == null) return null;

    alert.status = SosStatus.acknowledged;
    alert.acknowledgedByName = acknowledgedByName;
    alert.acknowledgedAt = DateTime.now();

    return await SosAlert.db.updateRow(session, alert);
  }

  /// Resolve emergency after situation is safe
  Future<SosAlert?> resolveSos(
    Session session,
    int alertId,
    String resolvedByName,
    String resolutionNotes,
  ) async {
    final alert = await SosAlert.db.findById(session, alertId);
    if (alert == null) return null;

    alert.status = SosStatus.resolved;
    alert.resolvedByName = resolvedByName;
    alert.resolvedAt = DateTime.now();
    alert.resolutionNotes = resolutionNotes;

    return await SosAlert.db.updateRow(session, alert);
  }
}
