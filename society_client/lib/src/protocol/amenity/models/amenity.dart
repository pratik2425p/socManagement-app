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
import 'package:society_client/src/protocol/protocol.dart' as _i2;

abstract class Amenity implements _i1.SerializableModel {
  Amenity._({
    this.id,
    required this.societyId,
    required this.name,
    required this.icon,
    required this.capacity,
    required this.rate,
    required this.unit,
    required this.timeSlots,
    required this.description,
    required this.rules,
    required this.isActive,
    required this.createdAt,
  });

  factory Amenity({
    int? id,
    required int societyId,
    required String name,
    required String icon,
    required int capacity,
    required double rate,
    required String unit,
    required List<String> timeSlots,
    required String description,
    required String rules,
    required bool isActive,
    required DateTime createdAt,
  }) = _AmenityImpl;

  factory Amenity.fromJson(Map<String, dynamic> jsonSerialization) {
    return Amenity(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      name: jsonSerialization['name'] as String,
      icon: jsonSerialization['icon'] as String,
      capacity: jsonSerialization['capacity'] as int,
      rate: (jsonSerialization['rate'] as num).toDouble(),
      unit: jsonSerialization['unit'] as String,
      timeSlots: _i2.Protocol().deserialize<List<String>>(
        jsonSerialization['timeSlots'],
      ),
      description: jsonSerialization['description'] as String,
      rules: jsonSerialization['rules'] as String,
      isActive: _i1.BoolJsonExtension.fromJson(jsonSerialization['isActive']),
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

  String icon;

  int capacity;

  double rate;

  String unit;

  List<String> timeSlots;

  String description;

  String rules;

  bool isActive;

  DateTime createdAt;

  /// Returns a shallow copy of this [Amenity]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Amenity copyWith({
    int? id,
    int? societyId,
    String? name,
    String? icon,
    int? capacity,
    double? rate,
    String? unit,
    List<String>? timeSlots,
    String? description,
    String? rules,
    bool? isActive,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Amenity',
      if (id != null) 'id': id,
      'societyId': societyId,
      'name': name,
      'icon': icon,
      'capacity': capacity,
      'rate': rate,
      'unit': unit,
      'timeSlots': timeSlots.toJson(),
      'description': description,
      'rules': rules,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AmenityImpl extends Amenity {
  _AmenityImpl({
    int? id,
    required int societyId,
    required String name,
    required String icon,
    required int capacity,
    required double rate,
    required String unit,
    required List<String> timeSlots,
    required String description,
    required String rules,
    required bool isActive,
    required DateTime createdAt,
  }) : super._(
         id: id,
         societyId: societyId,
         name: name,
         icon: icon,
         capacity: capacity,
         rate: rate,
         unit: unit,
         timeSlots: timeSlots,
         description: description,
         rules: rules,
         isActive: isActive,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Amenity]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Amenity copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? name,
    String? icon,
    int? capacity,
    double? rate,
    String? unit,
    List<String>? timeSlots,
    String? description,
    String? rules,
    bool? isActive,
    DateTime? createdAt,
  }) {
    return Amenity(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      capacity: capacity ?? this.capacity,
      rate: rate ?? this.rate,
      unit: unit ?? this.unit,
      timeSlots: timeSlots ?? this.timeSlots.map((e0) => e0).toList(),
      description: description ?? this.description,
      rules: rules ?? this.rules,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
