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

abstract class SocietyUser implements _i1.SerializableModel {
  SocietyUser._({
    this.id,
    required this.societyId,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.role,
    this.flatNumber,
    required this.status,
    required this.createdAt,
  });

  factory SocietyUser({
    int? id,
    required int societyId,
    required String fullName,
    required String phone,
    required String email,
    required _i2.UserRole role,
    String? flatNumber,
    required String status,
    required DateTime createdAt,
  }) = _SocietyUserImpl;

  factory SocietyUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return SocietyUser(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      fullName: jsonSerialization['fullName'] as String,
      phone: jsonSerialization['phone'] as String,
      email: jsonSerialization['email'] as String,
      role: _i2.UserRole.fromJson((jsonSerialization['role'] as String)),
      flatNumber: jsonSerialization['flatNumber'] as String?,
      status: jsonSerialization['status'] as String,
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

  String fullName;

  String phone;

  String email;

  _i2.UserRole role;

  String? flatNumber;

  String status;

  DateTime createdAt;

  /// Returns a shallow copy of this [SocietyUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SocietyUser copyWith({
    int? id,
    int? societyId,
    String? fullName,
    String? phone,
    String? email,
    _i2.UserRole? role,
    String? flatNumber,
    String? status,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SocietyUser',
      if (id != null) 'id': id,
      'societyId': societyId,
      'fullName': fullName,
      'phone': phone,
      'email': email,
      'role': role.toJson(),
      if (flatNumber != null) 'flatNumber': flatNumber,
      'status': status,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SocietyUserImpl extends SocietyUser {
  _SocietyUserImpl({
    int? id,
    required int societyId,
    required String fullName,
    required String phone,
    required String email,
    required _i2.UserRole role,
    String? flatNumber,
    required String status,
    required DateTime createdAt,
  }) : super._(
         id: id,
         societyId: societyId,
         fullName: fullName,
         phone: phone,
         email: email,
         role: role,
         flatNumber: flatNumber,
         status: status,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [SocietyUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SocietyUser copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? fullName,
    String? phone,
    String? email,
    _i2.UserRole? role,
    Object? flatNumber = _Undefined,
    String? status,
    DateTime? createdAt,
  }) {
    return SocietyUser(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      role: role ?? this.role,
      flatNumber: flatNumber is String? ? flatNumber : this.flatNumber,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
