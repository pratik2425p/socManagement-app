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

abstract class PollOption implements _i1.SerializableModel {
  PollOption._({
    this.id,
    required this.pollId,
    required this.optionText,
    required this.votesCount,
  });

  factory PollOption({
    int? id,
    required int pollId,
    required String optionText,
    required int votesCount,
  }) = _PollOptionImpl;

  factory PollOption.fromJson(Map<String, dynamic> jsonSerialization) {
    return PollOption(
      id: jsonSerialization['id'] as int?,
      pollId: jsonSerialization['pollId'] as int,
      optionText: jsonSerialization['optionText'] as String,
      votesCount: jsonSerialization['votesCount'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int pollId;

  String optionText;

  int votesCount;

  /// Returns a shallow copy of this [PollOption]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PollOption copyWith({
    int? id,
    int? pollId,
    String? optionText,
    int? votesCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PollOption',
      if (id != null) 'id': id,
      'pollId': pollId,
      'optionText': optionText,
      'votesCount': votesCount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PollOptionImpl extends PollOption {
  _PollOptionImpl({
    int? id,
    required int pollId,
    required String optionText,
    required int votesCount,
  }) : super._(
         id: id,
         pollId: pollId,
         optionText: optionText,
         votesCount: votesCount,
       );

  /// Returns a shallow copy of this [PollOption]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PollOption copyWith({
    Object? id = _Undefined,
    int? pollId,
    String? optionText,
    int? votesCount,
  }) {
    return PollOption(
      id: id is int? ? id : this.id,
      pollId: pollId ?? this.pollId,
      optionText: optionText ?? this.optionText,
      votesCount: votesCount ?? this.votesCount,
    );
  }
}
