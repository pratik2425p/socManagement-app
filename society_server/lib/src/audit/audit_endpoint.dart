import 'package:serverpod/serverpod.dart';
import '../core/auth_context.dart';
import '../generated/protocol.dart';
import 'audit_service.dart';

class AuditEndpoint extends Endpoint {
  /// Fetch immutable audit logs for the authenticated society (paginated).
  Future<List<AuditLog>> getAuditLogs(
    Session session, {
    AuditCategory? category,
    int limit = 50,
    int offset = 0,
  }) async {
    final auth = await AuthContext.require(session);

    return await AuditLog.db.find(
      session,
      where: (t) {
        var filter = t.societyId.equals(auth.societyId);
        if (category != null) {
          filter = filter & t.category.equals(category);
        }
        return filter;
      },
      limit: limit,
      offset: offset,
      orderBy: (t) => t.timestamp,
      orderDescending: true,
    );
  }

  /// Explicit event logging by authorized users. Actor details and societyId are
  /// verified and enforced from the authenticated session.
  Future<AuditLog> logEvent(
    Session session, {
    required AuditCategory category,
    required String action,
    required String target,
    required String description,
  }) async {
    final auth = await AuthContext.require(session);

    return await AuditService.record(
      session,
      societyId: auth.societyId,
      category: category,
      action: action,
      actorId: auth.userId,
      actorName: auth.userName,
      actorRole: auth.role,
      target: target,
      description: description,
    );
  }
}
