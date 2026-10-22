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

abstract class Complex implements _i1.SerializableModel {
  Complex._({
    this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.pincode,
    required this.createdAt,
  });

  factory Complex({
    int? id,
    required String name,
    required String address,
    required String city,
    required String pincode,
    required DateTime createdAt,
  }) = _ComplexImpl;

  factory Complex.fromJson(Map<String, dynamic> jsonSerialization) {
    return Complex(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      address: jsonSerialization['address'] as String,
      city: jsonSerialization['city'] as String,
      pincode: jsonSerialization['pincode'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String address;

  String city;

  String pincode;

  DateTime createdAt;

  /// Returns a shallow copy of this [Complex]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Complex copyWith({
    int? id,
    String? name,
    String? address,
    String? city,
    String? pincode,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Complex',
      if (id != null) 'id': id,
      'name': name,
      'address': address,
      'city': city,
      'pincode': pincode,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ComplexImpl extends Complex {
  _ComplexImpl({
    int? id,
    required String name,
    required String address,
    required String city,
    required String pincode,
    required DateTime createdAt,
  }) : super._(
         id: id,
         name: name,
         address: address,
         city: city,
         pincode: pincode,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Complex]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Complex copyWith({
    Object? id = _Undefined,
    String? name,
    String? address,
    String? city,
    String? pincode,
    DateTime? createdAt,
  }) {
    return Complex(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      city: city ?? this.city,
      pincode: pincode ?? this.pincode,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
