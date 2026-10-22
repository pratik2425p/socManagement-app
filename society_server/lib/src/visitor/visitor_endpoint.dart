import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class VisitorEndpoint extends Endpoint {
  /// Get visitors for a society or complex
  Future<List<VisitorEntry>> getVisitors(
    Session session,
    int societyId, {
    int? complexId,
    String? flatNumber,
    VisitorStatus? status,
  }) async {
    return await VisitorEntry.db.find(
      session,
      where: (t) =>
          (complexId != null
              ? t.complexId.equals(complexId)
              : t.societyId.equals(societyId)) &
          (flatNumber != null ? t.flatNumber.equals(flatNumber) : Constant.bool(true)) &
          (status != null ? t.status.equals(status) : Constant.bool(true)),
      orderBy: (t) => t.id,
      orderDescending: true,
    );
  }

  /// Create visitor entry (can be pre-approved by resident or added by guard)
  Future<VisitorEntry> createVisitorEntry(
    Session session,
    VisitorEntry entry,
  ) async {
    return await VisitorEntry.db.insertRow(session, entry);
  }

  /// Update visitor status (e.g., approved by resident, marked inside/exited by guard)
  Future<VisitorEntry?> updateVisitorStatus(
    Session session,
    int visitorId,
    VisitorStatus status,
  ) async {
    final visitor = await VisitorEntry.db.findById(session, visitorId);
    if (visitor == null) return null;

    visitor.status = status;
    if (status == VisitorStatus.inside) {
      visitor.checkInTime = DateTime.now();
    } else if (status == VisitorStatus.exited) {
      visitor.checkOutTime = DateTime.now();
    }

    return await VisitorEntry.db.updateRow(session, visitor);
  }

  /// Verify visitor passcode at the gate
  Future<VisitorEntry?> verifyVisitorPasscode(
    Session session,
    int societyId,
    String passcode,
  ) async {
    return await VisitorEntry.db.findFirstRow(
      session,
      where: (t) =>
          t.societyId.equals(societyId) &
          t.passcode.equals(passcode) &
          t.status.equals(VisitorStatus.expected),
    );
  }
}
