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
import '../../tenancy/models/noc_status.dart' as _i2;

abstract class TenantNoc implements _i1.SerializableModel {
  TenantNoc._({
    this.id,
    required this.societyId,
    required this.flatNumber,
    required this.ownerName,
    required this.ownerPhone,
    required this.tenantName,
    required this.tenantPhone,
    required this.leaseStart,
    required this.leaseEnd,
    required this.monthlyRent,
    required this.nocNumber,
    required this.status,
    this.resolutionNotes,
    required this.issuedAt,
    this.resolvedAt,
    this.documentPath,
    this.documentUrl,
  });

  factory TenantNoc({
    int? id,
    required int societyId,
    required String flatNumber,
    required String ownerName,
    required String ownerPhone,
    required String tenantName,
    required String tenantPhone,
    required DateTime leaseStart,
    required DateTime leaseEnd,
    required double monthlyRent,
    required String nocNumber,
    required _i2.NocStatus status,
    String? resolutionNotes,
    required DateTime issuedAt,
    DateTime? resolvedAt,
    String? documentPath,
    String? documentUrl,
  }) = _TenantNocImpl;

  factory TenantNoc.fromJson(Map<String, dynamic> jsonSerialization) {
    return TenantNoc(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      flatNumber: jsonSerialization['flatNumber'] as String,
      ownerName: jsonSerialization['ownerName'] as String,
      ownerPhone: jsonSerialization['ownerPhone'] as String,
      tenantName: jsonSerialization['tenantName'] as String,
      tenantPhone: jsonSerialization['tenantPhone'] as String,
      leaseStart: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['leaseStart'],
      ),
      leaseEnd: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['leaseEnd'],
      ),
      monthlyRent: (jsonSerialization['monthlyRent'] as num).toDouble(),
      nocNumber: jsonSerialization['nocNumber'] as String,
      status: _i2.NocStatus.fromJson((jsonSerialization['status'] as String)),
      resolutionNotes: jsonSerialization['resolutionNotes'] as String?,
      issuedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['issuedAt'],
      ),
      resolvedAt: jsonSerialization['resolvedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['resolvedAt']),
      documentPath: jsonSerialization['documentPath'] as String?,
      documentUrl: jsonSerialization['documentUrl'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int societyId;

  String flatNumber;

  String ownerName;

  String ownerPhone;

  String tenantName;

  String tenantPhone;

  DateTime leaseStart;

  DateTime leaseEnd;

  double monthlyRent;

  String nocNumber;

  _i2.NocStatus status;

  String? resolutionNotes;

  DateTime issuedAt;

  DateTime? resolvedAt;

  String? documentPath;

  String? documentUrl;

  /// Returns a shallow copy of this [TenantNoc]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TenantNoc copyWith({
    int? id,
    int? societyId,
    String? flatNumber,
    String? ownerName,
    String? ownerPhone,
    String? tenantName,
    String? tenantPhone,
    DateTime? leaseStart,
    DateTime? leaseEnd,
    double? monthlyRent,
    String? nocNumber,
    _i2.NocStatus? status,
    String? resolutionNotes,
    DateTime? issuedAt,
    DateTime? resolvedAt,
    String? documentPath,
    String? documentUrl,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TenantNoc',
      if (id != null) 'id': id,
      'societyId': societyId,
      'flatNumber': flatNumber,
      'ownerName': ownerName,
      'ownerPhone': ownerPhone,
      'tenantName': tenantName,
      'tenantPhone': tenantPhone,
      'leaseStart': leaseStart.toJson(),
      'leaseEnd': leaseEnd.toJson(),
      'monthlyRent': monthlyRent,
      'nocNumber': nocNumber,
      'status': status.toJson(),
      if (resolutionNotes != null) 'resolutionNotes': resolutionNotes,
      'issuedAt': issuedAt.toJson(),
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
      if (documentPath != null) 'documentPath': documentPath,
      if (documentUrl != null) 'documentUrl': documentUrl,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TenantNocImpl extends TenantNoc {
  _TenantNocImpl({
    int? id,
    required int societyId,
    required String flatNumber,
    required String ownerName,
    required String ownerPhone,
    required String tenantName,
    required String tenantPhone,
    required DateTime leaseStart,
    required DateTime leaseEnd,
    required double monthlyRent,
    required String nocNumber,
    required _i2.NocStatus status,
    String? resolutionNotes,
    required DateTime issuedAt,
    DateTime? resolvedAt,
    String? documentPath,
    String? documentUrl,
  }) : super._(
         id: id,
         societyId: societyId,
         flatNumber: flatNumber,
         ownerName: ownerName,
         ownerPhone: ownerPhone,
         tenantName: tenantName,
         tenantPhone: tenantPhone,
         leaseStart: leaseStart,
         leaseEnd: leaseEnd,
         monthlyRent: monthlyRent,
         nocNumber: nocNumber,
         status: status,
         resolutionNotes: resolutionNotes,
         issuedAt: issuedAt,
         resolvedAt: resolvedAt,
         documentPath: documentPath,
         documentUrl: documentUrl,
       );

  /// Returns a shallow copy of this [TenantNoc]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TenantNoc copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? flatNumber,
    String? ownerName,
    String? ownerPhone,
    String? tenantName,
    String? tenantPhone,
    DateTime? leaseStart,
    DateTime? leaseEnd,
    double? monthlyRent,
    String? nocNumber,
    _i2.NocStatus? status,
    Object? resolutionNotes = _Undefined,
    DateTime? issuedAt,
    Object? resolvedAt = _Undefined,
    Object? documentPath = _Undefined,
    Object? documentUrl = _Undefined,
  }) {
    return TenantNoc(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      flatNumber: flatNumber ?? this.flatNumber,
      ownerName: ownerName ?? this.ownerName,
      ownerPhone: ownerPhone ?? this.ownerPhone,
      tenantName: tenantName ?? this.tenantName,
      tenantPhone: tenantPhone ?? this.tenantPhone,
      leaseStart: leaseStart ?? this.leaseStart,
      leaseEnd: leaseEnd ?? this.leaseEnd,
      monthlyRent: monthlyRent ?? this.monthlyRent,
      nocNumber: nocNumber ?? this.nocNumber,
      status: status ?? this.status,
      resolutionNotes: resolutionNotes is String?
          ? resolutionNotes
          : this.resolutionNotes,
      issuedAt: issuedAt ?? this.issuedAt,
      resolvedAt: resolvedAt is DateTime? ? resolvedAt : this.resolvedAt,
      documentPath: documentPath is String? ? documentPath : this.documentPath,
      documentUrl: documentUrl is String? ? documentUrl : this.documentUrl,
    );
  }
}
