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

abstract class Flat implements _i1.SerializableModel {
  Flat._({
    this.id,
    required this.societyId,
    required this.buildingId,
    required this.flatNumber,
    required this.floor,
    required this.squareFeet,
    this.intercomNumber,
    required this.status,
  });

  factory Flat({
    int? id,
    required int societyId,
    required int buildingId,
    required String flatNumber,
    required int floor,
    required double squareFeet,
    String? intercomNumber,
    required String status,
  }) = _FlatImpl;

  factory Flat.fromJson(Map<String, dynamic> jsonSerialization) {
    return Flat(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      buildingId: jsonSerialization['buildingId'] as int,
      flatNumber: jsonSerialization['flatNumber'] as String,
      floor: jsonSerialization['floor'] as int,
      squareFeet: (jsonSerialization['squareFeet'] as num).toDouble(),
      intercomNumber: jsonSerialization['intercomNumber'] as String?,
      status: jsonSerialization['status'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int societyId;

  int buildingId;

  String flatNumber;

  int floor;

  double squareFeet;

  String? intercomNumber;

  String status;

  /// Returns a shallow copy of this [Flat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Flat copyWith({
    int? id,
    int? societyId,
    int? buildingId,
    String? flatNumber,
    int? floor,
    double? squareFeet,
    String? intercomNumber,
    String? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Flat',
      if (id != null) 'id': id,
      'societyId': societyId,
      'buildingId': buildingId,
      'flatNumber': flatNumber,
      'floor': floor,
      'squareFeet': squareFeet,
      if (intercomNumber != null) 'intercomNumber': intercomNumber,
      'status': status,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FlatImpl extends Flat {
  _FlatImpl({
    int? id,
    required int societyId,
    required int buildingId,
    required String flatNumber,
    required int floor,
    required double squareFeet,
    String? intercomNumber,
    required String status,
  }) : super._(
         id: id,
         societyId: societyId,
         buildingId: buildingId,
         flatNumber: flatNumber,
         floor: floor,
         squareFeet: squareFeet,
         intercomNumber: intercomNumber,
         status: status,
       );

  /// Returns a shallow copy of this [Flat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Flat copyWith({
    Object? id = _Undefined,
    int? societyId,
    int? buildingId,
    String? flatNumber,
    int? floor,
    double? squareFeet,
    Object? intercomNumber = _Undefined,
    String? status,
  }) {
    return Flat(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      buildingId: buildingId ?? this.buildingId,
      flatNumber: flatNumber ?? this.flatNumber,
      floor: floor ?? this.floor,
      squareFeet: squareFeet ?? this.squareFeet,
      intercomNumber: intercomNumber is String?
          ? intercomNumber
          : this.intercomNumber,
      status: status ?? this.status,
    );
  }
}
