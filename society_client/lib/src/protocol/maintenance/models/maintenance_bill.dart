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
import '../../maintenance/models/bill_status.dart' as _i2;

abstract class MaintenanceBill implements _i1.SerializableModel {
  MaintenanceBill._({
    this.id,
    required this.societyId,
    required this.flatId,
    required this.flatNumber,
    required this.billNumber,
    required this.billingMonth,
    required this.dueDate,
    required this.amount,
    required this.lateFee,
    required this.status,
    required this.issuedAt,
  });

  factory MaintenanceBill({
    int? id,
    required int societyId,
    required int flatId,
    required String flatNumber,
    required String billNumber,
    required String billingMonth,
    required DateTime dueDate,
    required double amount,
    required double lateFee,
    required _i2.BillStatus status,
    required DateTime issuedAt,
  }) = _MaintenanceBillImpl;

  factory MaintenanceBill.fromJson(Map<String, dynamic> jsonSerialization) {
    return MaintenanceBill(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      flatId: jsonSerialization['flatId'] as int,
      flatNumber: jsonSerialization['flatNumber'] as String,
      billNumber: jsonSerialization['billNumber'] as String,
      billingMonth: jsonSerialization['billingMonth'] as String,
      dueDate: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dueDate']),
      amount: (jsonSerialization['amount'] as num).toDouble(),
      lateFee: (jsonSerialization['lateFee'] as num).toDouble(),
      status: _i2.BillStatus.fromJson((jsonSerialization['status'] as String)),
      issuedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['issuedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int societyId;

  int flatId;

  String flatNumber;

  String billNumber;

  String billingMonth;

  DateTime dueDate;

  double amount;

  double lateFee;

  _i2.BillStatus status;

  DateTime issuedAt;

  /// Returns a shallow copy of this [MaintenanceBill]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MaintenanceBill copyWith({
    int? id,
    int? societyId,
    int? flatId,
    String? flatNumber,
    String? billNumber,
    String? billingMonth,
    DateTime? dueDate,
    double? amount,
    double? lateFee,
    _i2.BillStatus? status,
    DateTime? issuedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MaintenanceBill',
      if (id != null) 'id': id,
      'societyId': societyId,
      'flatId': flatId,
      'flatNumber': flatNumber,
      'billNumber': billNumber,
      'billingMonth': billingMonth,
      'dueDate': dueDate.toJson(),
      'amount': amount,
      'lateFee': lateFee,
      'status': status.toJson(),
      'issuedAt': issuedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MaintenanceBillImpl extends MaintenanceBill {
  _MaintenanceBillImpl({
    int? id,
    required int societyId,
    required int flatId,
    required String flatNumber,
    required String billNumber,
    required String billingMonth,
    required DateTime dueDate,
    required double amount,
    required double lateFee,
    required _i2.BillStatus status,
    required DateTime issuedAt,
  }) : super._(
         id: id,
         societyId: societyId,
         flatId: flatId,
         flatNumber: flatNumber,
         billNumber: billNumber,
         billingMonth: billingMonth,
         dueDate: dueDate,
         amount: amount,
         lateFee: lateFee,
         status: status,
         issuedAt: issuedAt,
       );

  /// Returns a shallow copy of this [MaintenanceBill]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MaintenanceBill copyWith({
    Object? id = _Undefined,
    int? societyId,
    int? flatId,
    String? flatNumber,
    String? billNumber,
    String? billingMonth,
    DateTime? dueDate,
    double? amount,
    double? lateFee,
    _i2.BillStatus? status,
    DateTime? issuedAt,
  }) {
    return MaintenanceBill(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      flatId: flatId ?? this.flatId,
      flatNumber: flatNumber ?? this.flatNumber,
      billNumber: billNumber ?? this.billNumber,
      billingMonth: billingMonth ?? this.billingMonth,
      dueDate: dueDate ?? this.dueDate,
      amount: amount ?? this.amount,
      lateFee: lateFee ?? this.lateFee,
      status: status ?? this.status,
      issuedAt: issuedAt ?? this.issuedAt,
    );
  }
}
