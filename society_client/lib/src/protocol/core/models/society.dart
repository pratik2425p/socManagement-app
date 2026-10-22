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

abstract class Society implements _i1.SerializableModel {
  Society._({
    this.id,
    required this.name,
    required this.code,
    required this.address,
    required this.city,
    required this.state,
    required this.pincode,
    required this.totalFlats,
    required this.subscriptionPlan,
    required this.subscriptionStatus,
    this.complexId,
    required this.createdAt,
  });

  factory Society({
    int? id,
    required String name,
    required String code,
    required String address,
    required String city,
    required String state,
    required String pincode,
    required int totalFlats,
    required String subscriptionPlan,
    required String subscriptionStatus,
    int? complexId,
    required DateTime createdAt,
  }) = _SocietyImpl;

  factory Society.fromJson(Map<String, dynamic> jsonSerialization) {
    return Society(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      code: jsonSerialization['code'] as String,
      address: jsonSerialization['address'] as String,
      city: jsonSerialization['city'] as String,
      state: jsonSerialization['state'] as String,
      pincode: jsonSerialization['pincode'] as String,
      totalFlats: jsonSerialization['totalFlats'] as int,
      subscriptionPlan: jsonSerialization['subscriptionPlan'] as String,
      subscriptionStatus: jsonSerialization['subscriptionStatus'] as String,
      complexId: jsonSerialization['complexId'] as int?,
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

  String code;

  String address;

  String city;

  String state;

  String pincode;

  int totalFlats;

  String subscriptionPlan;

  String subscriptionStatus;

  int? complexId;

  DateTime createdAt;

  /// Returns a shallow copy of this [Society]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Society copyWith({
    int? id,
    String? name,
    String? code,
    String? address,
    String? city,
    String? state,
    String? pincode,
    int? totalFlats,
    String? subscriptionPlan,
    String? subscriptionStatus,
    int? complexId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Society',
      if (id != null) 'id': id,
      'name': name,
      'code': code,
      'address': address,
      'city': city,
      'state': state,
      'pincode': pincode,
      'totalFlats': totalFlats,
      'subscriptionPlan': subscriptionPlan,
      'subscriptionStatus': subscriptionStatus,
      if (complexId != null) 'complexId': complexId,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SocietyImpl extends Society {
  _SocietyImpl({
    int? id,
    required String name,
    required String code,
    required String address,
    required String city,
    required String state,
    required String pincode,
    required int totalFlats,
    required String subscriptionPlan,
    required String subscriptionStatus,
    int? complexId,
    required DateTime createdAt,
  }) : super._(
         id: id,
         name: name,
         code: code,
         address: address,
         city: city,
         state: state,
         pincode: pincode,
         totalFlats: totalFlats,
         subscriptionPlan: subscriptionPlan,
         subscriptionStatus: subscriptionStatus,
         complexId: complexId,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Society]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Society copyWith({
    Object? id = _Undefined,
    String? name,
    String? code,
    String? address,
    String? city,
    String? state,
    String? pincode,
    int? totalFlats,
    String? subscriptionPlan,
    String? subscriptionStatus,
    Object? complexId = _Undefined,
    DateTime? createdAt,
  }) {
    return Society(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      totalFlats: totalFlats ?? this.totalFlats,
      subscriptionPlan: subscriptionPlan ?? this.subscriptionPlan,
      subscriptionStatus: subscriptionStatus ?? this.subscriptionStatus,
      complexId: complexId is int? ? complexId : this.complexId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
