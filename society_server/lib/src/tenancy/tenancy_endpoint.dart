import 'package:serverpod/serverpod.dart';
import '../audit/audit_service.dart';
import '../core/auth_context.dart';
import '../generated/protocol.dart';
import '../storage/storage_service.dart';

class TenancyEndpoint extends Endpoint {
  /// List tenant NOC records for the authenticated user's society (paginated).
  Future<List<TenantNoc>> getTenantNocs(
    Session session, {
    NocStatus? status,
    int limit = 50,
    int offset = 0,
  }) async {
    final auth = await AuthContext.require(session);

    return await TenantNoc.db.find(
      session,
      where: (t) {
        var filter = t.societyId.equals(auth.societyId);
        if (status != null) {
          filter = filter & t.status.equals(status);
        }
        return filter;
      },
      limit: limit,
      offset: offset,
      orderBy: (t) => t.issuedAt,
      orderDescending: true,
    );
  }

  /// Submit a new Tenancy Agreement & NOC Request.
  /// Generates a server-side audit event inside the database transaction.
  Future<TenantNoc> submitNoc(
    Session session, {
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
    final auth = await AuthContext.require(session);

    if (documentPath != null) {
      StorageService.validateSocietyPath(documentPath, auth.societyId);
    }

    return await session.db.transaction((tx) async {
      final existingCount = await TenantNoc.db.count(
        session,
        where: (t) => t.societyId.equals(auth.societyId),
        transaction: tx,
      );

      final nocNumber = 'MH/CHS/NOC/${DateTime.now().year}/${100 + existingCount + 1}';

      final noc = TenantNoc(
        societyId: auth.societyId,
        flatNumber: flatNumber,
        ownerName: ownerName,
        ownerPhone: ownerPhone,
        tenantName: tenantName,
        tenantPhone: tenantPhone,
        leaseStart: leaseStart,
        leaseEnd: leaseEnd,
        monthlyRent: monthlyRent,
        nocNumber: nocNumber,
        status: NocStatus.approved,
        issuedAt: DateTime.now(),
        documentPath: documentPath,
        documentUrl: documentUrl,
      );

      final created = await TenantNoc.db.insertRow(session, noc, transaction: tx);

      // Server-side audit log
      await AuditService.record(
        session,
        societyId: auth.societyId,
        category: AuditCategory.memberFlat,
        action: 'TENANT_NOC_SUBMITTED',
        actorId: auth.userId,
        actorName: auth.userName,
        actorRole: auth.role,
        target: 'Flat $flatNumber ($tenantName)',
        description:
            'Tenancy NOC $nocNumber granted for $tenantName by owner $ownerName until ${leaseEnd.toIso8601String().split("T")[0]}',
        transaction: tx,
      );

      return created;
    });
  }

  /// Approve, reject, or mark NOC as expired.
  /// Requires Committee or Admin role permissions.
  Future<TenantNoc> resolveNoc(
    Session session, {
    required int nocId,
    required NocStatus status,
    String? notes,
  }) async {
    final auth = await AuthContext.require(session);

    final isStaff = auth.role == UserRole.chairman ||
        auth.role == UserRole.committee ||
        auth.role == UserRole.admin;

    if (!isStaff) {
      throw StateError('Forbidden: Only committee members and admins can resolve tenancy NOCs.');
    }

    return await session.db.transaction((tx) async {
      final noc = await TenantNoc.db.findById(session, nocId, transaction: tx);
      if (noc == null || noc.societyId != auth.societyId) {
        throw ArgumentError('NOC record not found or cross-society access denied.');
      }

      noc.status = status;
      noc.resolutionNotes = notes;
      noc.resolvedAt = DateTime.now();

      final updated = await TenantNoc.db.updateRow(session, noc, transaction: tx);

      // Server-side audit log
      await AuditService.record(
        session,
        societyId: auth.societyId,
        category: AuditCategory.memberFlat,
        action: 'TENANT_NOC_RESOLVED',
        actorId: auth.userId,
        actorName: auth.userName,
        actorRole: auth.role,
        target: 'Flat ${noc.flatNumber} (${noc.tenantName})',
        description:
            'Tenancy NOC ${noc.nocNumber} resolved to ${status.name}. Notes: ${notes ?? "None"}',
        transaction: tx,
      );

      return updated;
    });
  }
}
