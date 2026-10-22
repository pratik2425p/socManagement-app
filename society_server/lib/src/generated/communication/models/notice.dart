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

abstract class Notice implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = NoticeTable();

  static const db = NoticeRepository._();

  @override
  int? id;

  int societyId;

  String title;

  String content;

  String category;

  String priority;

  String postedByName;

  DateTime postedAt;

  DateTime? expiresAt;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static NoticeInclude include() {
    return NoticeInclude._();
  }

  static NoticeIncludeList includeList({
    _i1.WhereExpressionBuilder<NoticeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NoticeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoticeTable>? orderByList,
    NoticeInclude? include,
  }) {
    return NoticeIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Notice.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Notice.t),
      include: include,
    );
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

class NoticeUpdateTable extends _i1.UpdateTable<NoticeTable> {
  NoticeUpdateTable(super.table);

  _i1.ColumnValue<int, int> societyId(int value) => _i1.ColumnValue(
    table.societyId,
    value,
  );

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<String, String> content(String value) => _i1.ColumnValue(
    table.content,
    value,
  );

  _i1.ColumnValue<String, String> category(String value) => _i1.ColumnValue(
    table.category,
    value,
  );

  _i1.ColumnValue<String, String> priority(String value) => _i1.ColumnValue(
    table.priority,
    value,
  );

  _i1.ColumnValue<String, String> postedByName(String value) => _i1.ColumnValue(
    table.postedByName,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> postedAt(DateTime value) =>
      _i1.ColumnValue(
        table.postedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> expiresAt(DateTime? value) =>
      _i1.ColumnValue(
        table.expiresAt,
        value,
      );
}

class NoticeTable extends _i1.Table<int?> {
  NoticeTable({super.tableRelation}) : super(tableName: 'notice') {
    updateTable = NoticeUpdateTable(this);
    societyId = _i1.ColumnInt(
      'societyId',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    content = _i1.ColumnString(
      'content',
      this,
    );
    category = _i1.ColumnString(
      'category',
      this,
    );
    priority = _i1.ColumnString(
      'priority',
      this,
    );
    postedByName = _i1.ColumnString(
      'postedByName',
      this,
    );
    postedAt = _i1.ColumnDateTime(
      'postedAt',
      this,
    );
    expiresAt = _i1.ColumnDateTime(
      'expiresAt',
      this,
    );
  }

  late final NoticeUpdateTable updateTable;

  late final _i1.ColumnInt societyId;

  late final _i1.ColumnString title;

  late final _i1.ColumnString content;

  late final _i1.ColumnString category;

  late final _i1.ColumnString priority;

  late final _i1.ColumnString postedByName;

  late final _i1.ColumnDateTime postedAt;

  late final _i1.ColumnDateTime expiresAt;

  @override
  List<_i1.Column> get columns => [
    id,
    societyId,
    title,
    content,
    category,
    priority,
    postedByName,
    postedAt,
    expiresAt,
  ];
}

class NoticeInclude extends _i1.IncludeObject {
  NoticeInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Notice.t;
}

class NoticeIncludeList extends _i1.IncludeList {
  NoticeIncludeList._({
    _i1.WhereExpressionBuilder<NoticeTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Notice.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Notice.t;
}

class NoticeRepository {
  const NoticeRepository._();

  /// Returns a list of [Notice]s matching the given query parameters.
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
  Future<List<Notice>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<NoticeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NoticeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoticeTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Notice>(
      where: where?.call(Notice.t),
      orderBy: orderBy?.call(Notice.t),
      orderByList: orderByList?.call(Notice.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Notice] matching the given query parameters.
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
  Future<Notice?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<NoticeTable>? where,
    int? offset,
    _i1.OrderByBuilder<NoticeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoticeTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Notice>(
      where: where?.call(Notice.t),
      orderBy: orderBy?.call(Notice.t),
      orderByList: orderByList?.call(Notice.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Notice] by its [id] or null if no such row exists.
  Future<Notice?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Notice>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Notice]s in the list and returns the inserted rows.
  ///
  /// The returned [Notice]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Notice>> insert(
    _i1.DatabaseSession session,
    List<Notice> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Notice>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Notice] and returns the inserted row.
  ///
  /// The returned [Notice] will have its `id` field set.
  Future<Notice> insertRow(
    _i1.DatabaseSession session,
    Notice row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Notice>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Notice]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Notice>> update(
    _i1.DatabaseSession session,
    List<Notice> rows, {
    _i1.ColumnSelections<NoticeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Notice>(
      rows,
      columns: columns?.call(Notice.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Notice]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Notice> updateRow(
    _i1.DatabaseSession session,
    Notice row, {
    _i1.ColumnSelections<NoticeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Notice>(
      row,
      columns: columns?.call(Notice.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Notice] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Notice?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<NoticeUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Notice>(
      id,
      columnValues: columnValues(Notice.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Notice]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Notice>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<NoticeUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<NoticeTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NoticeTable>? orderBy,
    _i1.OrderByListBuilder<NoticeTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Notice>(
      columnValues: columnValues(Notice.t.updateTable),
      where: where(Notice.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Notice.t),
      orderByList: orderByList?.call(Notice.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Notice]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Notice>> delete(
    _i1.DatabaseSession session,
    List<Notice> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Notice>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Notice].
  Future<Notice> deleteRow(
    _i1.DatabaseSession session,
    Notice row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Notice>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Notice>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<NoticeTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Notice>(
      where: where(Notice.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<NoticeTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Notice>(
      where: where?.call(Notice.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Notice] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<NoticeTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Notice>(
      where: where(Notice.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
