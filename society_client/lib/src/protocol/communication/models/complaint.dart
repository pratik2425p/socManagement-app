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
import '../../communication/models/complaint_status.dart' as _i2;

abstract class Complaint implements _i1.SerializableModel {
  Complaint._({
    this.id,
    required this.societyId,
    required this.flatNumber,
    required this.reportedByName,
    required this.title,
    required this.description,
    required this.category,
    required this.status,
    this.assignedTo,
    this.resolutionNotes,
    required this.createdAt,
    this.resolvedAt,
  });

  factory Complaint({
    int? id,
    required int societyId,
    required String flatNumber,
    required String reportedByName,
    required String title,
    required String description,
    required String category,
    required _i2.ComplaintStatus status,
    String? assignedTo,
    String? resolutionNotes,
    required DateTime createdAt,
    DateTime? resolvedAt,
  }) = _ComplaintImpl;

  factory Complaint.fromJson(Map<String, dynamic> jsonSerialization) {
    return Complaint(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      flatNumber: jsonSerialization['flatNumber'] as String,
      reportedByName: jsonSerialization['reportedByName'] as String,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      category: jsonSerialization['category'] as String,
      status: _i2.ComplaintStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      assignedTo: jsonSerialization['assignedTo'] as String?,
      resolutionNotes: jsonSerialization['resolutionNotes'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      resolvedAt: jsonSerialization['resolvedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['resolvedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int societyId;

  String flatNumber;

  String reportedByName;

  String title;

  String description;

  String category;

  _i2.ComplaintStatus status;

  String? assignedTo;

  String? resolutionNotes;

  DateTime createdAt;

  DateTime? resolvedAt;

  /// Returns a shallow copy of this [Complaint]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Complaint copyWith({
    int? id,
    int? societyId,
    String? flatNumber,
    String? reportedByName,
    String? title,
    String? description,
    String? category,
    _i2.ComplaintStatus? status,
    String? assignedTo,
    String? resolutionNotes,
    DateTime? createdAt,
    DateTime? resolvedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Complaint',
      if (id != null) 'id': id,
      'societyId': societyId,
      'flatNumber': flatNumber,
      'reportedByName': reportedByName,
      'title': title,
      'description': description,
      'category': category,
      'status': status.toJson(),
      if (assignedTo != null) 'assignedTo': assignedTo,
      if (resolutionNotes != null) 'resolutionNotes': resolutionNotes,
      'createdAt': createdAt.toJson(),
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ComplaintImpl extends Complaint {
  _ComplaintImpl({
    int? id,
    required int societyId,
    required String flatNumber,
    required String reportedByName,
    required String title,
    required String description,
    required String category,
    required _i2.ComplaintStatus status,
    String? assignedTo,
    String? resolutionNotes,
    required DateTime createdAt,
    DateTime? resolvedAt,
  }) : super._(
         id: id,
         societyId: societyId,
         flatNumber: flatNumber,
         reportedByName: reportedByName,
         title: title,
         description: description,
         category: category,
         status: status,
         assignedTo: assignedTo,
         resolutionNotes: resolutionNotes,
         createdAt: createdAt,
         resolvedAt: resolvedAt,
       );

  /// Returns a shallow copy of this [Complaint]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Complaint copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? flatNumber,
    String? reportedByName,
    String? title,
    String? description,
    String? category,
    _i2.ComplaintStatus? status,
    Object? assignedTo = _Undefined,
    Object? resolutionNotes = _Undefined,
    DateTime? createdAt,
    Object? resolvedAt = _Undefined,
  }) {
    return Complaint(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      flatNumber: flatNumber ?? this.flatNumber,
      reportedByName: reportedByName ?? this.reportedByName,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      status: status ?? this.status,
      assignedTo: assignedTo is String? ? assignedTo : this.assignedTo,
      resolutionNotes: resolutionNotes is String?
          ? resolutionNotes
          : this.resolutionNotes,
      createdAt: createdAt ?? this.createdAt,
      resolvedAt: resolvedAt is DateTime? ? resolvedAt : this.resolvedAt,
    );
  }
}
