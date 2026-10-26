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
import 'package:serverpod/serverpod.dart' as _i1;
import '../../maintenance/models/payment_record.dart' as _i2;
import '../../maintenance/models/maintenance_bill.dart' as _i3;
import 'package:society_server/src/generated/protocol.dart' as _i4;

abstract class PaymentVerificationResult
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  PaymentVerificationResult._({
    required this.success,
    required this.message,
    required this.isAlreadyProcessed,
    this.paymentRecord,
    this.bill,
  });

  factory PaymentVerificationResult({
    required bool success,
    required String message,
    required bool isAlreadyProcessed,
    _i2.PaymentRecord? paymentRecord,
    _i3.MaintenanceBill? bill,
  }) = _PaymentVerificationResultImpl;

  factory PaymentVerificationResult.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return PaymentVerificationResult(
      success: _i1.BoolJsonExtension.fromJson(jsonSerialization['success']),
      message: jsonSerialization['message'] as String,
      isAlreadyProcessed: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['isAlreadyProcessed'],
      ),
      paymentRecord: jsonSerialization['paymentRecord'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.PaymentRecord>(
              jsonSerialization['paymentRecord'],
            ),
      bill: jsonSerialization['bill'] == null
          ? null
          : _i4.Protocol().deserialize<_i3.MaintenanceBill>(
              jsonSerialization['bill'],
            ),
    );
  }

  bool success;

  String message;

  bool isAlreadyProcessed;

  _i2.PaymentRecord? paymentRecord;

  _i3.MaintenanceBill? bill;

  /// Returns a shallow copy of this [PaymentVerificationResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PaymentVerificationResult copyWith({
    bool? success,
    String? message,
    bool? isAlreadyProcessed,
    _i2.PaymentRecord? paymentRecord,
    _i3.MaintenanceBill? bill,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PaymentVerificationResult',
      'success': success,
      'message': message,
      'isAlreadyProcessed': isAlreadyProcessed,
      if (paymentRecord != null) 'paymentRecord': paymentRecord?.toJson(),
      if (bill != null) 'bill': bill?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PaymentVerificationResult',
      'success': success,
      'message': message,
      'isAlreadyProcessed': isAlreadyProcessed,
      if (paymentRecord != null)
        'paymentRecord': paymentRecord?.toJsonForProtocol(),
      if (bill != null) 'bill': bill?.toJsonForProtocol(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PaymentVerificationResultImpl extends PaymentVerificationResult {
  _PaymentVerificationResultImpl({
    required bool success,
    required String message,
    required bool isAlreadyProcessed,
    _i2.PaymentRecord? paymentRecord,
    _i3.MaintenanceBill? bill,
  }) : super._(
         success: success,
         message: message,
         isAlreadyProcessed: isAlreadyProcessed,
         paymentRecord: paymentRecord,
         bill: bill,
       );

  /// Returns a shallow copy of this [PaymentVerificationResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PaymentVerificationResult copyWith({
    bool? success,
    String? message,
    bool? isAlreadyProcessed,
    Object? paymentRecord = _Undefined,
    Object? bill = _Undefined,
  }) {
    return PaymentVerificationResult(
      success: success ?? this.success,
      message: message ?? this.message,
      isAlreadyProcessed: isAlreadyProcessed ?? this.isAlreadyProcessed,
      paymentRecord: paymentRecord is _i2.PaymentRecord?
          ? paymentRecord
          : this.paymentRecord?.copyWith(),
      bill: bill is _i3.MaintenanceBill? ? bill : this.bill?.copyWith(),
    );
  }
}
