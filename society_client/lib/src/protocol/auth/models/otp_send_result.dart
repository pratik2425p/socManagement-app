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

abstract class OtpSendResult implements _i1.SerializableModel {
  OtpSendResult._({
    required this.success,
    required this.message,
    required this.cooldownSeconds,
    required this.expiresInSeconds,
  });

  factory OtpSendResult({
    required bool success,
    required String message,
    required int cooldownSeconds,
    required int expiresInSeconds,
  }) = _OtpSendResultImpl;

  factory OtpSendResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return OtpSendResult(
      success: _i1.BoolJsonExtension.fromJson(jsonSerialization['success']),
      message: jsonSerialization['message'] as String,
      cooldownSeconds: jsonSerialization['cooldownSeconds'] as int,
      expiresInSeconds: jsonSerialization['expiresInSeconds'] as int,
    );
  }

  bool success;

  String message;

  int cooldownSeconds;

  int expiresInSeconds;

  /// Returns a shallow copy of this [OtpSendResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  OtpSendResult copyWith({
    bool? success,
    String? message,
    int? cooldownSeconds,
    int? expiresInSeconds,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'OtpSendResult',
      'success': success,
      'message': message,
      'cooldownSeconds': cooldownSeconds,
      'expiresInSeconds': expiresInSeconds,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _OtpSendResultImpl extends OtpSendResult {
  _OtpSendResultImpl({
    required bool success,
    required String message,
    required int cooldownSeconds,
    required int expiresInSeconds,
  }) : super._(
         success: success,
         message: message,
         cooldownSeconds: cooldownSeconds,
         expiresInSeconds: expiresInSeconds,
       );

  /// Returns a shallow copy of this [OtpSendResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  OtpSendResult copyWith({
    bool? success,
    String? message,
    int? cooldownSeconds,
    int? expiresInSeconds,
  }) {
    return OtpSendResult(
      success: success ?? this.success,
      message: message ?? this.message,
      cooldownSeconds: cooldownSeconds ?? this.cooldownSeconds,
      expiresInSeconds: expiresInSeconds ?? this.expiresInSeconds,
    );
  }
}
