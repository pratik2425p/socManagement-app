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
import 'package:serverpod/serverpod.dart' as _i1;
import '../../emergency/models/emergency_type.dart' as _i2;
import '../../emergency/models/sos_status.dart' as _i3;

abstract class SosAlertEvent
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  SosAlertEvent._({
    required this.alertId,
    required this.societyId,
    required this.flatNumber,
    required this.raisedByName,
    required this.emergencyType,
    required this.status,
    this.description,
    required this.raisedAt,
  });

  factory SosAlertEvent({
    required int alertId,
    required int societyId,
    required String flatNumber,
    required String raisedByName,
    required _i2.EmergencyType emergencyType,
    required _i3.SosStatus status,
    String? description,
    required DateTime raisedAt,
  }) = _SosAlertEventImpl;

  factory SosAlertEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return SosAlertEvent(
      alertId: jsonSerialization['alertId'] as int,
      societyId: jsonSerialization['societyId'] as int,
      flatNumber: jsonSerialization['flatNumber'] as String,
      raisedByName: jsonSerialization['raisedByName'] as String,
      emergencyType: _i2.EmergencyType.fromJson(
        (jsonSerialization['emergencyType'] as String),
      ),
      status: _i3.SosStatus.fromJson((jsonSerialization['status'] as String)),
      description: jsonSerialization['description'] as String?,
      raisedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['raisedAt'],
      ),
    );
  }

  int alertId;

  int societyId;

  String flatNumber;

  String raisedByName;

  _i2.EmergencyType emergencyType;

  _i3.SosStatus status;

  String? description;

  DateTime raisedAt;

  /// Returns a shallow copy of this [SosAlertEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SosAlertEvent copyWith({
    int? alertId,
    int? societyId,
    String? flatNumber,
    String? raisedByName,
    _i2.EmergencyType? emergencyType,
    _i3.SosStatus? status,
    String? description,
    DateTime? raisedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SosAlertEvent',
      'alertId': alertId,
      'societyId': societyId,
      'flatNumber': flatNumber,
      'raisedByName': raisedByName,
      'emergencyType': emergencyType.toJson(),
      'status': status.toJson(),
      if (description != null) 'description': description,
      'raisedAt': raisedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SosAlertEvent',
      'alertId': alertId,
      'societyId': societyId,
      'flatNumber': flatNumber,
      'raisedByName': raisedByName,
      'emergencyType': emergencyType.toJson(),
      'status': status.toJson(),
      if (description != null) 'description': description,
      'raisedAt': raisedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SosAlertEventImpl extends SosAlertEvent {
  _SosAlertEventImpl({
    required int alertId,
    required int societyId,
    required String flatNumber,
    required String raisedByName,
    required _i2.EmergencyType emergencyType,
    required _i3.SosStatus status,
    String? description,
    required DateTime raisedAt,
  }) : super._(
         alertId: alertId,
         societyId: societyId,
         flatNumber: flatNumber,
         raisedByName: raisedByName,
         emergencyType: emergencyType,
         status: status,
         description: description,
         raisedAt: raisedAt,
       );

  /// Returns a shallow copy of this [SosAlertEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SosAlertEvent copyWith({
    int? alertId,
    int? societyId,
    String? flatNumber,
    String? raisedByName,
    _i2.EmergencyType? emergencyType,
    _i3.SosStatus? status,
    Object? description = _Undefined,
    DateTime? raisedAt,
  }) {
    return SosAlertEvent(
      alertId: alertId ?? this.alertId,
      societyId: societyId ?? this.societyId,
      flatNumber: flatNumber ?? this.flatNumber,
      raisedByName: raisedByName ?? this.raisedByName,
      emergencyType: emergencyType ?? this.emergencyType,
      status: status ?? this.status,
      description: description is String? ? description : this.description,
      raisedAt: raisedAt ?? this.raisedAt,
    );
  }
}
