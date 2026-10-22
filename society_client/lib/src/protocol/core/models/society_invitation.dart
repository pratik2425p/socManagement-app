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
import '../../core/models/user_role.dart' as _i2;

abstract class SocietyInvitation implements _i1.SerializableModel {
  SocietyInvitation._({
    this.id,
    required this.societyId,
    required this.flatNumber,
    required this.inviteeName,
    required this.phone,
    this.email,
    required this.role,
    required this.occupancyType,
    required this.inviteCode,
    required this.status,
    required this.expiresAt,
    required this.createdAt,
  });

  factory SocietyInvitation({
    int? id,
    required int societyId,
    required String flatNumber,
    required String inviteeName,
    required String phone,
    String? email,
    required _i2.UserRole role,
    required String occupancyType,
    required String inviteCode,
    required String status,
    required DateTime expiresAt,
    required DateTime createdAt,
  }) = _SocietyInvitationImpl;

  factory SocietyInvitation.fromJson(Map<String, dynamic> jsonSerialization) {
    return SocietyInvitation(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      flatNumber: jsonSerialization['flatNumber'] as String,
      inviteeName: jsonSerialization['inviteeName'] as String,
      phone: jsonSerialization['phone'] as String,
      email: jsonSerialization['email'] as String?,
      role: _i2.UserRole.fromJson((jsonSerialization['role'] as String)),
      occupancyType: jsonSerialization['occupancyType'] as String,
      inviteCode: jsonSerialization['inviteCode'] as String,
      status: jsonSerialization['status'] as String,
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int societyId;

  String flatNumber;

  String inviteeName;

  String phone;

  String? email;

  _i2.UserRole role;

  String occupancyType;

  String inviteCode;

  String status;

  DateTime expiresAt;

  DateTime createdAt;

  /// Returns a shallow copy of this [SocietyInvitation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SocietyInvitation copyWith({
    int? id,
    int? societyId,
    String? flatNumber,
    String? inviteeName,
    String? phone,
    String? email,
    _i2.UserRole? role,
    String? occupancyType,
    String? inviteCode,
    String? status,
    DateTime? expiresAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SocietyInvitation',
      if (id != null) 'id': id,
      'societyId': societyId,
      'flatNumber': flatNumber,
      'inviteeName': inviteeName,
      'phone': phone,
      if (email != null) 'email': email,
      'role': role.toJson(),
      'occupancyType': occupancyType,
      'inviteCode': inviteCode,
      'status': status,
      'expiresAt': expiresAt.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SocietyInvitationImpl extends SocietyInvitation {
  _SocietyInvitationImpl({
    int? id,
    required int societyId,
    required String flatNumber,
    required String inviteeName,
    required String phone,
    String? email,
    required _i2.UserRole role,
    required String occupancyType,
    required String inviteCode,
    required String status,
    required DateTime expiresAt,
    required DateTime createdAt,
  }) : super._(
         id: id,
         societyId: societyId,
         flatNumber: flatNumber,
         inviteeName: inviteeName,
         phone: phone,
         email: email,
         role: role,
         occupancyType: occupancyType,
         inviteCode: inviteCode,
         status: status,
         expiresAt: expiresAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [SocietyInvitation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SocietyInvitation copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? flatNumber,
    String? inviteeName,
    String? phone,
    Object? email = _Undefined,
    _i2.UserRole? role,
    String? occupancyType,
    String? inviteCode,
    String? status,
    DateTime? expiresAt,
    DateTime? createdAt,
  }) {
    return SocietyInvitation(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      flatNumber: flatNumber ?? this.flatNumber,
      inviteeName: inviteeName ?? this.inviteeName,
      phone: phone ?? this.phone,
      email: email is String? ? email : this.email,
      role: role ?? this.role,
      occupancyType: occupancyType ?? this.occupancyType,
      inviteCode: inviteCode ?? this.inviteCode,
      status: status ?? this.status,
      expiresAt: expiresAt ?? this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
