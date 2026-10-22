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

abstract class LedgerAccount
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  LedgerAccount._({
    this.id,
    required this.societyId,
    required this.accountCode,
    required this.accountName,
    required this.accountType,
    required this.balance,
  });

  factory LedgerAccount({
    int? id,
    required int societyId,
    required String accountCode,
    required String accountName,
    required String accountType,
    required double balance,
  }) = _LedgerAccountImpl;

  factory LedgerAccount.fromJson(Map<String, dynamic> jsonSerialization) {
    return LedgerAccount(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      accountCode: jsonSerialization['accountCode'] as String,
      accountName: jsonSerialization['accountName'] as String,
      accountType: jsonSerialization['accountType'] as String,
      balance: (jsonSerialization['balance'] as num).toDouble(),
    );
  }

  static final t = LedgerAccountTable();

  static const db = LedgerAccountRepository._();

  @override
  int? id;

  int societyId;

  String accountCode;

  String accountName;

  String accountType;

  double balance;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [LedgerAccount]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LedgerAccount copyWith({
    int? id,
    int? societyId,
    String? accountCode,
    String? accountName,
    String? accountType,
    double? balance,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LedgerAccount',
      if (id != null) 'id': id,
      'societyId': societyId,
      'accountCode': accountCode,
      'accountName': accountName,
      'accountType': accountType,
      'balance': balance,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LedgerAccount',
      if (id != null) 'id': id,
      'societyId': societyId,
      'accountCode': accountCode,
      'accountName': accountName,
      'accountType': accountType,
      'balance': balance,
    };
  }

  static LedgerAccountInclude include() {
    return LedgerAccountInclude._();
  }

  static LedgerAccountIncludeList includeList({
    _i1.WhereExpressionBuilder<LedgerAccountTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LedgerAccountTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LedgerAccountTable>? orderByList,
    LedgerAccountInclude? include,
  }) {
    return LedgerAccountIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LedgerAccount.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(LedgerAccount.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LedgerAccountImpl extends LedgerAccount {
  _LedgerAccountImpl({
    int? id,
    required int societyId,
    required String accountCode,
    required String accountName,
    required String accountType,
    required double balance,
  }) : super._(
         id: id,
         societyId: societyId,
         accountCode: accountCode,
         accountName: accountName,
         accountType: accountType,
         balance: balance,
       );

  /// Returns a shallow copy of this [LedgerAccount]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LedgerAccount copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? accountCode,
    String? accountName,
    String? accountType,
    double? balance,
  }) {
    return LedgerAccount(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      accountCode: accountCode ?? this.accountCode,
      accountName: accountName ?? this.accountName,
      accountType: accountType ?? this.accountType,
      balance: balance ?? this.balance,
    );
  }
}

class LedgerAccountUpdateTable extends _i1.UpdateTable<LedgerAccountTable> {
  LedgerAccountUpdateTable(super.table);

  _i1.ColumnValue<int, int> societyId(int value) => _i1.ColumnValue(
    table.societyId,
    value,
  );

  _i1.ColumnValue<String, String> accountCode(String value) => _i1.ColumnValue(
    table.accountCode,
    value,
  );

  _i1.ColumnValue<String, String> accountName(String value) => _i1.ColumnValue(
    table.accountName,
    value,
  );

  _i1.ColumnValue<String, String> accountType(String value) => _i1.ColumnValue(
    table.accountType,
    value,
  );

  _i1.ColumnValue<double, double> balance(double value) => _i1.ColumnValue(
    table.balance,
    value,
  );
}

class LedgerAccountTable extends _i1.Table<int?> {
  LedgerAccountTable({super.tableRelation})
    : super(tableName: 'ledger_account') {
    updateTable = LedgerAccountUpdateTable(this);
    societyId = _i1.ColumnInt(
      'societyId',
      this,
    );
    accountCode = _i1.ColumnString(
      'accountCode',
      this,
    );
    accountName = _i1.ColumnString(
      'accountName',
      this,
    );
    accountType = _i1.ColumnString(
      'accountType',
      this,
    );
    balance = _i1.ColumnDouble(
      'balance',
      this,
    );
  }

  late final LedgerAccountUpdateTable updateTable;

  late final _i1.ColumnInt societyId;

  late final _i1.ColumnString accountCode;

  late final _i1.ColumnString accountName;

  late final _i1.ColumnString accountType;

  late final _i1.ColumnDouble balance;

  @override
  List<_i1.Column> get columns => [
    id,
    societyId,
    accountCode,
    accountName,
    accountType,
    balance,
  ];
}

class LedgerAccountInclude extends _i1.IncludeObject {
  LedgerAccountInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => LedgerAccount.t;
}

class LedgerAccountIncludeList extends _i1.IncludeList {
  LedgerAccountIncludeList._({
    _i1.WhereExpressionBuilder<LedgerAccountTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(LedgerAccount.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => LedgerAccount.t;
}

class LedgerAccountRepository {
  const LedgerAccountRepository._();

  /// Returns a list of [LedgerAccount]s matching the given query parameters.
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
  Future<List<LedgerAccount>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<LedgerAccountTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LedgerAccountTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LedgerAccountTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<LedgerAccount>(
      where: where?.call(LedgerAccount.t),
      orderBy: orderBy?.call(LedgerAccount.t),
      orderByList: orderByList?.call(LedgerAccount.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [LedgerAccount] matching the given query parameters.
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
  Future<LedgerAccount?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<LedgerAccountTable>? where,
    int? offset,
    _i1.OrderByBuilder<LedgerAccountTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LedgerAccountTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<LedgerAccount>(
      where: where?.call(LedgerAccount.t),
      orderBy: orderBy?.call(LedgerAccount.t),
      orderByList: orderByList?.call(LedgerAccount.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [LedgerAccount] by its [id] or null if no such row exists.
  Future<LedgerAccount?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<LedgerAccount>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [LedgerAccount]s in the list and returns the inserted rows.
  ///
  /// The returned [LedgerAccount]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<LedgerAccount>> insert(
    _i1.DatabaseSession session,
    List<LedgerAccount> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<LedgerAccount>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [LedgerAccount] and returns the inserted row.
  ///
  /// The returned [LedgerAccount] will have its `id` field set.
  Future<LedgerAccount> insertRow(
    _i1.DatabaseSession session,
    LedgerAccount row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<LedgerAccount>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [LedgerAccount]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<LedgerAccount>> update(
    _i1.DatabaseSession session,
    List<LedgerAccount> rows, {
    _i1.ColumnSelections<LedgerAccountTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<LedgerAccount>(
      rows,
      columns: columns?.call(LedgerAccount.t),
      transaction: transaction,
    );
  }

  /// Updates a single [LedgerAccount]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<LedgerAccount> updateRow(
    _i1.DatabaseSession session,
    LedgerAccount row, {
    _i1.ColumnSelections<LedgerAccountTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<LedgerAccount>(
      row,
      columns: columns?.call(LedgerAccount.t),
      transaction: transaction,
    );
  }

  /// Updates a single [LedgerAccount] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<LedgerAccount?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<LedgerAccountUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<LedgerAccount>(
      id,
      columnValues: columnValues(LedgerAccount.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [LedgerAccount]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<LedgerAccount>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<LedgerAccountUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<LedgerAccountTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LedgerAccountTable>? orderBy,
    _i1.OrderByListBuilder<LedgerAccountTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<LedgerAccount>(
      columnValues: columnValues(LedgerAccount.t.updateTable),
      where: where(LedgerAccount.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LedgerAccount.t),
      orderByList: orderByList?.call(LedgerAccount.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [LedgerAccount]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<LedgerAccount>> delete(
    _i1.DatabaseSession session,
    List<LedgerAccount> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<LedgerAccount>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [LedgerAccount].
  Future<LedgerAccount> deleteRow(
    _i1.DatabaseSession session,
    LedgerAccount row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<LedgerAccount>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<LedgerAccount>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<LedgerAccountTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<LedgerAccount>(
      where: where(LedgerAccount.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<LedgerAccountTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<LedgerAccount>(
      where: where?.call(LedgerAccount.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [LedgerAccount] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<LedgerAccountTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<LedgerAccount>(
      where: where(LedgerAccount.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
