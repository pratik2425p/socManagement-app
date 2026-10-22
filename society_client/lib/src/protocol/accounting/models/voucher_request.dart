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
import '../../accounting/models/voucher_status.dart' as _i2;

abstract class VoucherRequest implements _i1.SerializableModel {
  VoucherRequest._({
    this.id,
    required this.societyId,
    required this.voucherNumber,
    required this.title,
    required this.description,
    required this.amount,
    required this.category,
    required this.requestedByName,
    required this.status,
    this.rejectionReason,
    this.approvedByName,
    this.approvedAt,
    required this.createdAt,
  });

  factory VoucherRequest({
    int? id,
    required int societyId,
    required String voucherNumber,
    required String title,
    required String description,
    required double amount,
    required String category,
    required String requestedByName,
    required _i2.VoucherStatus status,
    String? rejectionReason,
    String? approvedByName,
    DateTime? approvedAt,
    required DateTime createdAt,
  }) = _VoucherRequestImpl;

  factory VoucherRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return VoucherRequest(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      voucherNumber: jsonSerialization['voucherNumber'] as String,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      amount: (jsonSerialization['amount'] as num).toDouble(),
      category: jsonSerialization['category'] as String,
      requestedByName: jsonSerialization['requestedByName'] as String,
      status: _i2.VoucherStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      rejectionReason: jsonSerialization['rejectionReason'] as String?,
      approvedByName: jsonSerialization['approvedByName'] as String?,
      approvedAt: jsonSerialization['approvedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['approvedAt']),
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

  String voucherNumber;

  String title;

  String description;

  double amount;

  String category;

  String requestedByName;

  _i2.VoucherStatus status;

  String? rejectionReason;

  String? approvedByName;

  DateTime? approvedAt;

  DateTime createdAt;

  /// Returns a shallow copy of this [VoucherRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VoucherRequest copyWith({
    int? id,
    int? societyId,
    String? voucherNumber,
    String? title,
    String? description,
    double? amount,
    String? category,
    String? requestedByName,
    _i2.VoucherStatus? status,
    String? rejectionReason,
    String? approvedByName,
    DateTime? approvedAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VoucherRequest',
      if (id != null) 'id': id,
      'societyId': societyId,
      'voucherNumber': voucherNumber,
      'title': title,
      'description': description,
      'amount': amount,
      'category': category,
      'requestedByName': requestedByName,
      'status': status.toJson(),
      if (rejectionReason != null) 'rejectionReason': rejectionReason,
      if (approvedByName != null) 'approvedByName': approvedByName,
      if (approvedAt != null) 'approvedAt': approvedAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VoucherRequestImpl extends VoucherRequest {
  _VoucherRequestImpl({
    int? id,
    required int societyId,
    required String voucherNumber,
    required String title,
    required String description,
    required double amount,
    required String category,
    required String requestedByName,
    required _i2.VoucherStatus status,
    String? rejectionReason,
    String? approvedByName,
    DateTime? approvedAt,
    required DateTime createdAt,
  }) : super._(
         id: id,
         societyId: societyId,
         voucherNumber: voucherNumber,
         title: title,
         description: description,
         amount: amount,
         category: category,
         requestedByName: requestedByName,
         status: status,
         rejectionReason: rejectionReason,
         approvedByName: approvedByName,
         approvedAt: approvedAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [VoucherRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VoucherRequest copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? voucherNumber,
    String? title,
    String? description,
    double? amount,
    String? category,
    String? requestedByName,
    _i2.VoucherStatus? status,
    Object? rejectionReason = _Undefined,
    Object? approvedByName = _Undefined,
    Object? approvedAt = _Undefined,
    DateTime? createdAt,
  }) {
    return VoucherRequest(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      voucherNumber: voucherNumber ?? this.voucherNumber,
      title: title ?? this.title,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      requestedByName: requestedByName ?? this.requestedByName,
      status: status ?? this.status,
      rejectionReason: rejectionReason is String?
          ? rejectionReason
          : this.rejectionReason,
      approvedByName: approvedByName is String?
          ? approvedByName
          : this.approvedByName,
      approvedAt: approvedAt is DateTime? ? approvedAt : this.approvedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
