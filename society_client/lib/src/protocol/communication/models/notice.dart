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

abstract class Notice implements _i1.SerializableModel {
  Notice._({
    this.id,
    required this.societyId,
    required this.title,
    required this.content,
    required this.category,
    required this.priority,
    required this.postedByName,
    required this.postedAt,
    this.expiresAt,
  });

  factory Notice({
    int? id,
    required int societyId,
    required String title,
    required String content,
    required String category,
    required String priority,
    required String postedByName,
    required DateTime postedAt,
    DateTime? expiresAt,
  }) = _NoticeImpl;

  factory Notice.fromJson(Map<String, dynamic> jsonSerialization) {
    return Notice(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      title: jsonSerialization['title'] as String,
      content: jsonSerialization['content'] as String,
      category: jsonSerialization['category'] as String,
      priority: jsonSerialization['priority'] as String,
      postedByName: jsonSerialization['postedByName'] as String,
      postedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['postedAt'],
      ),
      expiresAt: jsonSerialization['expiresAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['expiresAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int societyId;

  String title;

  String content;

  String category;

  String priority;

  String postedByName;

  DateTime postedAt;

  DateTime? expiresAt;

  /// Returns a shallow copy of this [Notice]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Notice copyWith({
    int? id,
    int? societyId,
    String? title,
    String? content,
    String? category,
    String? priority,
    String? postedByName,
    DateTime? postedAt,
    DateTime? expiresAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Notice',
      if (id != null) 'id': id,
      'societyId': societyId,
      'title': title,
      'content': content,
      'category': category,
      'priority': priority,
      'postedByName': postedByName,
      'postedAt': postedAt.toJson(),
      if (expiresAt != null) 'expiresAt': expiresAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NoticeImpl extends Notice {
  _NoticeImpl({
    int? id,
    required int societyId,
    required String title,
    required String content,
    required String category,
    required String priority,
    required String postedByName,
    required DateTime postedAt,
    DateTime? expiresAt,
  }) : super._(
         id: id,
         societyId: societyId,
         title: title,
         content: content,
         category: category,
         priority: priority,
         postedByName: postedByName,
         postedAt: postedAt,
         expiresAt: expiresAt,
       );

  /// Returns a shallow copy of this [Notice]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Notice copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? title,
    String? content,
    String? category,
    String? priority,
    String? postedByName,
    DateTime? postedAt,
    Object? expiresAt = _Undefined,
  }) {
    return Notice(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      title: title ?? this.title,
      content: content ?? this.content,
      category: category ?? this.category,
      priority: priority ?? this.priority,
      postedByName: postedByName ?? this.postedByName,
      postedAt: postedAt ?? this.postedAt,
      expiresAt: expiresAt is DateTime? ? expiresAt : this.expiresAt,
    );
  }
}
