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
import '../../saas_admin/models/subscription_tier.dart' as _i2;

abstract class SocietySubscription implements _i1.SerializableModel {
  SocietySubscription._({
    this.id,
    required this.societyId,
    required this.societyName,
    required this.tier,
    required this.flatCount,
    required this.ratePerFlat,
    required this.monthlyTotal,
    required this.billingCycle,
    required this.status,
    required this.nextRenewalDate,
    required this.contactEmail,
    required this.contactPhone,
    required this.createdAt,
  });

  factory SocietySubscription({
    int? id,
    required int societyId,
    required String societyName,
    required _i2.SubscriptionTier tier,
    required int flatCount,
    required double ratePerFlat,
    required double monthlyTotal,
    required String billingCycle,
    required String status,
    required DateTime nextRenewalDate,
    required String contactEmail,
    required String contactPhone,
    required DateTime createdAt,
  }) = _SocietySubscriptionImpl;

  factory SocietySubscription.fromJson(Map<String, dynamic> jsonSerialization) {
    return SocietySubscription(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      societyName: jsonSerialization['societyName'] as String,
      tier: _i2.SubscriptionTier.fromJson(
        (jsonSerialization['tier'] as String),
      ),
      flatCount: jsonSerialization['flatCount'] as int,
      ratePerFlat: (jsonSerialization['ratePerFlat'] as num).toDouble(),
      monthlyTotal: (jsonSerialization['monthlyTotal'] as num).toDouble(),
      billingCycle: jsonSerialization['billingCycle'] as String,
      status: jsonSerialization['status'] as String,
      nextRenewalDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['nextRenewalDate'],
      ),
      contactEmail: jsonSerialization['contactEmail'] as String,
      contactPhone: jsonSerialization['contactPhone'] as String,
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

  String societyName;

  _i2.SubscriptionTier tier;

  int flatCount;

  double ratePerFlat;

  double monthlyTotal;

  String billingCycle;

  String status;

  DateTime nextRenewalDate;

  String contactEmail;

  String contactPhone;

  DateTime createdAt;

  /// Returns a shallow copy of this [SocietySubscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SocietySubscription copyWith({
    int? id,
    int? societyId,
    String? societyName,
    _i2.SubscriptionTier? tier,
    int? flatCount,
    double? ratePerFlat,
    double? monthlyTotal,
    String? billingCycle,
    String? status,
    DateTime? nextRenewalDate,
    String? contactEmail,
    String? contactPhone,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SocietySubscription',
      if (id != null) 'id': id,
      'societyId': societyId,
      'societyName': societyName,
      'tier': tier.toJson(),
      'flatCount': flatCount,
      'ratePerFlat': ratePerFlat,
      'monthlyTotal': monthlyTotal,
      'billingCycle': billingCycle,
      'status': status,
      'nextRenewalDate': nextRenewalDate.toJson(),
      'contactEmail': contactEmail,
      'contactPhone': contactPhone,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SocietySubscriptionImpl extends SocietySubscription {
  _SocietySubscriptionImpl({
    int? id,
    required int societyId,
    required String societyName,
    required _i2.SubscriptionTier tier,
    required int flatCount,
    required double ratePerFlat,
    required double monthlyTotal,
    required String billingCycle,
    required String status,
    required DateTime nextRenewalDate,
    required String contactEmail,
    required String contactPhone,
    required DateTime createdAt,
  }) : super._(
         id: id,
         societyId: societyId,
         societyName: societyName,
         tier: tier,
         flatCount: flatCount,
         ratePerFlat: ratePerFlat,
         monthlyTotal: monthlyTotal,
         billingCycle: billingCycle,
         status: status,
         nextRenewalDate: nextRenewalDate,
         contactEmail: contactEmail,
         contactPhone: contactPhone,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [SocietySubscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SocietySubscription copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? societyName,
    _i2.SubscriptionTier? tier,
    int? flatCount,
    double? ratePerFlat,
    double? monthlyTotal,
    String? billingCycle,
    String? status,
    DateTime? nextRenewalDate,
    String? contactEmail,
    String? contactPhone,
    DateTime? createdAt,
  }) {
    return SocietySubscription(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      societyName: societyName ?? this.societyName,
      tier: tier ?? this.tier,
      flatCount: flatCount ?? this.flatCount,
      ratePerFlat: ratePerFlat ?? this.ratePerFlat,
      monthlyTotal: monthlyTotal ?? this.monthlyTotal,
      billingCycle: billingCycle ?? this.billingCycle,
      status: status ?? this.status,
      nextRenewalDate: nextRenewalDate ?? this.nextRenewalDate,
      contactEmail: contactEmail ?? this.contactEmail,
      contactPhone: contactPhone ?? this.contactPhone,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
