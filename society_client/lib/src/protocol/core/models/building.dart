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

abstract class Building implements _i1.SerializableModel {
  Building._({
    this.id,
    required this.societyId,
    required this.name,
    required this.totalFloors,
    required this.createdAt,
  });

  factory Building({
    int? id,
    required int societyId,
    required String name,
    required int totalFloors,
    required DateTime createdAt,
  }) = _BuildingImpl;

  factory Building.fromJson(Map<String, dynamic> jsonSerialization) {
    return Building(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      name: jsonSerialization['name'] as String,
      totalFloors: jsonSerialization['totalFloors'] as int,
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

  String name;

  int totalFloors;

  DateTime createdAt;

  /// Returns a shallow copy of this [Building]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Building copyWith({
    int? id,
    int? societyId,
    String? name,
    int? totalFloors,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Building',
      if (id != null) 'id': id,
      'societyId': societyId,
      'name': name,
      'totalFloors': totalFloors,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BuildingImpl extends Building {
  _BuildingImpl({
    int? id,
    required int societyId,
    required String name,
    required int totalFloors,
    required DateTime createdAt,
  }) : super._(
         id: id,
         societyId: societyId,
         name: name,
         totalFloors: totalFloors,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Building]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Building copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? name,
    int? totalFloors,
    DateTime? createdAt,
  }) {
    return Building(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      name: name ?? this.name,
      totalFloors: totalFloors ?? this.totalFloors,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
