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

abstract class MaintenanceHead implements _i1.SerializableModel {
  MaintenanceHead._({
    this.id,
    required this.societyId,
    required this.name,
    required this.chargeType,
    required this.rate,
  });

  factory MaintenanceHead({
    int? id,
    required int societyId,
    required String name,
    required String chargeType,
    required double rate,
  }) = _MaintenanceHeadImpl;

  factory MaintenanceHead.fromJson(Map<String, dynamic> jsonSerialization) {
    return MaintenanceHead(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      name: jsonSerialization['name'] as String,
      chargeType: jsonSerialization['chargeType'] as String,
      rate: (jsonSerialization['rate'] as num).toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int societyId;

  String name;

  String chargeType;

  double rate;

  /// Returns a shallow copy of this [MaintenanceHead]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MaintenanceHead copyWith({
    int? id,
    int? societyId,
    String? name,
    String? chargeType,
    double? rate,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MaintenanceHead',
      if (id != null) 'id': id,
      'societyId': societyId,
      'name': name,
      'chargeType': chargeType,
      'rate': rate,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MaintenanceHeadImpl extends MaintenanceHead {
  _MaintenanceHeadImpl({
    int? id,
    required int societyId,
    required String name,
    required String chargeType,
    required double rate,
  }) : super._(
         id: id,
         societyId: societyId,
         name: name,
         chargeType: chargeType,
         rate: rate,
       );

  /// Returns a shallow copy of this [MaintenanceHead]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MaintenanceHead copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? name,
    String? chargeType,
    double? rate,
  }) {
    return MaintenanceHead(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      name: name ?? this.name,
      chargeType: chargeType ?? this.chargeType,
      rate: rate ?? this.rate,
    );
  }
}
