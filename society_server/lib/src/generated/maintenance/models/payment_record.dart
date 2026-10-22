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

abstract class PaymentRecord
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PaymentRecord._({
    this.id,
    required this.societyId,
    required this.billId,
    required this.flatId,
    required this.flatNumber,
    required this.payerName,
    required this.amount,
    required this.paymentMethod,
    required this.transactionReference,
    required this.receiptNumber,
    required this.paymentDate,
    required this.isVerified,
  });

  factory PaymentRecord({
    int? id,
    required int societyId,
    required int billId,
    required int flatId,
    required String flatNumber,
    required String payerName,
    required double amount,
    required String paymentMethod,
    required String transactionReference,
    required String receiptNumber,
    required DateTime paymentDate,
    required bool isVerified,
  }) = _PaymentRecordImpl;

  factory PaymentRecord.fromJson(Map<String, dynamic> jsonSerialization) {
    return PaymentRecord(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      billId: jsonSerialization['billId'] as int,
      flatId: jsonSerialization['flatId'] as int,
      flatNumber: jsonSerialization['flatNumber'] as String,
      payerName: jsonSerialization['payerName'] as String,
      amount: (jsonSerialization['amount'] as num).toDouble(),
      paymentMethod: jsonSerialization['paymentMethod'] as String,
      transactionReference: jsonSerialization['transactionReference'] as String,
      receiptNumber: jsonSerialization['receiptNumber'] as String,
      paymentDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['paymentDate'],
      ),
      isVerified: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['isVerified'],
      ),
    );
  }

  static final t = PaymentRecordTable();

  static const db = PaymentRecordRepository._();

  @override
  int? id;

  int societyId;

  int billId;

  int flatId;

  String flatNumber;

  String payerName;

  double amount;

  String paymentMethod;

  String transactionReference;

  String receiptNumber;

  DateTime paymentDate;

  bool isVerified;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PaymentRecord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PaymentRecord copyWith({
    int? id,
    int? societyId,
    int? billId,
    int? flatId,
    String? flatNumber,
    String? payerName,
    double? amount,
    String? paymentMethod,
    String? transactionReference,
    String? receiptNumber,
    DateTime? paymentDate,
    bool? isVerified,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PaymentRecord',
      if (id != null) 'id': id,
      'societyId': societyId,
      'billId': billId,
      'flatId': flatId,
      'flatNumber': flatNumber,
      'payerName': payerName,
      'amount': amount,
      'paymentMethod': paymentMethod,
      'transactionReference': transactionReference,
      'receiptNumber': receiptNumber,
      'paymentDate': paymentDate.toJson(),
      'isVerified': isVerified,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PaymentRecord',
      if (id != null) 'id': id,
      'societyId': societyId,
      'billId': billId,
      'flatId': flatId,
      'flatNumber': flatNumber,
      'payerName': payerName,
      'amount': amount,
      'paymentMethod': paymentMethod,
      'transactionReference': transactionReference,
      'receiptNumber': receiptNumber,
      'paymentDate': paymentDate.toJson(),
      'isVerified': isVerified,
    };
  }

  static PaymentRecordInclude include() {
    return PaymentRecordInclude._();
  }

  static PaymentRecordIncludeList includeList({
    _i1.WhereExpressionBuilder<PaymentRecordTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PaymentRecordTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PaymentRecordTable>? orderByList,
    PaymentRecordInclude? include,
  }) {
    return PaymentRecordIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PaymentRecord.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PaymentRecord.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PaymentRecordImpl extends PaymentRecord {
  _PaymentRecordImpl({
    int? id,
    required int societyId,
    required int billId,
    required int flatId,
    required String flatNumber,
    required String payerName,
    required double amount,
    required String paymentMethod,
    required String transactionReference,
    required String receiptNumber,
    required DateTime paymentDate,
    required bool isVerified,
  }) : super._(
         id: id,
         societyId: societyId,
         billId: billId,
         flatId: flatId,
         flatNumber: flatNumber,
         payerName: payerName,
         amount: amount,
         paymentMethod: paymentMethod,
         transactionReference: transactionReference,
         receiptNumber: receiptNumber,
         paymentDate: paymentDate,
         isVerified: isVerified,
       );

  /// Returns a shallow copy of this [PaymentRecord]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PaymentRecord copyWith({
    Object? id = _Undefined,
    int? societyId,
    int? billId,
    int? flatId,
    String? flatNumber,
    String? payerName,
    double? amount,
    String? paymentMethod,
    String? transactionReference,
    String? receiptNumber,
    DateTime? paymentDate,
    bool? isVerified,
  }) {
    return PaymentRecord(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      billId: billId ?? this.billId,
      flatId: flatId ?? this.flatId,
      flatNumber: flatNumber ?? this.flatNumber,
      payerName: payerName ?? this.payerName,
      amount: amount ?? this.amount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      transactionReference: transactionReference ?? this.transactionReference,
      receiptNumber: receiptNumber ?? this.receiptNumber,
      paymentDate: paymentDate ?? this.paymentDate,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}

class PaymentRecordUpdateTable extends _i1.UpdateTable<PaymentRecordTable> {
  PaymentRecordUpdateTable(super.table);

  _i1.ColumnValue<int, int> societyId(int value) => _i1.ColumnValue(
    table.societyId,
    value,
  );

  _i1.ColumnValue<int, int> billId(int value) => _i1.ColumnValue(
    table.billId,
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

  _i1.ColumnValue<String, String> payerName(String value) => _i1.ColumnValue(
    table.payerName,
    value,
  );

  _i1.ColumnValue<double, double> amount(double value) => _i1.ColumnValue(
    table.amount,
    value,
  );

  _i1.ColumnValue<String, String> paymentMethod(String value) =>
      _i1.ColumnValue(
        table.paymentMethod,
        value,
      );

  _i1.ColumnValue<String, String> transactionReference(String value) =>
      _i1.ColumnValue(
        table.transactionReference,
        value,
      );

  _i1.ColumnValue<String, String> receiptNumber(String value) =>
      _i1.ColumnValue(
        table.receiptNumber,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> paymentDate(DateTime value) =>
      _i1.ColumnValue(
        table.paymentDate,
        value,
      );

  _i1.ColumnValue<bool, bool> isVerified(bool value) => _i1.ColumnValue(
    table.isVerified,
    value,
  );
}

class PaymentRecordTable extends _i1.Table<int?> {
  PaymentRecordTable({super.tableRelation})
    : super(tableName: 'payment_record') {
    updateTable = PaymentRecordUpdateTable(this);
    societyId = _i1.ColumnInt(
      'societyId',
      this,
    );
    billId = _i1.ColumnInt(
      'billId',
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
    payerName = _i1.ColumnString(
      'payerName',
      this,
    );
    amount = _i1.ColumnDouble(
      'amount',
      this,
    );
    paymentMethod = _i1.ColumnString(
      'paymentMethod',
      this,
    );
    transactionReference = _i1.ColumnString(
      'transactionReference',
      this,
    );
    receiptNumber = _i1.ColumnString(
      'receiptNumber',
      this,
    );
    paymentDate = _i1.ColumnDateTime(
      'paymentDate',
      this,
    );
    isVerified = _i1.ColumnBool(
      'isVerified',
      this,
    );
  }

  late final PaymentRecordUpdateTable updateTable;

  late final _i1.ColumnInt societyId;

  late final _i1.ColumnInt billId;

  late final _i1.ColumnInt flatId;

  late final _i1.ColumnString flatNumber;

  late final _i1.ColumnString payerName;

  late final _i1.ColumnDouble amount;

  late final _i1.ColumnString paymentMethod;

  late final _i1.ColumnString transactionReference;

  late final _i1.ColumnString receiptNumber;

  late final _i1.ColumnDateTime paymentDate;

  late final _i1.ColumnBool isVerified;

  @override
  List<_i1.Column> get columns => [
    id,
    societyId,
    billId,
    flatId,
    flatNumber,
    payerName,
    amount,
    paymentMethod,
    transactionReference,
    receiptNumber,
    paymentDate,
    isVerified,
  ];
}

class PaymentRecordInclude extends _i1.IncludeObject {
  PaymentRecordInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => PaymentRecord.t;
}

class PaymentRecordIncludeList extends _i1.IncludeList {
  PaymentRecordIncludeList._({
    _i1.WhereExpressionBuilder<PaymentRecordTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PaymentRecord.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PaymentRecord.t;
}

class PaymentRecordRepository {
  const PaymentRecordRepository._();

  /// Returns a list of [PaymentRecord]s matching the given query parameters.
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
  Future<List<PaymentRecord>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PaymentRecordTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PaymentRecordTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PaymentRecordTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<PaymentRecord>(
      where: where?.call(PaymentRecord.t),
      orderBy: orderBy?.call(PaymentRecord.t),
      orderByList: orderByList?.call(PaymentRecord.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [PaymentRecord] matching the given query parameters.
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
  Future<PaymentRecord?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PaymentRecordTable>? where,
    int? offset,
    _i1.OrderByBuilder<PaymentRecordTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PaymentRecordTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<PaymentRecord>(
      where: where?.call(PaymentRecord.t),
      orderBy: orderBy?.call(PaymentRecord.t),
      orderByList: orderByList?.call(PaymentRecord.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [PaymentRecord] by its [id] or null if no such row exists.
  Future<PaymentRecord?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<PaymentRecord>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [PaymentRecord]s in the list and returns the inserted rows.
  ///
  /// The returned [PaymentRecord]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<PaymentRecord>> insert(
    _i1.DatabaseSession session,
    List<PaymentRecord> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<PaymentRecord>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [PaymentRecord] and returns the inserted row.
  ///
  /// The returned [PaymentRecord] will have its `id` field set.
  Future<PaymentRecord> insertRow(
    _i1.DatabaseSession session,
    PaymentRecord row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PaymentRecord>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PaymentRecord]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PaymentRecord>> update(
    _i1.DatabaseSession session,
    List<PaymentRecord> rows, {
    _i1.ColumnSelections<PaymentRecordTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PaymentRecord>(
      rows,
      columns: columns?.call(PaymentRecord.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PaymentRecord]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PaymentRecord> updateRow(
    _i1.DatabaseSession session,
    PaymentRecord row, {
    _i1.ColumnSelections<PaymentRecordTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PaymentRecord>(
      row,
      columns: columns?.call(PaymentRecord.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PaymentRecord] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PaymentRecord?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<PaymentRecordUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PaymentRecord>(
      id,
      columnValues: columnValues(PaymentRecord.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PaymentRecord]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PaymentRecord>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<PaymentRecordUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<PaymentRecordTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PaymentRecordTable>? orderBy,
    _i1.OrderByListBuilder<PaymentRecordTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PaymentRecord>(
      columnValues: columnValues(PaymentRecord.t.updateTable),
      where: where(PaymentRecord.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PaymentRecord.t),
      orderByList: orderByList?.call(PaymentRecord.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PaymentRecord]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PaymentRecord>> delete(
    _i1.DatabaseSession session,
    List<PaymentRecord> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PaymentRecord>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PaymentRecord].
  Future<PaymentRecord> deleteRow(
    _i1.DatabaseSession session,
    PaymentRecord row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PaymentRecord>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PaymentRecord>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<PaymentRecordTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PaymentRecord>(
      where: where(PaymentRecord.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PaymentRecordTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PaymentRecord>(
      where: where?.call(PaymentRecord.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [PaymentRecord] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<PaymentRecordTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<PaymentRecord>(
      where: where(PaymentRecord.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
