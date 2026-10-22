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

abstract class PaymentRecord implements _i1.SerializableModel {
  PaymentRecord._({
    this.id,
    required this.societyId,
    required this.billId,
    required this.flatId,
    required this.flatNumber,
    required this.payerName,
    required this.amount,
    required this.paymentMethod,
    required this.transactionReference,
    required this.receiptNumber,
    required this.paymentDate,
    required this.isVerified,
  });

  factory PaymentRecord({
    int? id,
    required int societyId,
    required int billId,
    required int flatId,
    required String flatNumber,
    required String payerName,
    required double amount,
    required String paymentMethod,
    required String transactionReference,
    required String receiptNumber,
    required DateTime paymentDate,
    required bool isVerified,
  }) = _PaymentRecordImpl;

  factory PaymentRecord.fromJson(Map<String, dynamic> jsonSerialization) {
    return PaymentRecord(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      billId: jsonSerialization['billId'] as int,
      flatId: jsonSerialization['flatId'] as int,
      flatNumber: jsonSerialization['flatNumber'] as String,
      payerName: jsonSerialization['payerName'] as String,
      amount: (jsonSerialization['amount'] as num).toDouble(),
      paymentMethod: jsonSerialization['paymentMethod'] as String,
      transactionReference: jsonSerialization['transactionReference'] as String,
      receiptNumber: jsonSerialization['receiptNumber'] as String,
      paymentDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['paymentDate'],
      ),
      isVerified: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['isVerified'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int societyId;

  int billId;

  int flatId;

  String flatNumber;

  String payerName;

  double amount;

  String paymentMethod;

  String transactionReference;

  String receiptNumber;

  DateTime paymentDate;

  bool isVerified;

  /// Returns a shallow copy of this [PaymentRecord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PaymentRecord copyWith({
    int? id,
    int? societyId,
    int? billId,
    int? flatId,
    String? flatNumber,
    String? payerName,
    double? amount,
    String? paymentMethod,
    String? transactionReference,
    String? receiptNumber,
    DateTime? paymentDate,
    bool? isVerified,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PaymentRecord',
      if (id != null) 'id': id,
      'societyId': societyId,
      'billId': billId,
      'flatId': flatId,
      'flatNumber': flatNumber,
      'payerName': payerName,
      'amount': amount,
      'paymentMethod': paymentMethod,
      'transactionReference': transactionReference,
      'receiptNumber': receiptNumber,
      'paymentDate': paymentDate.toJson(),
      'isVerified': isVerified,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PaymentRecordImpl extends PaymentRecord {
  _PaymentRecordImpl({
    int? id,
    required int societyId,
    required int billId,
    required int flatId,
    required String flatNumber,
    required String payerName,
    required double amount,
    required String paymentMethod,
    required String transactionReference,
    required String receiptNumber,
    required DateTime paymentDate,
    required bool isVerified,
  }) : super._(
         id: id,
         societyId: societyId,
         billId: billId,
         flatId: flatId,
         flatNumber: flatNumber,
         payerName: payerName,
         amount: amount,
         paymentMethod: paymentMethod,
         transactionReference: transactionReference,
         receiptNumber: receiptNumber,
         paymentDate: paymentDate,
         isVerified: isVerified,
       );

  /// Returns a shallow copy of this [PaymentRecord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PaymentRecord copyWith({
    Object? id = _Undefined,
    int? societyId,
    int? billId,
    int? flatId,
    String? flatNumber,
    String? payerName,
    double? amount,
    String? paymentMethod,
    String? transactionReference,
    String? receiptNumber,
    DateTime? paymentDate,
    bool? isVerified,
  }) {
    return PaymentRecord(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      billId: billId ?? this.billId,
      flatId: flatId ?? this.flatId,
      flatNumber: flatNumber ?? this.flatNumber,
      payerName: payerName ?? this.payerName,
      amount: amount ?? this.amount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      transactionReference: transactionReference ?? this.transactionReference,
      receiptNumber: receiptNumber ?? this.receiptNumber,
      paymentDate: paymentDate ?? this.paymentDate,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}
