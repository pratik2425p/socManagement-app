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
import '../../payment/models/payment_transaction_status.dart' as _i2;

abstract class PaymentTransaction implements _i1.SerializableModel {
  PaymentTransaction._({
    this.id,
    required this.orderId,
    required this.billId,
    required this.societyId,
    this.userId,
    required this.amount,
    required this.amountPaise,
    required this.currency,
    required this.status,
    this.razorpayPaymentId,
    this.razorpaySignature,
    this.receiptNumber,
    this.idempotencyKey,
    this.failureReason,
    required this.isProcessed,
    required this.createdAt,
    this.updatedAt,
  });

  factory PaymentTransaction({
    int? id,
    required String orderId,
    required int billId,
    required int societyId,
    int? userId,
    required double amount,
    required int amountPaise,
    required String currency,
    required _i2.PaymentTransactionStatus status,
    String? razorpayPaymentId,
    String? razorpaySignature,
    String? receiptNumber,
    String? idempotencyKey,
    String? failureReason,
    required bool isProcessed,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _PaymentTransactionImpl;

  factory PaymentTransaction.fromJson(Map<String, dynamic> jsonSerialization) {
    return PaymentTransaction(
      id: jsonSerialization['id'] as int?,
      orderId: jsonSerialization['orderId'] as String,
      billId: jsonSerialization['billId'] as int,
      societyId: jsonSerialization['societyId'] as int,
      userId: jsonSerialization['userId'] as int?,
      amount: (jsonSerialization['amount'] as num).toDouble(),
      amountPaise: jsonSerialization['amountPaise'] as int,
      currency: jsonSerialization['currency'] as String,
      status: _i2.PaymentTransactionStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      razorpayPaymentId: jsonSerialization['razorpayPaymentId'] as String?,
      razorpaySignature: jsonSerialization['razorpaySignature'] as String?,
      receiptNumber: jsonSerialization['receiptNumber'] as String?,
      idempotencyKey: jsonSerialization['idempotencyKey'] as String?,
      failureReason: jsonSerialization['failureReason'] as String?,
      isProcessed: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['isProcessed'],
      ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String orderId;

  int billId;

  int societyId;

  int? userId;

  double amount;

  int amountPaise;

  String currency;

  _i2.PaymentTransactionStatus status;

  String? razorpayPaymentId;

  String? razorpaySignature;

  String? receiptNumber;

  String? idempotencyKey;

  String? failureReason;

  bool isProcessed;

  DateTime createdAt;

  DateTime? updatedAt;

  /// Returns a shallow copy of this [PaymentTransaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PaymentTransaction copyWith({
    int? id,
    String? orderId,
    int? billId,
    int? societyId,
    int? userId,
    double? amount,
    int? amountPaise,
    String? currency,
    _i2.PaymentTransactionStatus? status,
    String? razorpayPaymentId,
    String? razorpaySignature,
    String? receiptNumber,
    String? idempotencyKey,
    String? failureReason,
    bool? isProcessed,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PaymentTransaction',
      if (id != null) 'id': id,
      'orderId': orderId,
      'billId': billId,
      'societyId': societyId,
      if (userId != null) 'userId': userId,
      'amount': amount,
      'amountPaise': amountPaise,
      'currency': currency,
      'status': status.toJson(),
      if (razorpayPaymentId != null) 'razorpayPaymentId': razorpayPaymentId,
      if (razorpaySignature != null) 'razorpaySignature': razorpaySignature,
      if (receiptNumber != null) 'receiptNumber': receiptNumber,
      if (idempotencyKey != null) 'idempotencyKey': idempotencyKey,
      if (failureReason != null) 'failureReason': failureReason,
      'isProcessed': isProcessed,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PaymentTransactionImpl extends PaymentTransaction {
  _PaymentTransactionImpl({
    int? id,
    required String orderId,
    required int billId,
    required int societyId,
    int? userId,
    required double amount,
    required int amountPaise,
    required String currency,
    required _i2.PaymentTransactionStatus status,
    String? razorpayPaymentId,
    String? razorpaySignature,
    String? receiptNumber,
    String? idempotencyKey,
    String? failureReason,
    required bool isProcessed,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         orderId: orderId,
         billId: billId,
         societyId: societyId,
         userId: userId,
         amount: amount,
         amountPaise: amountPaise,
         currency: currency,
         status: status,
         razorpayPaymentId: razorpayPaymentId,
         razorpaySignature: razorpaySignature,
         receiptNumber: receiptNumber,
         idempotencyKey: idempotencyKey,
         failureReason: failureReason,
         isProcessed: isProcessed,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [PaymentTransaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PaymentTransaction copyWith({
    Object? id = _Undefined,
    String? orderId,
    int? billId,
    int? societyId,
    Object? userId = _Undefined,
    double? amount,
    int? amountPaise,
    String? currency,
    _i2.PaymentTransactionStatus? status,
    Object? razorpayPaymentId = _Undefined,
    Object? razorpaySignature = _Undefined,
    Object? receiptNumber = _Undefined,
    Object? idempotencyKey = _Undefined,
    Object? failureReason = _Undefined,
    bool? isProcessed,
    DateTime? createdAt,
    Object? updatedAt = _Undefined,
  }) {
    return PaymentTransaction(
      id: id is int? ? id : this.id,
      orderId: orderId ?? this.orderId,
      billId: billId ?? this.billId,
      societyId: societyId ?? this.societyId,
      userId: userId is int? ? userId : this.userId,
      amount: amount ?? this.amount,
      amountPaise: amountPaise ?? this.amountPaise,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      razorpayPaymentId: razorpayPaymentId is String?
          ? razorpayPaymentId
          : this.razorpayPaymentId,
      razorpaySignature: razorpaySignature is String?
          ? razorpaySignature
          : this.razorpaySignature,
      receiptNumber: receiptNumber is String?
          ? receiptNumber
          : this.receiptNumber,
      idempotencyKey: idempotencyKey is String?
          ? idempotencyKey
          : this.idempotencyKey,
      failureReason: failureReason is String?
          ? failureReason
          : this.failureReason,
      isProcessed: isProcessed ?? this.isProcessed,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}
