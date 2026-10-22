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

abstract class LedgerEntry
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  LedgerEntry._({
    this.id,
    required this.societyId,
    required this.entryNumber,
    this.voucherId,
    required this.entryDate,
    required this.description,
    required this.postedByName,
    required this.totalDebit,
    required this.totalCredit,
    required this.postedAt,
  });

  factory LedgerEntry({
    int? id,
    required int societyId,
    required String entryNumber,
    int? voucherId,
    required DateTime entryDate,
    required String description,
    required String postedByName,
    required double totalDebit,
    required double totalCredit,
    required DateTime postedAt,
  }) = _LedgerEntryImpl;

  factory LedgerEntry.fromJson(Map<String, dynamic> jsonSerialization) {
    return LedgerEntry(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      entryNumber: jsonSerialization['entryNumber'] as String,
      voucherId: jsonSerialization['voucherId'] as int?,
      entryDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['entryDate'],
      ),
      description: jsonSerialization['description'] as String,
      postedByName: jsonSerialization['postedByName'] as String,
      totalDebit: (jsonSerialization['totalDebit'] as num).toDouble(),
      totalCredit: (jsonSerialization['totalCredit'] as num).toDouble(),
      postedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['postedAt'],
      ),
    );
  }

  static final t = LedgerEntryTable();

  static const db = LedgerEntryRepository._();

  @override
  int? id;

  int societyId;

  String entryNumber;

  int? voucherId;

  DateTime entryDate;

  String description;

  String postedByName;

  double totalDebit;

  double totalCredit;

  DateTime postedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [LedgerEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LedgerEntry copyWith({
    int? id,
    int? societyId,
    String? entryNumber,
    int? voucherId,
    DateTime? entryDate,
    String? description,
    String? postedByName,
    double? totalDebit,
    double? totalCredit,
    DateTime? postedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LedgerEntry',
      if (id != null) 'id': id,
      'societyId': societyId,
      'entryNumber': entryNumber,
      if (voucherId != null) 'voucherId': voucherId,
      'entryDate': entryDate.toJson(),
      'description': description,
      'postedByName': postedByName,
      'totalDebit': totalDebit,
      'totalCredit': totalCredit,
      'postedAt': postedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LedgerEntry',
      if (id != null) 'id': id,
      'societyId': societyId,
      'entryNumber': entryNumber,
      if (voucherId != null) 'voucherId': voucherId,
      'entryDate': entryDate.toJson(),
      'description': description,
      'postedByName': postedByName,
      'totalDebit': totalDebit,
      'totalCredit': totalCredit,
      'postedAt': postedAt.toJson(),
    };
  }

  static LedgerEntryInclude include() {
    return LedgerEntryInclude._();
  }

  static LedgerEntryIncludeList includeList({
    _i1.WhereExpressionBuilder<LedgerEntryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LedgerEntryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LedgerEntryTable>? orderByList,
    LedgerEntryInclude? include,
  }) {
    return LedgerEntryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LedgerEntry.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(LedgerEntry.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LedgerEntryImpl extends LedgerEntry {
  _LedgerEntryImpl({
    int? id,
    required int societyId,
    required String entryNumber,
    int? voucherId,
    required DateTime entryDate,
    required String description,
    required String postedByName,
    required double totalDebit,
    required double totalCredit,
    required DateTime postedAt,
  }) : super._(
         id: id,
         societyId: societyId,
         entryNumber: entryNumber,
         voucherId: voucherId,
         entryDate: entryDate,
         description: description,
         postedByName: postedByName,
         totalDebit: totalDebit,
         totalCredit: totalCredit,
         postedAt: postedAt,
       );

  /// Returns a shallow copy of this [LedgerEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LedgerEntry copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? entryNumber,
    Object? voucherId = _Undefined,
    DateTime? entryDate,
    String? description,
    String? postedByName,
    double? totalDebit,
    double? totalCredit,
    DateTime? postedAt,
  }) {
    return LedgerEntry(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      entryNumber: entryNumber ?? this.entryNumber,
      voucherId: voucherId is int? ? voucherId : this.voucherId,
      entryDate: entryDate ?? this.entryDate,
      description: description ?? this.description,
      postedByName: postedByName ?? this.postedByName,
      totalDebit: totalDebit ?? this.totalDebit,
      totalCredit: totalCredit ?? this.totalCredit,
      postedAt: postedAt ?? this.postedAt,
    );
  }
}

class LedgerEntryUpdateTable extends _i1.UpdateTable<LedgerEntryTable> {
  LedgerEntryUpdateTable(super.table);

  _i1.ColumnValue<int, int> societyId(int value) => _i1.ColumnValue(
    table.societyId,
    value,
  );

  _i1.ColumnValue<String, String> entryNumber(String value) => _i1.ColumnValue(
    table.entryNumber,
    value,
  );

  _i1.ColumnValue<int, int> voucherId(int? value) => _i1.ColumnValue(
    table.voucherId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> entryDate(DateTime value) =>
      _i1.ColumnValue(
        table.entryDate,
        value,
      );

  _i1.ColumnValue<String, String> description(String value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<String, String> postedByName(String value) => _i1.ColumnValue(
    table.postedByName,
    value,
  );

  _i1.ColumnValue<double, double> totalDebit(double value) => _i1.ColumnValue(
    table.totalDebit,
    value,
  );

  _i1.ColumnValue<double, double> totalCredit(double value) => _i1.ColumnValue(
    table.totalCredit,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> postedAt(DateTime value) =>
      _i1.ColumnValue(
        table.postedAt,
        value,
      );
}

class LedgerEntryTable extends _i1.Table<int?> {
  LedgerEntryTable({super.tableRelation}) : super(tableName: 'ledger_entry') {
    updateTable = LedgerEntryUpdateTable(this);
    societyId = _i1.ColumnInt(
      'societyId',
      this,
    );
    entryNumber = _i1.ColumnString(
      'entryNumber',
      this,
    );
    voucherId = _i1.ColumnInt(
      'voucherId',
      this,
    );
    entryDate = _i1.ColumnDateTime(
      'entryDate',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    postedByName = _i1.ColumnString(
      'postedByName',
      this,
    );
    totalDebit = _i1.ColumnDouble(
      'totalDebit',
      this,
    );
    totalCredit = _i1.ColumnDouble(
      'totalCredit',
      this,
    );
    postedAt = _i1.ColumnDateTime(
      'postedAt',
      this,
    );
  }

  late final LedgerEntryUpdateTable updateTable;

  late final _i1.ColumnInt societyId;

  late final _i1.ColumnString entryNumber;

  late final _i1.ColumnInt voucherId;

  late final _i1.ColumnDateTime entryDate;

  late final _i1.ColumnString description;

  late final _i1.ColumnString postedByName;

  late final _i1.ColumnDouble totalDebit;

  late final _i1.ColumnDouble totalCredit;

  late final _i1.ColumnDateTime postedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    societyId,
    entryNumber,
    voucherId,
    entryDate,
    description,
    postedByName,
    totalDebit,
    totalCredit,
    postedAt,
  ];
}

class LedgerEntryInclude extends _i1.IncludeObject {
  LedgerEntryInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => LedgerEntry.t;
}

class LedgerEntryIncludeList extends _i1.IncludeList {
  LedgerEntryIncludeList._({
    _i1.WhereExpressionBuilder<LedgerEntryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(LedgerEntry.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => LedgerEntry.t;
}

class LedgerEntryRepository {
  const LedgerEntryRepository._();

  /// Returns a list of [LedgerEntry]s matching the given query parameters.
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
  Future<List<LedgerEntry>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<LedgerEntryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LedgerEntryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LedgerEntryTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<LedgerEntry>(
      where: where?.call(LedgerEntry.t),
      orderBy: orderBy?.call(LedgerEntry.t),
      orderByList: orderByList?.call(LedgerEntry.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [LedgerEntry] matching the given query parameters.
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
  Future<LedgerEntry?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<LedgerEntryTable>? where,
    int? offset,
    _i1.OrderByBuilder<LedgerEntryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LedgerEntryTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<LedgerEntry>(
      where: where?.call(LedgerEntry.t),
      orderBy: orderBy?.call(LedgerEntry.t),
      orderByList: orderByList?.call(LedgerEntry.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [LedgerEntry] by its [id] or null if no such row exists.
  Future<LedgerEntry?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<LedgerEntry>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [LedgerEntry]s in the list and returns the inserted rows.
  ///
  /// The returned [LedgerEntry]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<LedgerEntry>> insert(
    _i1.DatabaseSession session,
    List<LedgerEntry> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<LedgerEntry>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [LedgerEntry] and returns the inserted row.
  ///
  /// The returned [LedgerEntry] will have its `id` field set.
  Future<LedgerEntry> insertRow(
    _i1.DatabaseSession session,
    LedgerEntry row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<LedgerEntry>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [LedgerEntry]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<LedgerEntry>> update(
    _i1.DatabaseSession session,
    List<LedgerEntry> rows, {
    _i1.ColumnSelections<LedgerEntryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<LedgerEntry>(
      rows,
      columns: columns?.call(LedgerEntry.t),
      transaction: transaction,
    );
  }

  /// Updates a single [LedgerEntry]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<LedgerEntry> updateRow(
    _i1.DatabaseSession session,
    LedgerEntry row, {
    _i1.ColumnSelections<LedgerEntryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<LedgerEntry>(
      row,
      columns: columns?.call(LedgerEntry.t),
      transaction: transaction,
    );
  }

  /// Updates a single [LedgerEntry] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<LedgerEntry?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<LedgerEntryUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<LedgerEntry>(
      id,
      columnValues: columnValues(LedgerEntry.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [LedgerEntry]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<LedgerEntry>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<LedgerEntryUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<LedgerEntryTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LedgerEntryTable>? orderBy,
    _i1.OrderByListBuilder<LedgerEntryTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<LedgerEntry>(
      columnValues: columnValues(LedgerEntry.t.updateTable),
      where: where(LedgerEntry.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LedgerEntry.t),
      orderByList: orderByList?.call(LedgerEntry.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [LedgerEntry]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<LedgerEntry>> delete(
    _i1.DatabaseSession session,
    List<LedgerEntry> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<LedgerEntry>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [LedgerEntry].
  Future<LedgerEntry> deleteRow(
    _i1.DatabaseSession session,
    LedgerEntry row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<LedgerEntry>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<LedgerEntry>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<LedgerEntryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<LedgerEntry>(
      where: where(LedgerEntry.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<LedgerEntryTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<LedgerEntry>(
      where: where?.call(LedgerEntry.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [LedgerEntry] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<LedgerEntryTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<LedgerEntry>(
      where: where(LedgerEntry.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
