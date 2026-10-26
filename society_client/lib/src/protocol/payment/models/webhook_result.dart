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

abstract class WebhookResult implements _i1.SerializableModel {
  WebhookResult._({
    required this.success,
    required this.message,
    required this.isProcessed,
    this.orderId,
    this.paymentId,
  });

  factory WebhookResult({
    required bool success,
    required String message,
    required bool isProcessed,
    String? orderId,
    String? paymentId,
  }) = _WebhookResultImpl;

  factory WebhookResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return WebhookResult(
      success: _i1.BoolJsonExtension.fromJson(jsonSerialization['success']),
      message: jsonSerialization['message'] as String,
      isProcessed: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['isProcessed'],
      ),
      orderId: jsonSerialization['orderId'] as String?,
      paymentId: jsonSerialization['paymentId'] as String?,
    );
  }

  bool success;

  String message;

  bool isProcessed;

  String? orderId;

  String? paymentId;

  /// Returns a shallow copy of this [WebhookResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  WebhookResult copyWith({
    bool? success,
    String? message,
    bool? isProcessed,
    String? orderId,
    String? paymentId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'WebhookResult',
      'success': success,
      'message': message,
      'isProcessed': isProcessed,
      if (orderId != null) 'orderId': orderId,
      if (paymentId != null) 'paymentId': paymentId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _WebhookResultImpl extends WebhookResult {
  _WebhookResultImpl({
    required bool success,
    required String message,
    required bool isProcessed,
    String? orderId,
    String? paymentId,
  }) : super._(
         success: success,
         message: message,
         isProcessed: isProcessed,
         orderId: orderId,
         paymentId: paymentId,
       );

  /// Returns a shallow copy of this [WebhookResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  WebhookResult copyWith({
    bool? success,
    String? message,
    bool? isProcessed,
    Object? orderId = _Undefined,
    Object? paymentId = _Undefined,
  }) {
    return WebhookResult(
      success: success ?? this.success,
      message: message ?? this.message,
      isProcessed: isProcessed ?? this.isProcessed,
      orderId: orderId is String? ? orderId : this.orderId,
      paymentId: paymentId is String? ? paymentId : this.paymentId,
    );
  }
}
