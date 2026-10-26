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

abstract class PhoneOtp implements _i1.SerializableModel {
  PhoneOtp._({
    this.id,
    required this.phone,
    required this.salt,
    required this.otpHash,
    required this.attempts,
    required this.maxAttempts,
    required this.expiresAt,
    required this.lastSentAt,
    this.ipAddress,
    required this.isUsed,
  });

  factory PhoneOtp({
    int? id,
    required String phone,
    required String salt,
    required String otpHash,
    required int attempts,
    required int maxAttempts,
    required DateTime expiresAt,
    required DateTime lastSentAt,
    String? ipAddress,
    required bool isUsed,
  }) = _PhoneOtpImpl;

  factory PhoneOtp.fromJson(Map<String, dynamic> jsonSerialization) {
    return PhoneOtp(
      id: jsonSerialization['id'] as int?,
      phone: jsonSerialization['phone'] as String,
      salt: jsonSerialization['salt'] as String,
      otpHash: jsonSerialization['otpHash'] as String,
      attempts: jsonSerialization['attempts'] as int,
      maxAttempts: jsonSerialization['maxAttempts'] as int,
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      lastSentAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['lastSentAt'],
      ),
      ipAddress: jsonSerialization['ipAddress'] as String?,
      isUsed: _i1.BoolJsonExtension.fromJson(jsonSerialization['isUsed']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String phone;

  String salt;

  String otpHash;

  int attempts;

  int maxAttempts;

  DateTime expiresAt;

  DateTime lastSentAt;

  String? ipAddress;

  bool isUsed;

  /// Returns a shallow copy of this [PhoneOtp]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PhoneOtp copyWith({
    int? id,
    String? phone,
    String? salt,
    String? otpHash,
    int? attempts,
    int? maxAttempts,
    DateTime? expiresAt,
    DateTime? lastSentAt,
    String? ipAddress,
    bool? isUsed,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PhoneOtp',
      if (id != null) 'id': id,
      'phone': phone,
      'salt': salt,
      'otpHash': otpHash,
      'attempts': attempts,
      'maxAttempts': maxAttempts,
      'expiresAt': expiresAt.toJson(),
      'lastSentAt': lastSentAt.toJson(),
      if (ipAddress != null) 'ipAddress': ipAddress,
      'isUsed': isUsed,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PhoneOtpImpl extends PhoneOtp {
  _PhoneOtpImpl({
    int? id,
    required String phone,
    required String salt,
    required String otpHash,
    required int attempts,
    required int maxAttempts,
    required DateTime expiresAt,
    required DateTime lastSentAt,
    String? ipAddress,
    required bool isUsed,
  }) : super._(
         id: id,
         phone: phone,
         salt: salt,
         otpHash: otpHash,
         attempts: attempts,
         maxAttempts: maxAttempts,
         expiresAt: expiresAt,
         lastSentAt: lastSentAt,
         ipAddress: ipAddress,
         isUsed: isUsed,
       );

  /// Returns a shallow copy of this [PhoneOtp]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PhoneOtp copyWith({
    Object? id = _Undefined,
    String? phone,
    String? salt,
    String? otpHash,
    int? attempts,
    int? maxAttempts,
    DateTime? expiresAt,
    DateTime? lastSentAt,
    Object? ipAddress = _Undefined,
    bool? isUsed,
  }) {
    return PhoneOtp(
      id: id is int? ? id : this.id,
      phone: phone ?? this.phone,
      salt: salt ?? this.salt,
      otpHash: otpHash ?? this.otpHash,
      attempts: attempts ?? this.attempts,
      maxAttempts: maxAttempts ?? this.maxAttempts,
      expiresAt: expiresAt ?? this.expiresAt,
      lastSentAt: lastSentAt ?? this.lastSentAt,
      ipAddress: ipAddress is String? ? ipAddress : this.ipAddress,
      isUsed: isUsed ?? this.isUsed,
    );
  }
}
