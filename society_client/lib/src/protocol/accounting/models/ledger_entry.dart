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

abstract class LedgerEntry implements _i1.SerializableModel {
  LedgerEntry._({
    this.id,
    required this.societyId,
    required this.entryNumber,
    this.voucherId,
    required this.entryDate,
    required this.description,
    required this.postedByName,
    required this.totalDebit,
    required this.totalCredit,
    required this.postedAt,
  });

  factory LedgerEntry({
    int? id,
    required int societyId,
    required String entryNumber,
    int? voucherId,
    required DateTime entryDate,
    required String description,
    required String postedByName,
    required double totalDebit,
    required double totalCredit,
    required DateTime postedAt,
  }) = _LedgerEntryImpl;

  factory LedgerEntry.fromJson(Map<String, dynamic> jsonSerialization) {
    return LedgerEntry(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      entryNumber: jsonSerialization['entryNumber'] as String,
      voucherId: jsonSerialization['voucherId'] as int?,
      entryDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['entryDate'],
      ),
      description: jsonSerialization['description'] as String,
      postedByName: jsonSerialization['postedByName'] as String,
      totalDebit: (jsonSerialization['totalDebit'] as num).toDouble(),
      totalCredit: (jsonSerialization['totalCredit'] as num).toDouble(),
      postedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['postedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int societyId;

  String entryNumber;

  int? voucherId;

  DateTime entryDate;

  String description;

  String postedByName;

  double totalDebit;

  double totalCredit;

  DateTime postedAt;

  /// Returns a shallow copy of this [LedgerEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LedgerEntry copyWith({
    int? id,
    int? societyId,
    String? entryNumber,
    int? voucherId,
    DateTime? entryDate,
    String? description,
    String? postedByName,
    double? totalDebit,
    double? totalCredit,
    DateTime? postedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LedgerEntry',
      if (id != null) 'id': id,
      'societyId': societyId,
      'entryNumber': entryNumber,
      if (voucherId != null) 'voucherId': voucherId,
      'entryDate': entryDate.toJson(),
      'description': description,
      'postedByName': postedByName,
      'totalDebit': totalDebit,
      'totalCredit': totalCredit,
      'postedAt': postedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LedgerEntryImpl extends LedgerEntry {
  _LedgerEntryImpl({
    int? id,
    required int societyId,
    required String entryNumber,
    int? voucherId,
    required DateTime entryDate,
    required String description,
    required String postedByName,
    required double totalDebit,
    required double totalCredit,
    required DateTime postedAt,
  }) : super._(
         id: id,
         societyId: societyId,
         entryNumber: entryNumber,
         voucherId: voucherId,
         entryDate: entryDate,
         description: description,
         postedByName: postedByName,
         totalDebit: totalDebit,
         totalCredit: totalCredit,
         postedAt: postedAt,
       );

  /// Returns a shallow copy of this [LedgerEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LedgerEntry copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? entryNumber,
    Object? voucherId = _Undefined,
    DateTime? entryDate,
    String? description,
    String? postedByName,
    double? totalDebit,
    double? totalCredit,
    DateTime? postedAt,
  }) {
    return LedgerEntry(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      entryNumber: entryNumber ?? this.entryNumber,
      voucherId: voucherId is int? ? voucherId : this.voucherId,
      entryDate: entryDate ?? this.entryDate,
      description: description ?? this.description,
      postedByName: postedByName ?? this.postedByName,
      totalDebit: totalDebit ?? this.totalDebit,
      totalCredit: totalCredit ?? this.totalCredit,
      postedAt: postedAt ?? this.postedAt,
    );
  }
}
