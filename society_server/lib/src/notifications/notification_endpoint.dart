import 'package:serverpod/serverpod.dart';
import '../core/auth_context.dart';
import '../generated/protocol.dart';
import 'fcm_service.dart';

class NotificationEndpoint extends Endpoint {
  /// Registers or refreshes a device FCM push token for the authenticated user.
  Future<bool> registerDeviceToken(
    Session session, {
    required String deviceToken,
    required String platform,
  }) async {
    final auth = await AuthContext.require(session);

    final existing = await DeviceToken.db.findFirstRow(
      session,
      where: (t) => t.deviceToken.equals(deviceToken),
    );

    if (existing != null) {
      existing.userId = auth.userId;
      existing.societyId = auth.societyId;
      existing.platform = platform;
      existing.updatedAt = DateTime.now();
      await DeviceToken.db.updateRow(session, existing);
    } else {
      await DeviceToken.db.insertRow(
        session,
        DeviceToken(
          userId: auth.userId,
          societyId: auth.societyId,
          deviceToken: deviceToken,
          platform: platform,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
    }

    return true;
  }

  /// Unregisters an active FCM device token (e.g. on user logout).
  Future<bool> unregisterDeviceToken(
    Session session, {
    required String deviceToken,
  }) async {
    await DeviceToken.db.deleteWhere(
      session,
      where: (t) => t.deviceToken.equals(deviceToken),
    );
    return true;
  }

  /// Purges stale device tokens that haven't been updated in over [olderThanDays] days.
  Future<int> cleanupStaleTokens(
    Session session, {
    int olderThanDays = 90,
  }) async {
    final auth = await AuthContext.require(session);
    if (!auth.isCommittee) {
      throw StateError('Access denied: Only committee members can perform token cleanup.');
    }
    return await FcmService.purgeStaleTokens(session, olderThanDays: olderThanDays);
  }
}
