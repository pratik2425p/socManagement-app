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

abstract class MeetingMinutes
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = MeetingMinutesTable();

  static const db = MeetingMinutesRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static MeetingMinutesInclude include() {
    return MeetingMinutesInclude._();
  }

  static MeetingMinutesIncludeList includeList({
    _i1.WhereExpressionBuilder<MeetingMinutesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MeetingMinutesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MeetingMinutesTable>? orderByList,
    MeetingMinutesInclude? include,
  }) {
    return MeetingMinutesIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MeetingMinutes.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MeetingMinutes.t),
      include: include,
    );
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

class MeetingMinutesUpdateTable extends _i1.UpdateTable<MeetingMinutesTable> {
  MeetingMinutesUpdateTable(super.table);

  _i1.ColumnValue<int, int> societyId(int value) => _i1.ColumnValue(
    table.societyId,
    value,
  );

  _i1.ColumnValue<String, String> meetingTitle(String value) => _i1.ColumnValue(
    table.meetingTitle,
    value,
  );

  _i1.ColumnValue<String, String> meetingType(String value) => _i1.ColumnValue(
    table.meetingType,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> meetingDate(DateTime value) =>
      _i1.ColumnValue(
        table.meetingDate,
        value,
      );

  _i1.ColumnValue<String, String> agenda(String value) => _i1.ColumnValue(
    table.agenda,
    value,
  );

  _i1.ColumnValue<String, String> minutesSummary(String value) =>
      _i1.ColumnValue(
        table.minutesSummary,
        value,
      );

  _i1.ColumnValue<int, int> attendeesCount(int value) => _i1.ColumnValue(
    table.attendeesCount,
    value,
  );

  _i1.ColumnValue<String, String> documentUrl(String? value) => _i1.ColumnValue(
    table.documentUrl,
    value,
  );

  _i1.ColumnValue<String, String> recordedByName(String value) =>
      _i1.ColumnValue(
        table.recordedByName,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class MeetingMinutesTable extends _i1.Table<int?> {
  MeetingMinutesTable({super.tableRelation})
    : super(tableName: 'meeting_minutes') {
    updateTable = MeetingMinutesUpdateTable(this);
    societyId = _i1.ColumnInt(
      'societyId',
      this,
    );
    meetingTitle = _i1.ColumnString(
      'meetingTitle',
      this,
    );
    meetingType = _i1.ColumnString(
      'meetingType',
      this,
    );
    meetingDate = _i1.ColumnDateTime(
      'meetingDate',
      this,
    );
    agenda = _i1.ColumnString(
      'agenda',
      this,
    );
    minutesSummary = _i1.ColumnString(
      'minutesSummary',
      this,
    );
    attendeesCount = _i1.ColumnInt(
      'attendeesCount',
      this,
    );
    documentUrl = _i1.ColumnString(
      'documentUrl',
      this,
    );
    recordedByName = _i1.ColumnString(
      'recordedByName',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final MeetingMinutesUpdateTable updateTable;

  late final _i1.ColumnInt societyId;

  late final _i1.ColumnString meetingTitle;

  late final _i1.ColumnString meetingType;

  late final _i1.ColumnDateTime meetingDate;

  late final _i1.ColumnString agenda;

  late final _i1.ColumnString minutesSummary;

  late final _i1.ColumnInt attendeesCount;

  late final _i1.ColumnString documentUrl;

  late final _i1.ColumnString recordedByName;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    societyId,
    meetingTitle,
    meetingType,
    meetingDate,
    agenda,
    minutesSummary,
    attendeesCount,
    documentUrl,
    recordedByName,
    createdAt,
  ];
}

class MeetingMinutesInclude extends _i1.IncludeObject {
  MeetingMinutesInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => MeetingMinutes.t;
}

class MeetingMinutesIncludeList extends _i1.IncludeList {
  MeetingMinutesIncludeList._({
    _i1.WhereExpressionBuilder<MeetingMinutesTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MeetingMinutes.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => MeetingMinutes.t;
}

class MeetingMinutesRepository {
  const MeetingMinutesRepository._();

  /// Returns a list of [MeetingMinutes]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<MeetingMinutes>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<MeetingMinutesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MeetingMinutesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MeetingMinutesTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<MeetingMinutes>(
      where: where?.call(MeetingMinutes.t),
      orderBy: orderBy?.call(MeetingMinutes.t),
      orderByList: orderByList?.call(MeetingMinutes.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [MeetingMinutes] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<MeetingMinutes?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<MeetingMinutesTable>? where,
    int? offset,
    _i1.OrderByBuilder<MeetingMinutesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MeetingMinutesTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<MeetingMinutes>(
      where: where?.call(MeetingMinutes.t),
      orderBy: orderBy?.call(MeetingMinutes.t),
      orderByList: orderByList?.call(MeetingMinutes.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [MeetingMinutes] by its [id] or null if no such row exists.
  Future<MeetingMinutes?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<MeetingMinutes>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [MeetingMinutes]s in the list and returns the inserted rows.
  ///
  /// The returned [MeetingMinutes]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<MeetingMinutes>> insert(
    _i1.DatabaseSession session,
    List<MeetingMinutes> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<MeetingMinutes>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [MeetingMinutes] and returns the inserted row.
  ///
  /// The returned [MeetingMinutes] will have its `id` field set.
  Future<MeetingMinutes> insertRow(
    _i1.DatabaseSession session,
    MeetingMinutes row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MeetingMinutes>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MeetingMinutes]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MeetingMinutes>> update(
    _i1.DatabaseSession session,
    List<MeetingMinutes> rows, {
    _i1.ColumnSelections<MeetingMinutesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MeetingMinutes>(
      rows,
      columns: columns?.call(MeetingMinutes.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MeetingMinutes]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MeetingMinutes> updateRow(
    _i1.DatabaseSession session,
    MeetingMinutes row, {
    _i1.ColumnSelections<MeetingMinutesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MeetingMinutes>(
      row,
      columns: columns?.call(MeetingMinutes.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MeetingMinutes] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<MeetingMinutes?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<MeetingMinutesUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<MeetingMinutes>(
      id,
      columnValues: columnValues(MeetingMinutes.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [MeetingMinutes]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<MeetingMinutes>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<MeetingMinutesUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<MeetingMinutesTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MeetingMinutesTable>? orderBy,
    _i1.OrderByListBuilder<MeetingMinutesTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<MeetingMinutes>(
      columnValues: columnValues(MeetingMinutes.t.updateTable),
      where: where(MeetingMinutes.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MeetingMinutes.t),
      orderByList: orderByList?.call(MeetingMinutes.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [MeetingMinutes]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MeetingMinutes>> delete(
    _i1.DatabaseSession session,
    List<MeetingMinutes> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MeetingMinutes>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MeetingMinutes].
  Future<MeetingMinutes> deleteRow(
    _i1.DatabaseSession session,
    MeetingMinutes row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MeetingMinutes>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MeetingMinutes>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<MeetingMinutesTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MeetingMinutes>(
      where: where(MeetingMinutes.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<MeetingMinutesTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MeetingMinutes>(
      where: where?.call(MeetingMinutes.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [MeetingMinutes] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<MeetingMinutesTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<MeetingMinutes>(
      where: where(MeetingMinutes.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
