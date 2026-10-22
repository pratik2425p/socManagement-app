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

abstract class SaasMetricSummary implements _i1.SerializableModel {
  SaasMetricSummary._({
    required this.totalSocieties,
    required this.activeSubscriptions,
    required this.trialSocieties,
    required this.totalManagedFlats,
    required this.monthlyRecurringRevenue,
    required this.averageRevenuePerSociety,
  });

  factory SaasMetricSummary({
    required int totalSocieties,
    required int activeSubscriptions,
    required int trialSocieties,
    required int totalManagedFlats,
    required double monthlyRecurringRevenue,
    required double averageRevenuePerSociety,
  }) = _SaasMetricSummaryImpl;

  factory SaasMetricSummary.fromJson(Map<String, dynamic> jsonSerialization) {
    return SaasMetricSummary(
      totalSocieties: jsonSerialization['totalSocieties'] as int,
      activeSubscriptions: jsonSerialization['activeSubscriptions'] as int,
      trialSocieties: jsonSerialization['trialSocieties'] as int,
      totalManagedFlats: jsonSerialization['totalManagedFlats'] as int,
      monthlyRecurringRevenue:
          (jsonSerialization['monthlyRecurringRevenue'] as num).toDouble(),
      averageRevenuePerSociety:
          (jsonSerialization['averageRevenuePerSociety'] as num).toDouble(),
    );
  }

  int totalSocieties;

  int activeSubscriptions;

  int trialSocieties;

  int totalManagedFlats;

  double monthlyRecurringRevenue;

  double averageRevenuePerSociety;

  /// Returns a shallow copy of this [SaasMetricSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SaasMetricSummary copyWith({
    int? totalSocieties,
    int? activeSubscriptions,
    int? trialSocieties,
    int? totalManagedFlats,
    double? monthlyRecurringRevenue,
    double? averageRevenuePerSociety,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SaasMetricSummary',
      'totalSocieties': totalSocieties,
      'activeSubscriptions': activeSubscriptions,
      'trialSocieties': trialSocieties,
      'totalManagedFlats': totalManagedFlats,
      'monthlyRecurringRevenue': monthlyRecurringRevenue,
      'averageRevenuePerSociety': averageRevenuePerSociety,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SaasMetricSummaryImpl extends SaasMetricSummary {
  _SaasMetricSummaryImpl({
    required int totalSocieties,
    required int activeSubscriptions,
    required int trialSocieties,
    required int totalManagedFlats,
    required double monthlyRecurringRevenue,
    required double averageRevenuePerSociety,
  }) : super._(
         totalSocieties: totalSocieties,
         activeSubscriptions: activeSubscriptions,
         trialSocieties: trialSocieties,
         totalManagedFlats: totalManagedFlats,
         monthlyRecurringRevenue: monthlyRecurringRevenue,
         averageRevenuePerSociety: averageRevenuePerSociety,
       );

  /// Returns a shallow copy of this [SaasMetricSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SaasMetricSummary copyWith({
    int? totalSocieties,
    int? activeSubscriptions,
    int? trialSocieties,
    int? totalManagedFlats,
    double? monthlyRecurringRevenue,
    double? averageRevenuePerSociety,
  }) {
    return SaasMetricSummary(
      totalSocieties: totalSocieties ?? this.totalSocieties,
      activeSubscriptions: activeSubscriptions ?? this.activeSubscriptions,
      trialSocieties: trialSocieties ?? this.trialSocieties,
      totalManagedFlats: totalManagedFlats ?? this.totalManagedFlats,
      monthlyRecurringRevenue:
          monthlyRecurringRevenue ?? this.monthlyRecurringRevenue,
      averageRevenuePerSociety:
          averageRevenuePerSociety ?? this.averageRevenuePerSociety,
    );
  }
}
