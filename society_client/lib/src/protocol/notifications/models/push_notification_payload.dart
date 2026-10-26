/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'package:society_client/src/protocol/protocol.dart' as _i2;

abstract class PushNotificationPayload implements _i1.SerializableModel {
  PushNotificationPayload._({
    required this.title,
    required this.body,
    required this.highPriority,
    this.data,
    this.targetToken,
    required this.sentAt,
  });

  factory PushNotificationPayload({
    required String title,
    required String body,
    required bool highPriority,
    Map<String, String>? data,
    String? targetToken,
    required DateTime sentAt,
  }) = _PushNotificationPayloadImpl;

  factory PushNotificationPayload.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return PushNotificationPayload(
      title: jsonSerialization['title'] as String,
      body: jsonSerialization['body'] as String,
      highPriority: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['highPriority'],
      ),
      data: jsonSerialization['data'] == null
          ? null
          : _i2.Protocol().deserialize<Map<String, String>>(
              jsonSerialization['data'],
            ),
      targetToken: jsonSerialization['targetToken'] as String?,
      sentAt: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['sentAt']),
    );
  }

  String title;

  String body;

  bool highPriority;

  Map<String, String>? data;

  String? targetToken;

  DateTime sentAt;

  /// Returns a shallow copy of this [PushNotificationPayload]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PushNotificationPayload copyWith({
    String? title,
    String? body,
    bool? highPriority,
    Map<String, String>? data,
    String? targetToken,
    DateTime? sentAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PushNotificationPayload',
      'title': title,
      'body': body,
      'highPriority': highPriority,
      if (data != null) 'data': data?.toJson(),
      if (targetToken != null) 'targetToken': targetToken,
      'sentAt': sentAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PushNotificationPayloadImpl extends PushNotificationPayload {
  _PushNotificationPayloadImpl({
    required String title,
    required String body,
    required bool highPriority,
    Map<String, String>? data,
    String? targetToken,
    required DateTime sentAt,
  }) : super._(
         title: title,
         body: body,
         highPriority: highPriority,
         data: data,
         targetToken: targetToken,
         sentAt: sentAt,
       );

  /// Returns a shallow copy of this [PushNotificationPayload]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PushNotificationPayload copyWith({
    String? title,
    String? body,
    bool? highPriority,
    Object? data = _Undefined,
    Object? targetToken = _Undefined,
    DateTime? sentAt,
  }) {
    return PushNotificationPayload(
      title: title ?? this.title,
      body: body ?? this.body,
      highPriority: highPriority ?? this.highPriority,
      data: data is Map<String, String>?
          ? data
          : this.data?.map(
              (
                key0,
                value0,
              ) => MapEntry(
                key0,
                value0,
              ),
            ),
      targetToken: targetToken is String? ? targetToken : this.targetToken,
      sentAt: sentAt ?? this.sentAt,
    );
  }
}
