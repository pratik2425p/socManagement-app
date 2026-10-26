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
import '../../core/models/society_user.dart' as _i2;
import '../../core/models/society.dart' as _i3;
import 'package:society_client/src/protocol/protocol.dart' as _i4;

abstract class AuthResponse implements _i1.SerializableModel {
  AuthResponse._({
    required this.success,
    this.message,
    this.token,
    this.user,
    this.society,
    this.attemptsRemaining,
    this.isLockedOut,
  });

  factory AuthResponse({
    required bool success,
    String? message,
    String? token,
    _i2.SocietyUser? user,
    _i3.Society? society,
    int? attemptsRemaining,
    bool? isLockedOut,
  }) = _AuthResponseImpl;

  factory AuthResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return AuthResponse(
      success: _i1.BoolJsonExtension.fromJson(jsonSerialization['success']),
      message: jsonSerialization['message'] as String?,
      token: jsonSerialization['token'] as String?,
      user: jsonSerialization['user'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.SocietyUser>(
              jsonSerialization['user'],
            ),
      society: jsonSerialization['society'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.Society>(
              jsonSerialization['society'],
            ),
      attemptsRemaining: jsonSerialization['attemptsRemaining'] as int?,
      isLockedOut: jsonSerialization['isLockedOut'] == null
          ? null
          : _i1.BoolJsonExtension.fromJson(jsonSerialization['isLockedOut']),
    );
  }

  bool success;

  String? message;

  String? token;

  _i2.SocietyUser? user;

  _i3.Society? society;

  int? attemptsRemaining;

  bool? isLockedOut;

  /// Returns a shallow copy of this [AuthResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AuthResponse copyWith({
    bool? success,
    String? message,
    String? token,
    _i2.SocietyUser? user,
    _i3.Society? society,
    int? attemptsRemaining,
    bool? isLockedOut,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AuthResponse',
      'success': success,
      if (message != null) 'message': message,
      if (token != null) 'token': token,
      if (user != null) 'user': user?.toJson(),
      if (society != null) 'society': society?.toJson(),
      if (attemptsRemaining != null) 'attemptsRemaining': attemptsRemaining,
      if (isLockedOut != null) 'isLockedOut': isLockedOut,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AuthResponseImpl extends AuthResponse {
  _AuthResponseImpl({
    required bool success,
    String? message,
    String? token,
    _i2.SocietyUser? user,
    _i3.Society? society,
    int? attemptsRemaining,
    bool? isLockedOut,
  }) : super._(
         success: success,
         message: message,
         token: token,
         user: user,
         society: society,
         attemptsRemaining: attemptsRemaining,
         isLockedOut: isLockedOut,
       );

  /// Returns a shallow copy of this [AuthResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AuthResponse copyWith({
    bool? success,
    Object? message = _Undefined,
    Object? token = _Undefined,
    Object? user = _Undefined,
    Object? society = _Undefined,
    Object? attemptsRemaining = _Undefined,
    Object? isLockedOut = _Undefined,
  }) {
    return AuthResponse(
      success: success ?? this.success,
      message: message is String? ? message : this.message,
      token: token is String? ? token : this.token,
      user: user is _i2.SocietyUser? ? user : this.user?.copyWith(),
      society: society is _i3.Society? ? society : this.society?.copyWith(),
      attemptsRemaining: attemptsRemaining is int?
          ? attemptsRemaining
          : this.attemptsRemaining,
      isLockedOut: isLockedOut is bool? ? isLockedOut : this.isLockedOut,
    );
  }
}
