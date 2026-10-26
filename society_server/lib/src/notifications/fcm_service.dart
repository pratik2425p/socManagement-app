import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Firebase Cloud Messaging (FCM) service.
/// Dispatches push notifications for gate bell, SOS, bill reminders, and notices.
/// Manages device token persistence, priority escalation, and stale token eviction.
class FcmService {
  /// History of dispatched push notifications (retained for integration test assertions and logging)
  static final List<PushNotificationPayload> sentPayloads = [];

  /// Dispatches a push notification to all active devices of a user.
  static Future<int> sendToUser(
    Session session, {
    required int userId,
    required String title,
    required String body,
    Map<String, String>? data,
    bool highPriority = false,
  }) async {
    final tokens = await DeviceToken.db.find(
      session,
      where: (t) => t.userId.equals(userId),
    );

    int deliveredCount = 0;
    for (final token in tokens) {
      final success = await _dispatchPush(
        session,
        tokenRecord: token,
        title: title,
        body: body,
        data: data,
        highPriority: highPriority,
      );
      if (success) deliveredCount++;
    }

    return deliveredCount;
  }

  /// Dispatches a push notification to all residents assigned to a specific flat in a society.
  static Future<int> sendToFlat(
    Session session, {
    required int societyId,
    required String flatNumber,
    required String title,
    required String body,
    Map<String, String>? data,
    bool highPriority = false,
  }) async {
    final residents = await SocietyUser.db.find(
      session,
      where: (t) => t.societyId.equals(societyId) & t.flatNumber.equals(flatNumber),
    );

    int totalDelivered = 0;
    for (final resident in residents) {
      if (resident.id != null) {
        final count = await sendToUser(
          session,
          userId: resident.id!,
          title: title,
          body: body,
          data: data,
          highPriority: highPriority,
        );
        totalDelivered += count;
      }
    }

    return totalDelivered;
  }

  /// Dispatches a push notification to all users of a society (e.g., SOS alert or society-wide notice).
  static Future<int> sendToSociety(
    Session session, {
    required int societyId,
    required String title,
    required String body,
    Map<String, String>? data,
    bool highPriority = false,
  }) async {
    final users = await SocietyUser.db.find(
      session,
      where: (t) => t.societyId.equals(societyId),
    );

    int totalDelivered = 0;
    for (final user in users) {
      if (user.id != null) {
        final count = await sendToUser(
          session,
          userId: user.id!,
          title: title,
          body: body,
          data: data,
          highPriority: highPriority,
        );
        totalDelivered += count;
      }
    }

    return totalDelivered;
  }

  /// Removes tokens older than [olderThanDays] (default 90 days).
  static Future<int> purgeStaleTokens(
    Session session, {
    int olderThanDays = 90,
  }) async {
    final threshold = DateTime.now().subtract(Duration(days: olderThanDays));
    final deleted = await DeviceToken.db.deleteWhere(
      session,
      where: (t) => t.updatedAt < threshold,
    );
    return deleted.length;
  }

  static Future<bool> _dispatchPush(
    Session session, {
    required DeviceToken tokenRecord,
    required String title,
    required String body,
    Map<String, String>? data,
    required bool highPriority,
  }) async {
    final payload = PushNotificationPayload(
      title: title,
      body: body,
      highPriority: highPriority,
      data: data,
      targetToken: tokenRecord.deviceToken,
      sentAt: DateTime.now(),
    );
    sentPayloads.add(payload);

    final fcmKey = session.server.serverpod.getPassword('fcmServerKey');

    // If live credentials are missing (e.g. dev or testing), record and simulate success
    if (fcmKey == null || fcmKey.isEmpty) {
      session.log(
        '[FCM DEV SIMULATION] Push sent to token "${tokenRecord.deviceToken}" | Priority: ${highPriority ? "HIGH" : "NORMAL"} | $title - $body',
      );
      return true;
    }

    try {
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'key=$fcmKey',
      };

      final bodyJson = jsonEncode({
        'to': tokenRecord.deviceToken,
        'priority': highPriority ? 'high' : 'normal',
        'notification': {
          'title': title,
          'body': body,
          'sound': 'default',
        },
        'android': {
          'priority': highPriority ? 'high' : 'normal',
          'notification': {
            'channel_id': highPriority ? 'emergency_channel' : 'default_channel',
          },
        },
        'apns': {
          'headers': {
            'apns-priority': highPriority ? '10' : '5',
          },
        },
        'data': data ?? {},
      });

      final response = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: headers,
        body: bodyJson,
      );

      if (response.statusCode == 200) {
        final resData = jsonDecode(response.body);
        if (resData is Map && resData['results'] is List && resData['results'].isNotEmpty) {
          final firstResult = resData['results'][0];
          final error = firstResult['error'];
          // Remove stale/unregistered token immediately
          if (error == 'NotRegistered' || error == 'InvalidRegistration') {
            session.log('[FCM] Token invalid/unregistered. Removing from DB: ${tokenRecord.deviceToken}');
            await DeviceToken.db.deleteRow(session, tokenRecord);
            return false;
          }
        }
        return true;
      } else {
        session.log('[FCM Error] Status: ${response.statusCode}, Body: ${response.body}');
        return false;
      }
    } catch (e) {
      session.log('[FCM Exception] Failed to send push: $e');
      return false;
    }
  }
}
