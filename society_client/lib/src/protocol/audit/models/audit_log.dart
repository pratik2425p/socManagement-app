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
import '../../audit/models/audit_category.dart' as _i2;
import '../../core/models/user_role.dart' as _i3;

abstract class AuditLog implements _i1.SerializableModel {
  AuditLog._({
    this.id,
    required this.societyId,
    required this.category,
    required this.action,
    this.actorId,
    required this.actorName,
    required this.actorRole,
    required this.target,
    required this.description,
    required this.timestamp,
  });

  factory AuditLog({
    int? id,
    required int societyId,
    required _i2.AuditCategory category,
    required String action,
    int? actorId,
    required String actorName,
    required _i3.UserRole actorRole,
    required String target,
    required String description,
    required DateTime timestamp,
  }) = _AuditLogImpl;

  factory AuditLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return AuditLog(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      category: _i2.AuditCategory.fromJson(
        (jsonSerialization['category'] as String),
      ),
      action: jsonSerialization['action'] as String,
      actorId: jsonSerialization['actorId'] as int?,
      actorName: jsonSerialization['actorName'] as String,
      actorRole: _i3.UserRole.fromJson(
        (jsonSerialization['actorRole'] as String),
      ),
      target: jsonSerialization['target'] as String,
      description: jsonSerialization['description'] as String,
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int societyId;

  _i2.AuditCategory category;

  String action;

  int? actorId;

  String actorName;

  _i3.UserRole actorRole;

  String target;

  String description;

  DateTime timestamp;

  /// Returns a shallow copy of this [AuditLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AuditLog copyWith({
    int? id,
    int? societyId,
    _i2.AuditCategory? category,
    String? action,
    int? actorId,
    String? actorName,
    _i3.UserRole? actorRole,
    String? target,
    String? description,
    DateTime? timestamp,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AuditLog',
      if (id != null) 'id': id,
      'societyId': societyId,
      'category': category.toJson(),
      'action': action,
      if (actorId != null) 'actorId': actorId,
      'actorName': actorName,
      'actorRole': actorRole.toJson(),
      'target': target,
      'description': description,
      'timestamp': timestamp.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AuditLogImpl extends AuditLog {
  _AuditLogImpl({
    int? id,
    required int societyId,
    required _i2.AuditCategory category,
    required String action,
    int? actorId,
    required String actorName,
    required _i3.UserRole actorRole,
    required String target,
    required String description,
    required DateTime timestamp,
  }) : super._(
         id: id,
         societyId: societyId,
         category: category,
         action: action,
         actorId: actorId,
         actorName: actorName,
         actorRole: actorRole,
         target: target,
         description: description,
         timestamp: timestamp,
       );

  /// Returns a shallow copy of this [AuditLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AuditLog copyWith({
    Object? id = _Undefined,
    int? societyId,
    _i2.AuditCategory? category,
    String? action,
    Object? actorId = _Undefined,
    String? actorName,
    _i3.UserRole? actorRole,
    String? target,
    String? description,
    DateTime? timestamp,
  }) {
    return AuditLog(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      category: category ?? this.category,
      action: action ?? this.action,
      actorId: actorId is int? ? actorId : this.actorId,
      actorName: actorName ?? this.actorName,
      actorRole: actorRole ?? this.actorRole,
      target: target ?? this.target,
      description: description ?? this.description,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
