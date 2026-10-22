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
import '../../polling/models/poll_status.dart' as _i2;

abstract class SocietyPoll implements _i1.SerializableModel {
  SocietyPoll._({
    this.id,
    required this.societyId,
    required this.title,
    required this.description,
    required this.category,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.totalEligibleFlats,
    required this.totalVotesCast,
    required this.createdByName,
    required this.createdAt,
  });

  factory SocietyPoll({
    int? id,
    required int societyId,
    required String title,
    required String description,
    required String category,
    required _i2.PollStatus status,
    required DateTime startDate,
    required DateTime endDate,
    required int totalEligibleFlats,
    required int totalVotesCast,
    required String createdByName,
    required DateTime createdAt,
  }) = _SocietyPollImpl;

  factory SocietyPoll.fromJson(Map<String, dynamic> jsonSerialization) {
    return SocietyPoll(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      category: jsonSerialization['category'] as String,
      status: _i2.PollStatus.fromJson((jsonSerialization['status'] as String)),
      startDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['startDate'],
      ),
      endDate: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['endDate']),
      totalEligibleFlats: jsonSerialization['totalEligibleFlats'] as int,
      totalVotesCast: jsonSerialization['totalVotesCast'] as int,
      createdByName: jsonSerialization['createdByName'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
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

  String category;

  _i2.PollStatus status;

  DateTime startDate;

  DateTime endDate;

  int totalEligibleFlats;

  int totalVotesCast;

  String createdByName;

  DateTime createdAt;

  /// Returns a shallow copy of this [SocietyPoll]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SocietyPoll copyWith({
    int? id,
    int? societyId,
    String? title,
    String? description,
    String? category,
    _i2.PollStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    int? totalEligibleFlats,
    int? totalVotesCast,
    String? createdByName,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SocietyPoll',
      if (id != null) 'id': id,
      'societyId': societyId,
      'title': title,
      'description': description,
      'category': category,
      'status': status.toJson(),
      'startDate': startDate.toJson(),
      'endDate': endDate.toJson(),
      'totalEligibleFlats': totalEligibleFlats,
      'totalVotesCast': totalVotesCast,
      'createdByName': createdByName,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SocietyPollImpl extends SocietyPoll {
  _SocietyPollImpl({
    int? id,
    required int societyId,
    required String title,
    required String description,
    required String category,
    required _i2.PollStatus status,
    required DateTime startDate,
    required DateTime endDate,
    required int totalEligibleFlats,
    required int totalVotesCast,
    required String createdByName,
    required DateTime createdAt,
  }) : super._(
         id: id,
         societyId: societyId,
         title: title,
         description: description,
         category: category,
         status: status,
         startDate: startDate,
         endDate: endDate,
         totalEligibleFlats: totalEligibleFlats,
         totalVotesCast: totalVotesCast,
         createdByName: createdByName,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [SocietyPoll]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SocietyPoll copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? title,
    String? description,
    String? category,
    _i2.PollStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    int? totalEligibleFlats,
    int? totalVotesCast,
    String? createdByName,
    DateTime? createdAt,
  }) {
    return SocietyPoll(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      totalEligibleFlats: totalEligibleFlats ?? this.totalEligibleFlats,
      totalVotesCast: totalVotesCast ?? this.totalVotesCast,
      createdByName: createdByName ?? this.createdByName,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
