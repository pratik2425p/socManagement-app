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

abstract class RazorpayOrderResponse implements _i1.SerializableModel {
  RazorpayOrderResponse._({
    required this.orderId,
    required this.billId,
    required this.societyId,
    required this.amountPaise,
    required this.amountRupees,
    required this.currency,
    required this.keyId,
    required this.billNumber,
    required this.flatNumber,
    required this.payerName,
    this.payerPhone,
    this.payerEmail,
  });

  factory RazorpayOrderResponse({
    required String orderId,
    required int billId,
    required int societyId,
    required int amountPaise,
    required double amountRupees,
    required String currency,
    required String keyId,
    required String billNumber,
    required String flatNumber,
    required String payerName,
    String? payerPhone,
    String? payerEmail,
  }) = _RazorpayOrderResponseImpl;

  factory RazorpayOrderResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return RazorpayOrderResponse(
      orderId: jsonSerialization['orderId'] as String,
      billId: jsonSerialization['billId'] as int,
      societyId: jsonSerialization['societyId'] as int,
      amountPaise: jsonSerialization['amountPaise'] as int,
      amountRupees: (jsonSerialization['amountRupees'] as num).toDouble(),
      currency: jsonSerialization['currency'] as String,
      keyId: jsonSerialization['keyId'] as String,
      billNumber: jsonSerialization['billNumber'] as String,
      flatNumber: jsonSerialization['flatNumber'] as String,
      payerName: jsonSerialization['payerName'] as String,
      payerPhone: jsonSerialization['payerPhone'] as String?,
      payerEmail: jsonSerialization['payerEmail'] as String?,
    );
  }

  String orderId;

  int billId;

  int societyId;

  int amountPaise;

  double amountRupees;

  String currency;

  String keyId;

  String billNumber;

  String flatNumber;

  String payerName;

  String? payerPhone;

  String? payerEmail;

  /// Returns a shallow copy of this [RazorpayOrderResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RazorpayOrderResponse copyWith({
    String? orderId,
    int? billId,
    int? societyId,
    int? amountPaise,
    double? amountRupees,
    String? currency,
    String? keyId,
    String? billNumber,
    String? flatNumber,
    String? payerName,
    String? payerPhone,
    String? payerEmail,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RazorpayOrderResponse',
      'orderId': orderId,
      'billId': billId,
      'societyId': societyId,
      'amountPaise': amountPaise,
      'amountRupees': amountRupees,
      'currency': currency,
      'keyId': keyId,
      'billNumber': billNumber,
      'flatNumber': flatNumber,
      'payerName': payerName,
      if (payerPhone != null) 'payerPhone': payerPhone,
      if (payerEmail != null) 'payerEmail': payerEmail,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RazorpayOrderResponseImpl extends RazorpayOrderResponse {
  _RazorpayOrderResponseImpl({
    required String orderId,
    required int billId,
    required int societyId,
    required int amountPaise,
    required double amountRupees,
    required String currency,
    required String keyId,
    required String billNumber,
    required String flatNumber,
    required String payerName,
    String? payerPhone,
    String? payerEmail,
  }) : super._(
         orderId: orderId,
         billId: billId,
         societyId: societyId,
         amountPaise: amountPaise,
         amountRupees: amountRupees,
         currency: currency,
         keyId: keyId,
         billNumber: billNumber,
         flatNumber: flatNumber,
         payerName: payerName,
         payerPhone: payerPhone,
         payerEmail: payerEmail,
       );

  /// Returns a shallow copy of this [RazorpayOrderResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RazorpayOrderResponse copyWith({
    String? orderId,
    int? billId,
    int? societyId,
    int? amountPaise,
    double? amountRupees,
    String? currency,
    String? keyId,
    String? billNumber,
    String? flatNumber,
    String? payerName,
    Object? payerPhone = _Undefined,
    Object? payerEmail = _Undefined,
  }) {
    return RazorpayOrderResponse(
      orderId: orderId ?? this.orderId,
      billId: billId ?? this.billId,
      societyId: societyId ?? this.societyId,
      amountPaise: amountPaise ?? this.amountPaise,
      amountRupees: amountRupees ?? this.amountRupees,
      currency: currency ?? this.currency,
      keyId: keyId ?? this.keyId,
      billNumber: billNumber ?? this.billNumber,
      flatNumber: flatNumber ?? this.flatNumber,
      payerName: payerName ?? this.payerName,
      payerPhone: payerPhone is String? ? payerPhone : this.payerPhone,
      payerEmail: payerEmail is String? ? payerEmail : this.payerEmail,
    );
  }
}
