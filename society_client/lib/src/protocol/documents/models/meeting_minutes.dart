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

abstract class MeetingMinutes implements _i1.SerializableModel {
  MeetingMinutes._({
    this.id,
    required this.societyId,
    required this.meetingTitle,
    required this.meetingType,
    required this.meetingDate,
    required this.agenda,
    required this.minutesSummary,
    required this.attendeesCount,
    this.documentUrl,
    required this.recordedByName,
    required this.createdAt,
  });

  factory MeetingMinutes({
    int? id,
    required int societyId,
    required String meetingTitle,
    required String meetingType,
    required DateTime meetingDate,
    required String agenda,
    required String minutesSummary,
    required int attendeesCount,
    String? documentUrl,
    required String recordedByName,
    required DateTime createdAt,
  }) = _MeetingMinutesImpl;

  factory MeetingMinutes.fromJson(Map<String, dynamic> jsonSerialization) {
    return MeetingMinutes(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      meetingTitle: jsonSerialization['meetingTitle'] as String,
      meetingType: jsonSerialization['meetingType'] as String,
      meetingDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['meetingDate'],
      ),
      agenda: jsonSerialization['agenda'] as String,
      minutesSummary: jsonSerialization['minutesSummary'] as String,
      attendeesCount: jsonSerialization['attendeesCount'] as int,
      documentUrl: jsonSerialization['documentUrl'] as String?,
      recordedByName: jsonSerialization['recordedByName'] as String,
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

  String meetingTitle;

  String meetingType;

  DateTime meetingDate;

  String agenda;

  String minutesSummary;

  int attendeesCount;

  String? documentUrl;

  String recordedByName;

  DateTime createdAt;

  /// Returns a shallow copy of this [MeetingMinutes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MeetingMinutes copyWith({
    int? id,
    int? societyId,
    String? meetingTitle,
    String? meetingType,
    DateTime? meetingDate,
    String? agenda,
    String? minutesSummary,
    int? attendeesCount,
    String? documentUrl,
    String? recordedByName,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MeetingMinutes',
      if (id != null) 'id': id,
      'societyId': societyId,
      'meetingTitle': meetingTitle,
      'meetingType': meetingType,
      'meetingDate': meetingDate.toJson(),
      'agenda': agenda,
      'minutesSummary': minutesSummary,
      'attendeesCount': attendeesCount,
      if (documentUrl != null) 'documentUrl': documentUrl,
      'recordedByName': recordedByName,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MeetingMinutesImpl extends MeetingMinutes {
  _MeetingMinutesImpl({
    int? id,
    required int societyId,
    required String meetingTitle,
    required String meetingType,
    required DateTime meetingDate,
    required String agenda,
    required String minutesSummary,
    required int attendeesCount,
    String? documentUrl,
    required String recordedByName,
    required DateTime createdAt,
  }) : super._(
         id: id,
         societyId: societyId,
         meetingTitle: meetingTitle,
         meetingType: meetingType,
         meetingDate: meetingDate,
         agenda: agenda,
         minutesSummary: minutesSummary,
         attendeesCount: attendeesCount,
         documentUrl: documentUrl,
         recordedByName: recordedByName,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [MeetingMinutes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MeetingMinutes copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? meetingTitle,
    String? meetingType,
    DateTime? meetingDate,
    String? agenda,
    String? minutesSummary,
    int? attendeesCount,
    Object? documentUrl = _Undefined,
    String? recordedByName,
    DateTime? createdAt,
  }) {
    return MeetingMinutes(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      meetingTitle: meetingTitle ?? this.meetingTitle,
      meetingType: meetingType ?? this.meetingType,
      meetingDate: meetingDate ?? this.meetingDate,
      agenda: agenda ?? this.agenda,
      minutesSummary: minutesSummary ?? this.minutesSummary,
      attendeesCount: attendeesCount ?? this.attendeesCount,
      documentUrl: documentUrl is String? ? documentUrl : this.documentUrl,
      recordedByName: recordedByName ?? this.recordedByName,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
