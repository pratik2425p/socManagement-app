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
import '../../documents/models/document_category.dart' as _i2;

abstract class SocietyDocument implements _i1.SerializableModel {
  SocietyDocument._({
    this.id,
    required this.societyId,
    required this.title,
    required this.description,
    required this.category,
    required this.fileUrl,
    required this.fileSize,
    required this.uploadedByName,
    required this.isCommitteeOnly,
    required this.uploadedAt,
  });

  factory SocietyDocument({
    int? id,
    required int societyId,
    required String title,
    required String description,
    required _i2.DocumentCategory category,
    required String fileUrl,
    required String fileSize,
    required String uploadedByName,
    required bool isCommitteeOnly,
    required DateTime uploadedAt,
  }) = _SocietyDocumentImpl;

  factory SocietyDocument.fromJson(Map<String, dynamic> jsonSerialization) {
    return SocietyDocument(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      category: _i2.DocumentCategory.fromJson(
        (jsonSerialization['category'] as String),
      ),
      fileUrl: jsonSerialization['fileUrl'] as String,
      fileSize: jsonSerialization['fileSize'] as String,
      uploadedByName: jsonSerialization['uploadedByName'] as String,
      isCommitteeOnly: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['isCommitteeOnly'],
      ),
      uploadedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['uploadedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int societyId;

  String title;

  String description;

  _i2.DocumentCategory category;

  String fileUrl;

  String fileSize;

  String uploadedByName;

  bool isCommitteeOnly;

  DateTime uploadedAt;

  /// Returns a shallow copy of this [SocietyDocument]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SocietyDocument copyWith({
    int? id,
    int? societyId,
    String? title,
    String? description,
    _i2.DocumentCategory? category,
    String? fileUrl,
    String? fileSize,
    String? uploadedByName,
    bool? isCommitteeOnly,
    DateTime? uploadedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SocietyDocument',
      if (id != null) 'id': id,
      'societyId': societyId,
      'title': title,
      'description': description,
      'category': category.toJson(),
      'fileUrl': fileUrl,
      'fileSize': fileSize,
      'uploadedByName': uploadedByName,
      'isCommitteeOnly': isCommitteeOnly,
      'uploadedAt': uploadedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SocietyDocumentImpl extends SocietyDocument {
  _SocietyDocumentImpl({
    int? id,
    required int societyId,
    required String title,
    required String description,
    required _i2.DocumentCategory category,
    required String fileUrl,
    required String fileSize,
    required String uploadedByName,
    required bool isCommitteeOnly,
    required DateTime uploadedAt,
  }) : super._(
         id: id,
         societyId: societyId,
         title: title,
         description: description,
         category: category,
         fileUrl: fileUrl,
         fileSize: fileSize,
         uploadedByName: uploadedByName,
         isCommitteeOnly: isCommitteeOnly,
         uploadedAt: uploadedAt,
       );

  /// Returns a shallow copy of this [SocietyDocument]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SocietyDocument copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? title,
    String? description,
    _i2.DocumentCategory? category,
    String? fileUrl,
    String? fileSize,
    String? uploadedByName,
    bool? isCommitteeOnly,
    DateTime? uploadedAt,
  }) {
    return SocietyDocument(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      fileUrl: fileUrl ?? this.fileUrl,
      fileSize: fileSize ?? this.fileSize,
      uploadedByName: uploadedByName ?? this.uploadedByName,
      isCommitteeOnly: isCommitteeOnly ?? this.isCommitteeOnly,
      uploadedAt: uploadedAt ?? this.uploadedAt,
    );
  }
}
