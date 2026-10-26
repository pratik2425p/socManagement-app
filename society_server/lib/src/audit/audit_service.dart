import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Server-side append-only Audit Log recorder.
/// Can be invoked directly or within an existing database transaction.
class AuditService {
  AuditService._();

  static Future<AuditLog> record(
    Session session, {
    required int societyId,
    required AuditCategory category,
    required String action,
    int? actorId,
    required String actorName,
    required UserRole actorRole,
    required String target,
    required String description,
    Transaction? transaction,
  }) async {
    final entry = AuditLog(
      societyId: societyId,
      category: category,
      action: action,
      actorId: actorId,
      actorName: actorName,
      actorRole: actorRole,
      target: target,
      description: description,
      timestamp: DateTime.now(),
    );

    return await AuditLog.db.insertRow(
      session,
      entry,
      transaction: transaction,
    );
  }
}
