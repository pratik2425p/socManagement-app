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
import '../../maintenance/models/bill_status.dart' as _i2;

abstract class MaintenanceBill
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  MaintenanceBill._({
    this.id,
    required this.societyId,
    required this.flatId,
    required this.flatNumber,
    required this.billNumber,
    required this.billingMonth,
    required this.dueDate,
    required this.amount,
    required this.lateFee,
    required this.status,
    required this.issuedAt,
  });

  factory MaintenanceBill({
    int? id,
    required int societyId,
    required int flatId,
    required String flatNumber,
    required String billNumber,
    required String billingMonth,
    required DateTime dueDate,
    required double amount,
    required double lateFee,
    required _i2.BillStatus status,
    required DateTime issuedAt,
  }) = _MaintenanceBillImpl;

  factory MaintenanceBill.fromJson(Map<String, dynamic> jsonSerialization) {
    return MaintenanceBill(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      flatId: jsonSerialization['flatId'] as int,
      flatNumber: jsonSerialization['flatNumber'] as String,
      billNumber: jsonSerialization['billNumber'] as String,
      billingMonth: jsonSerialization['billingMonth'] as String,
      dueDate: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dueDate']),
      amount: (jsonSerialization['amount'] as num).toDouble(),
      lateFee: (jsonSerialization['lateFee'] as num).toDouble(),
      status: _i2.BillStatus.fromJson((jsonSerialization['status'] as String)),
      issuedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['issuedAt'],
      ),
    );
  }

  static final t = MaintenanceBillTable();

  static const db = MaintenanceBillRepository._();

  @override
  int? id;

  int societyId;

  int flatId;

  String flatNumber;

  String billNumber;

  String billingMonth;

  DateTime dueDate;

  double amount;

  double lateFee;

  _i2.BillStatus status;

  DateTime issuedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [MaintenanceBill]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MaintenanceBill copyWith({
    int? id,
    int? societyId,
    int? flatId,
    String? flatNumber,
    String? billNumber,
    String? billingMonth,
    DateTime? dueDate,
    double? amount,
    double? lateFee,
    _i2.BillStatus? status,
    DateTime? issuedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MaintenanceBill',
      if (id != null) 'id': id,
      'societyId': societyId,
      'flatId': flatId,
      'flatNumber': flatNumber,
      'billNumber': billNumber,
      'billingMonth': billingMonth,
      'dueDate': dueDate.toJson(),
      'amount': amount,
      'lateFee': lateFee,
      'status': status.toJson(),
      'issuedAt': issuedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MaintenanceBill',
      if (id != null) 'id': id,
      'societyId': societyId,
      'flatId': flatId,
      'flatNumber': flatNumber,
      'billNumber': billNumber,
      'billingMonth': billingMonth,
      'dueDate': dueDate.toJson(),
      'amount': amount,
      'lateFee': lateFee,
      'status': status.toJson(),
      'issuedAt': issuedAt.toJson(),
    };
  }

  static MaintenanceBillInclude include() {
    return MaintenanceBillInclude._();
  }

  static MaintenanceBillIncludeList includeList({
    _i1.WhereExpressionBuilder<MaintenanceBillTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MaintenanceBillTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MaintenanceBillTable>? orderByList,
    MaintenanceBillInclude? include,
  }) {
    return MaintenanceBillIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MaintenanceBill.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MaintenanceBill.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MaintenanceBillImpl extends MaintenanceBill {
  _MaintenanceBillImpl({
    int? id,
    required int societyId,
    required int flatId,
    required String flatNumber,
    required String billNumber,
    required String billingMonth,
    required DateTime dueDate,
    required double amount,
    required double lateFee,
    required _i2.BillStatus status,
    required DateTime issuedAt,
  }) : super._(
         id: id,
         societyId: societyId,
         flatId: flatId,
         flatNumber: flatNumber,
         billNumber: billNumber,
         billingMonth: billingMonth,
         dueDate: dueDate,
         amount: amount,
         lateFee: lateFee,
         status: status,
         issuedAt: issuedAt,
       );

  /// Returns a shallow copy of this [MaintenanceBill]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MaintenanceBill copyWith({
    Object? id = _Undefined,
    int? societyId,
    int? flatId,
    String? flatNumber,
    String? billNumber,
    String? billingMonth,
    DateTime? dueDate,
    double? amount,
    double? lateFee,
    _i2.BillStatus? status,
    DateTime? issuedAt,
  }) {
    return MaintenanceBill(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      flatId: flatId ?? this.flatId,
      flatNumber: flatNumber ?? this.flatNumber,
      billNumber: billNumber ?? this.billNumber,
      billingMonth: billingMonth ?? this.billingMonth,
      dueDate: dueDate ?? this.dueDate,
      amount: amount ?? this.amount,
      lateFee: lateFee ?? this.lateFee,
      status: status ?? this.status,
      issuedAt: issuedAt ?? this.issuedAt,
    );
  }
}

class MaintenanceBillUpdateTable extends _i1.UpdateTable<MaintenanceBillTable> {
  MaintenanceBillUpdateTable(super.table);

  _i1.ColumnValue<int, int> societyId(int value) => _i1.ColumnValue(
    table.societyId,
    value,
  );

  _i1.ColumnValue<int, int> flatId(int value) => _i1.ColumnValue(
    table.flatId,
    value,
  );

  _i1.ColumnValue<String, String> flatNumber(String value) => _i1.ColumnValue(
    table.flatNumber,
    value,
  );

  _i1.ColumnValue<String, String> billNumber(String value) => _i1.ColumnValue(
    table.billNumber,
    value,
  );

  _i1.ColumnValue<String, String> billingMonth(String value) => _i1.ColumnValue(
    table.billingMonth,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> dueDate(DateTime value) =>
      _i1.ColumnValue(
        table.dueDate,
        value,
      );

  _i1.ColumnValue<double, double> amount(double value) => _i1.ColumnValue(
    table.amount,
    value,
  );

  _i1.ColumnValue<double, double> lateFee(double value) => _i1.ColumnValue(
    table.lateFee,
    value,
  );

  _i1.ColumnValue<_i2.BillStatus, _i2.BillStatus> status(
    _i2.BillStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> issuedAt(DateTime value) =>
      _i1.ColumnValue(
        table.issuedAt,
        value,
      );
}

class MaintenanceBillTable extends _i1.Table<int?> {
  MaintenanceBillTable({super.tableRelation})
    : super(tableName: 'maintenance_bill') {
    updateTable = MaintenanceBillUpdateTable(this);
    societyId = _i1.ColumnInt(
      'societyId',
      this,
    );
    flatId = _i1.ColumnInt(
      'flatId',
      this,
    );
    flatNumber = _i1.ColumnString(
      'flatNumber',
      this,
    );
    billNumber = _i1.ColumnString(
      'billNumber',
      this,
    );
    billingMonth = _i1.ColumnString(
      'billingMonth',
      this,
    );
    dueDate = _i1.ColumnDateTime(
      'dueDate',
      this,
    );
    amount = _i1.ColumnDouble(
      'amount',
      this,
    );
    lateFee = _i1.ColumnDouble(
      'lateFee',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
    issuedAt = _i1.ColumnDateTime(
      'issuedAt',
      this,
    );
  }

  late final MaintenanceBillUpdateTable updateTable;

  late final _i1.ColumnInt societyId;

  late final _i1.ColumnInt flatId;

  late final _i1.ColumnString flatNumber;

  late final _i1.ColumnString billNumber;

  late final _i1.ColumnString billingMonth;

  late final _i1.ColumnDateTime dueDate;

  late final _i1.ColumnDouble amount;

  late final _i1.ColumnDouble lateFee;

  late final _i1.ColumnEnum<_i2.BillStatus> status;

  late final _i1.ColumnDateTime issuedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    societyId,
    flatId,
    flatNumber,
    billNumber,
    billingMonth,
    dueDate,
    amount,
    lateFee,
    status,
    issuedAt,
  ];
}

class MaintenanceBillInclude extends _i1.IncludeObject {
  MaintenanceBillInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => MaintenanceBill.t;
}

class MaintenanceBillIncludeList extends _i1.IncludeList {
  MaintenanceBillIncludeList._({
    _i1.WhereExpressionBuilder<MaintenanceBillTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MaintenanceBill.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => MaintenanceBill.t;
}

class MaintenanceBillRepository {
  const MaintenanceBillRepository._();

  /// Returns a list of [MaintenanceBill]s matching the given query parameters.
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
  Future<List<MaintenanceBill>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<MaintenanceBillTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MaintenanceBillTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MaintenanceBillTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<MaintenanceBill>(
      where: where?.call(MaintenanceBill.t),
      orderBy: orderBy?.call(MaintenanceBill.t),
      orderByList: orderByList?.call(MaintenanceBill.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [MaintenanceBill] matching the given query parameters.
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
  Future<MaintenanceBill?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<MaintenanceBillTable>? where,
    int? offset,
    _i1.OrderByBuilder<MaintenanceBillTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MaintenanceBillTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<MaintenanceBill>(
      where: where?.call(MaintenanceBill.t),
      orderBy: orderBy?.call(MaintenanceBill.t),
      orderByList: orderByList?.call(MaintenanceBill.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [MaintenanceBill] by its [id] or null if no such row exists.
  Future<MaintenanceBill?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<MaintenanceBill>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [MaintenanceBill]s in the list and returns the inserted rows.
  ///
  /// The returned [MaintenanceBill]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<MaintenanceBill>> insert(
    _i1.DatabaseSession session,
    List<MaintenanceBill> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<MaintenanceBill>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [MaintenanceBill] and returns the inserted row.
  ///
  /// The returned [MaintenanceBill] will have its `id` field set.
  Future<MaintenanceBill> insertRow(
    _i1.DatabaseSession session,
    MaintenanceBill row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MaintenanceBill>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MaintenanceBill]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MaintenanceBill>> update(
    _i1.DatabaseSession session,
    List<MaintenanceBill> rows, {
    _i1.ColumnSelections<MaintenanceBillTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MaintenanceBill>(
      rows,
      columns: columns?.call(MaintenanceBill.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MaintenanceBill]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MaintenanceBill> updateRow(
    _i1.DatabaseSession session,
    MaintenanceBill row, {
    _i1.ColumnSelections<MaintenanceBillTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MaintenanceBill>(
      row,
      columns: columns?.call(MaintenanceBill.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MaintenanceBill] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<MaintenanceBill?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<MaintenanceBillUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<MaintenanceBill>(
      id,
      columnValues: columnValues(MaintenanceBill.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [MaintenanceBill]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<MaintenanceBill>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<MaintenanceBillUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<MaintenanceBillTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MaintenanceBillTable>? orderBy,
    _i1.OrderByListBuilder<MaintenanceBillTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<MaintenanceBill>(
      columnValues: columnValues(MaintenanceBill.t.updateTable),
      where: where(MaintenanceBill.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MaintenanceBill.t),
      orderByList: orderByList?.call(MaintenanceBill.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [MaintenanceBill]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MaintenanceBill>> delete(
    _i1.DatabaseSession session,
    List<MaintenanceBill> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MaintenanceBill>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MaintenanceBill].
  Future<MaintenanceBill> deleteRow(
    _i1.DatabaseSession session,
    MaintenanceBill row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MaintenanceBill>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MaintenanceBill>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<MaintenanceBillTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MaintenanceBill>(
      where: where(MaintenanceBill.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<MaintenanceBillTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MaintenanceBill>(
      where: where?.call(MaintenanceBill.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [MaintenanceBill] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<MaintenanceBillTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<MaintenanceBill>(
      where: where(MaintenanceBill.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
