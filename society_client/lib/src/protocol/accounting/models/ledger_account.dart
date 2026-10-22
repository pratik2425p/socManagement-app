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

abstract class LedgerAccount implements _i1.SerializableModel {
  LedgerAccount._({
    this.id,
    required this.societyId,
    required this.accountCode,
    required this.accountName,
    required this.accountType,
    required this.balance,
  });

  factory LedgerAccount({
    int? id,
    required int societyId,
    required String accountCode,
    required String accountName,
    required String accountType,
    required double balance,
  }) = _LedgerAccountImpl;

  factory LedgerAccount.fromJson(Map<String, dynamic> jsonSerialization) {
    return LedgerAccount(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      accountCode: jsonSerialization['accountCode'] as String,
      accountName: jsonSerialization['accountName'] as String,
      accountType: jsonSerialization['accountType'] as String,
      balance: (jsonSerialization['balance'] as num).toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int societyId;

  String accountCode;

  String accountName;

  String accountType;

  double balance;

  /// Returns a shallow copy of this [LedgerAccount]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LedgerAccount copyWith({
    int? id,
    int? societyId,
    String? accountCode,
    String? accountName,
    String? accountType,
    double? balance,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LedgerAccount',
      if (id != null) 'id': id,
      'societyId': societyId,
      'accountCode': accountCode,
      'accountName': accountName,
      'accountType': accountType,
      'balance': balance,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LedgerAccountImpl extends LedgerAccount {
  _LedgerAccountImpl({
    int? id,
    required int societyId,
    required String accountCode,
    required String accountName,
    required String accountType,
    required double balance,
  }) : super._(
         id: id,
         societyId: societyId,
         accountCode: accountCode,
         accountName: accountName,
         accountType: accountType,
         balance: balance,
       );

  /// Returns a shallow copy of this [LedgerAccount]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LedgerAccount copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? accountCode,
    String? accountName,
    String? accountType,
    double? balance,
  }) {
    return LedgerAccount(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      accountCode: accountCode ?? this.accountCode,
      accountName: accountName ?? this.accountName,
      accountType: accountType ?? this.accountType,
      balance: balance ?? this.balance,
    );
  }
}
