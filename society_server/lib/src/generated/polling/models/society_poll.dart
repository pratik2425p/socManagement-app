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
import '../../polling/models/poll_status.dart' as _i2;

abstract class SocietyPoll
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = SocietyPollTable();

  static const db = SocietyPollRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static SocietyPollInclude include() {
    return SocietyPollInclude._();
  }

  static SocietyPollIncludeList includeList({
    _i1.WhereExpressionBuilder<SocietyPollTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SocietyPollTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SocietyPollTable>? orderByList,
    SocietyPollInclude? include,
  }) {
    return SocietyPollIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SocietyPoll.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SocietyPoll.t),
      include: include,
    );
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

class SocietyPollUpdateTable extends _i1.UpdateTable<SocietyPollTable> {
  SocietyPollUpdateTable(super.table);

  _i1.ColumnValue<int, int> societyId(int value) => _i1.ColumnValue(
    table.societyId,
    value,
  );

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<String, String> description(String value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<String, String> category(String value) => _i1.ColumnValue(
    table.category,
    value,
  );

  _i1.ColumnValue<_i2.PollStatus, _i2.PollStatus> status(
    _i2.PollStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> startDate(DateTime value) =>
      _i1.ColumnValue(
        table.startDate,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> endDate(DateTime value) =>
      _i1.ColumnValue(
        table.endDate,
        value,
      );

  _i1.ColumnValue<int, int> totalEligibleFlats(int value) => _i1.ColumnValue(
    table.totalEligibleFlats,
    value,
  );

  _i1.ColumnValue<int, int> totalVotesCast(int value) => _i1.ColumnValue(
    table.totalVotesCast,
    value,
  );

  _i1.ColumnValue<String, String> createdByName(String value) =>
      _i1.ColumnValue(
        table.createdByName,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class SocietyPollTable extends _i1.Table<int?> {
  SocietyPollTable({super.tableRelation}) : super(tableName: 'society_poll') {
    updateTable = SocietyPollUpdateTable(this);
    societyId = _i1.ColumnInt(
      'societyId',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    category = _i1.ColumnString(
      'category',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
    startDate = _i1.ColumnDateTime(
      'startDate',
      this,
    );
    endDate = _i1.ColumnDateTime(
      'endDate',
      this,
    );
    totalEligibleFlats = _i1.ColumnInt(
      'totalEligibleFlats',
      this,
    );
    totalVotesCast = _i1.ColumnInt(
      'totalVotesCast',
      this,
    );
    createdByName = _i1.ColumnString(
      'createdByName',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final SocietyPollUpdateTable updateTable;

  late final _i1.ColumnInt societyId;

  late final _i1.ColumnString title;

  late final _i1.ColumnString description;

  late final _i1.ColumnString category;

  late final _i1.ColumnEnum<_i2.PollStatus> status;

  late final _i1.ColumnDateTime startDate;

  late final _i1.ColumnDateTime endDate;

  late final _i1.ColumnInt totalEligibleFlats;

  late final _i1.ColumnInt totalVotesCast;

  late final _i1.ColumnString createdByName;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    societyId,
    title,
    description,
    category,
    status,
    startDate,
    endDate,
    totalEligibleFlats,
    totalVotesCast,
    createdByName,
    createdAt,
  ];
}

class SocietyPollInclude extends _i1.IncludeObject {
  SocietyPollInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => SocietyPoll.t;
}

class SocietyPollIncludeList extends _i1.IncludeList {
  SocietyPollIncludeList._({
    _i1.WhereExpressionBuilder<SocietyPollTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SocietyPoll.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => SocietyPoll.t;
}

class SocietyPollRepository {
  const SocietyPollRepository._();

  /// Returns a list of [SocietyPoll]s matching the given query parameters.
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
  Future<List<SocietyPoll>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SocietyPollTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SocietyPollTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SocietyPollTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<SocietyPoll>(
      where: where?.call(SocietyPoll.t),
      orderBy: orderBy?.call(SocietyPoll.t),
      orderByList: orderByList?.call(SocietyPoll.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [SocietyPoll] matching the given query parameters.
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
  Future<SocietyPoll?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SocietyPollTable>? where,
    int? offset,
    _i1.OrderByBuilder<SocietyPollTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SocietyPollTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<SocietyPoll>(
      where: where?.call(SocietyPoll.t),
      orderBy: orderBy?.call(SocietyPoll.t),
      orderByList: orderByList?.call(SocietyPoll.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [SocietyPoll] by its [id] or null if no such row exists.
  Future<SocietyPoll?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<SocietyPoll>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [SocietyPoll]s in the list and returns the inserted rows.
  ///
  /// The returned [SocietyPoll]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<SocietyPoll>> insert(
    _i1.DatabaseSession session,
    List<SocietyPoll> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<SocietyPoll>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [SocietyPoll] and returns the inserted row.
  ///
  /// The returned [SocietyPoll] will have its `id` field set.
  Future<SocietyPoll> insertRow(
    _i1.DatabaseSession session,
    SocietyPoll row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SocietyPoll>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SocietyPoll]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SocietyPoll>> update(
    _i1.DatabaseSession session,
    List<SocietyPoll> rows, {
    _i1.ColumnSelections<SocietyPollTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SocietyPoll>(
      rows,
      columns: columns?.call(SocietyPoll.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SocietyPoll]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SocietyPoll> updateRow(
    _i1.DatabaseSession session,
    SocietyPoll row, {
    _i1.ColumnSelections<SocietyPollTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SocietyPoll>(
      row,
      columns: columns?.call(SocietyPoll.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SocietyPoll] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<SocietyPoll?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<SocietyPollUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<SocietyPoll>(
      id,
      columnValues: columnValues(SocietyPoll.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [SocietyPoll]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<SocietyPoll>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<SocietyPollUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<SocietyPollTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SocietyPollTable>? orderBy,
    _i1.OrderByListBuilder<SocietyPollTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<SocietyPoll>(
      columnValues: columnValues(SocietyPoll.t.updateTable),
      where: where(SocietyPoll.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SocietyPoll.t),
      orderByList: orderByList?.call(SocietyPoll.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [SocietyPoll]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SocietyPoll>> delete(
    _i1.DatabaseSession session,
    List<SocietyPoll> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SocietyPoll>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SocietyPoll].
  Future<SocietyPoll> deleteRow(
    _i1.DatabaseSession session,
    SocietyPoll row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SocietyPoll>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SocietyPoll>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<SocietyPollTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SocietyPoll>(
      where: where(SocietyPoll.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SocietyPollTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SocietyPoll>(
      where: where?.call(SocietyPoll.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [SocietyPoll] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<SocietyPollTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<SocietyPoll>(
      where: where(SocietyPoll.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
