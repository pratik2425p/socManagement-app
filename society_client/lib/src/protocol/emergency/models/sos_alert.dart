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
import '../../emergency/models/emergency_type.dart' as _i2;
import '../../emergency/models/sos_status.dart' as _i3;

abstract class SosAlert implements _i1.SerializableModel {
  SosAlert._({
    this.id,
    required this.societyId,
    required this.flatNumber,
    required this.raisedByName,
    required this.emergencyType,
    this.description,
    required this.status,
    this.acknowledgedByName,
    this.acknowledgedAt,
    this.resolvedByName,
    this.resolvedAt,
    this.resolutionNotes,
    required this.raisedAt,
  });

  factory SosAlert({
    int? id,
    required int societyId,
    required String flatNumber,
    required String raisedByName,
    required _i2.EmergencyType emergencyType,
    String? description,
    required _i3.SosStatus status,
    String? acknowledgedByName,
    DateTime? acknowledgedAt,
    String? resolvedByName,
    DateTime? resolvedAt,
    String? resolutionNotes,
    required DateTime raisedAt,
  }) = _SosAlertImpl;

  factory SosAlert.fromJson(Map<String, dynamic> jsonSerialization) {
    return SosAlert(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      flatNumber: jsonSerialization['flatNumber'] as String,
      raisedByName: jsonSerialization['raisedByName'] as String,
      emergencyType: _i2.EmergencyType.fromJson(
        (jsonSerialization['emergencyType'] as String),
      ),
      description: jsonSerialization['description'] as String?,
      status: _i3.SosStatus.fromJson((jsonSerialization['status'] as String)),
      acknowledgedByName: jsonSerialization['acknowledgedByName'] as String?,
      acknowledgedAt: jsonSerialization['acknowledgedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['acknowledgedAt'],
            ),
      resolvedByName: jsonSerialization['resolvedByName'] as String?,
      resolvedAt: jsonSerialization['resolvedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['resolvedAt']),
      resolutionNotes: jsonSerialization['resolutionNotes'] as String?,
      raisedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['raisedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int societyId;

  String flatNumber;

  String raisedByName;

  _i2.EmergencyType emergencyType;

  String? description;

  _i3.SosStatus status;

  String? acknowledgedByName;

  DateTime? acknowledgedAt;

  String? resolvedByName;

  DateTime? resolvedAt;

  String? resolutionNotes;

  DateTime raisedAt;

  /// Returns a shallow copy of this [SosAlert]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SosAlert copyWith({
    int? id,
    int? societyId,
    String? flatNumber,
    String? raisedByName,
    _i2.EmergencyType? emergencyType,
    String? description,
    _i3.SosStatus? status,
    String? acknowledgedByName,
    DateTime? acknowledgedAt,
    String? resolvedByName,
    DateTime? resolvedAt,
    String? resolutionNotes,
    DateTime? raisedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SosAlert',
      if (id != null) 'id': id,
      'societyId': societyId,
      'flatNumber': flatNumber,
      'raisedByName': raisedByName,
      'emergencyType': emergencyType.toJson(),
      if (description != null) 'description': description,
      'status': status.toJson(),
      if (acknowledgedByName != null) 'acknowledgedByName': acknowledgedByName,
      if (acknowledgedAt != null) 'acknowledgedAt': acknowledgedAt?.toJson(),
      if (resolvedByName != null) 'resolvedByName': resolvedByName,
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
      if (resolutionNotes != null) 'resolutionNotes': resolutionNotes,
      'raisedAt': raisedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SosAlertImpl extends SosAlert {
  _SosAlertImpl({
    int? id,
    required int societyId,
    required String flatNumber,
    required String raisedByName,
    required _i2.EmergencyType emergencyType,
    String? description,
    required _i3.SosStatus status,
    String? acknowledgedByName,
    DateTime? acknowledgedAt,
    String? resolvedByName,
    DateTime? resolvedAt,
    String? resolutionNotes,
    required DateTime raisedAt,
  }) : super._(
         id: id,
         societyId: societyId,
         flatNumber: flatNumber,
         raisedByName: raisedByName,
         emergencyType: emergencyType,
         description: description,
         status: status,
         acknowledgedByName: acknowledgedByName,
         acknowledgedAt: acknowledgedAt,
         resolvedByName: resolvedByName,
         resolvedAt: resolvedAt,
         resolutionNotes: resolutionNotes,
         raisedAt: raisedAt,
       );

  /// Returns a shallow copy of this [SosAlert]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SosAlert copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? flatNumber,
    String? raisedByName,
    _i2.EmergencyType? emergencyType,
    Object? description = _Undefined,
    _i3.SosStatus? status,
    Object? acknowledgedByName = _Undefined,
    Object? acknowledgedAt = _Undefined,
    Object? resolvedByName = _Undefined,
    Object? resolvedAt = _Undefined,
    Object? resolutionNotes = _Undefined,
    DateTime? raisedAt,
  }) {
    return SosAlert(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      flatNumber: flatNumber ?? this.flatNumber,
      raisedByName: raisedByName ?? this.raisedByName,
      emergencyType: emergencyType ?? this.emergencyType,
      description: description is String? ? description : this.description,
      status: status ?? this.status,
      acknowledgedByName: acknowledgedByName is String?
          ? acknowledgedByName
          : this.acknowledgedByName,
      acknowledgedAt: acknowledgedAt is DateTime?
          ? acknowledgedAt
          : this.acknowledgedAt,
      resolvedByName: resolvedByName is String?
          ? resolvedByName
          : this.resolvedByName,
      resolvedAt: resolvedAt is DateTime? ? resolvedAt : this.resolvedAt,
      resolutionNotes: resolutionNotes is String?
          ? resolutionNotes
          : this.resolutionNotes,
      raisedAt: raisedAt ?? this.raisedAt,
    );
  }
}
