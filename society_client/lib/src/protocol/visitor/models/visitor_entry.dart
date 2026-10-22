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
import '../../visitor/models/visitor_status.dart' as _i2;

abstract class VisitorEntry implements _i1.SerializableModel {
  VisitorEntry._({
    this.id,
    required this.societyId,
    this.complexId,
    required this.flatNumber,
    required this.visitorName,
    required this.phoneNumber,
    required this.purpose,
    this.vehicleNumber,
    this.passcode,
    required this.status,
    required this.entryGate,
    this.checkInTime,
    this.checkOutTime,
  });

  factory VisitorEntry({
    int? id,
    required int societyId,
    int? complexId,
    required String flatNumber,
    required String visitorName,
    required String phoneNumber,
    required String purpose,
    String? vehicleNumber,
    String? passcode,
    required _i2.VisitorStatus status,
    required String entryGate,
    DateTime? checkInTime,
    DateTime? checkOutTime,
  }) = _VisitorEntryImpl;

  factory VisitorEntry.fromJson(Map<String, dynamic> jsonSerialization) {
    return VisitorEntry(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      complexId: jsonSerialization['complexId'] as int?,
      flatNumber: jsonSerialization['flatNumber'] as String,
      visitorName: jsonSerialization['visitorName'] as String,
      phoneNumber: jsonSerialization['phoneNumber'] as String,
      purpose: jsonSerialization['purpose'] as String,
      vehicleNumber: jsonSerialization['vehicleNumber'] as String?,
      passcode: jsonSerialization['passcode'] as String?,
      status: _i2.VisitorStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      entryGate: jsonSerialization['entryGate'] as String,
      checkInTime: jsonSerialization['checkInTime'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['checkInTime'],
            ),
      checkOutTime: jsonSerialization['checkOutTime'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['checkOutTime'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int societyId;

  int? complexId;

  String flatNumber;

  String visitorName;

  String phoneNumber;

  String purpose;

  String? vehicleNumber;

  String? passcode;

  _i2.VisitorStatus status;

  String entryGate;

  DateTime? checkInTime;

  DateTime? checkOutTime;

  /// Returns a shallow copy of this [VisitorEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VisitorEntry copyWith({
    int? id,
    int? societyId,
    int? complexId,
    String? flatNumber,
    String? visitorName,
    String? phoneNumber,
    String? purpose,
    String? vehicleNumber,
    String? passcode,
    _i2.VisitorStatus? status,
    String? entryGate,
    DateTime? checkInTime,
    DateTime? checkOutTime,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VisitorEntry',
      if (id != null) 'id': id,
      'societyId': societyId,
      if (complexId != null) 'complexId': complexId,
      'flatNumber': flatNumber,
      'visitorName': visitorName,
      'phoneNumber': phoneNumber,
      'purpose': purpose,
      if (vehicleNumber != null) 'vehicleNumber': vehicleNumber,
      if (passcode != null) 'passcode': passcode,
      'status': status.toJson(),
      'entryGate': entryGate,
      if (checkInTime != null) 'checkInTime': checkInTime?.toJson(),
      if (checkOutTime != null) 'checkOutTime': checkOutTime?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VisitorEntryImpl extends VisitorEntry {
  _VisitorEntryImpl({
    int? id,
    required int societyId,
    int? complexId,
    required String flatNumber,
    required String visitorName,
    required String phoneNumber,
    required String purpose,
    String? vehicleNumber,
    String? passcode,
    required _i2.VisitorStatus status,
    required String entryGate,
    DateTime? checkInTime,
    DateTime? checkOutTime,
  }) : super._(
         id: id,
         societyId: societyId,
         complexId: complexId,
         flatNumber: flatNumber,
         visitorName: visitorName,
         phoneNumber: phoneNumber,
         purpose: purpose,
         vehicleNumber: vehicleNumber,
         passcode: passcode,
         status: status,
         entryGate: entryGate,
         checkInTime: checkInTime,
         checkOutTime: checkOutTime,
       );

  /// Returns a shallow copy of this [VisitorEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VisitorEntry copyWith({
    Object? id = _Undefined,
    int? societyId,
    Object? complexId = _Undefined,
    String? flatNumber,
    String? visitorName,
    String? phoneNumber,
    String? purpose,
    Object? vehicleNumber = _Undefined,
    Object? passcode = _Undefined,
    _i2.VisitorStatus? status,
    String? entryGate,
    Object? checkInTime = _Undefined,
    Object? checkOutTime = _Undefined,
  }) {
    return VisitorEntry(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      complexId: complexId is int? ? complexId : this.complexId,
      flatNumber: flatNumber ?? this.flatNumber,
      visitorName: visitorName ?? this.visitorName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      purpose: purpose ?? this.purpose,
      vehicleNumber: vehicleNumber is String?
          ? vehicleNumber
          : this.vehicleNumber,
      passcode: passcode is String? ? passcode : this.passcode,
      status: status ?? this.status,
      entryGate: entryGate ?? this.entryGate,
      checkInTime: checkInTime is DateTime? ? checkInTime : this.checkInTime,
      checkOutTime: checkOutTime is DateTime?
          ? checkOutTime
          : this.checkOutTime,
    );
  }
}
