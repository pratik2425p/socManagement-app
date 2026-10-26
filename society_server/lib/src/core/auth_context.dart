import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Centralized authenticated session context.
/// Extracts and verifies user, societyId, and role from the authenticated session.
class AuthContext {
  final SocietyUser user;

  AuthContext({required this.user});

  int get societyId => user.societyId;
  UserRole get role => user.role;
  int get userId => user.id!;
  String get userName => user.fullName;
  String? get flatNumber => user.flatNumber;

  /// Whether the user has committee/management privileges
  bool get isCommittee =>
      role == UserRole.chairman ||
      role == UserRole.committee ||
      role == UserRole.admin ||
      role == UserRole.accountant;

  /// Verifies that the authenticated user possesses one of the [allowedRoles].
  /// Throws [StateError] if unauthorized.
  void requireRole(Set<UserRole> allowedRoles) {
    if (!allowedRoles.contains(user.role)) {
      throw StateError(
        'Access denied: Role ${user.role.name} is not authorized for this operation.',
      );
    }
  }

  /// Verifies that the authenticated user has access to [targetSocietyId].
  /// SaaS super admin (role `admin`) has cross-society platform access.
  /// Throws [StateError] if caller attempts to access another society's data.
  void requireSociety(int targetSocietyId) {
    if (user.role != UserRole.admin && user.societyId != targetSocietyId) {
      throw StateError(
        'Access denied: Cross-society access not allowed.',
      );
    }
  }

  /// Resolves the authenticated user from the Serverpod session.
  /// Throws [StateError] if session is not authenticated or user cannot be found.
  static Future<AuthContext> require(Session session) async {
    final authInfo = session.authenticated;
    if (authInfo == null) {
      throw StateError('Unauthorized: You must be authenticated to perform this operation.');
    }

    // Match by userIdentifier (AuthUser UUID, phone, or email)
    final identifier = authInfo.userIdentifier;

    SocietyUser? user = await SocietyUser.db.findFirstRow(
      session,
      where: (t) => t.authUserId.equals(identifier),
    );

    user ??= await SocietyUser.db.findFirstRow(
      session,
      where: (t) => t.phone.equals(identifier) | t.email.equals(identifier),
    );

    final intId = int.tryParse(identifier);
    if (user == null && intId != null) {
      user = await SocietyUser.db.findById(session, intId);
    }

    if (user == null) {
      throw StateError('User not found in society directory: $identifier');
    }

    return AuthContext(user: user);
  }
}
