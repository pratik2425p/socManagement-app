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
import '../../payment/models/payment_transaction_status.dart' as _i2;

abstract class PaymentTransaction
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PaymentTransaction._({
    this.id,
    required this.orderId,
    required this.billId,
    required this.societyId,
    this.userId,
    required this.amount,
    required this.amountPaise,
    required this.currency,
    required this.status,
    this.razorpayPaymentId,
    this.razorpaySignature,
    this.receiptNumber,
    this.idempotencyKey,
    this.failureReason,
    required this.isProcessed,
    required this.createdAt,
    this.updatedAt,
  });

  factory PaymentTransaction({
    int? id,
    required String orderId,
    required int billId,
    required int societyId,
    int? userId,
    required double amount,
    required int amountPaise,
    required String currency,
    required _i2.PaymentTransactionStatus status,
    String? razorpayPaymentId,
    String? razorpaySignature,
    String? receiptNumber,
    String? idempotencyKey,
    String? failureReason,
    required bool isProcessed,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _PaymentTransactionImpl;

  factory PaymentTransaction.fromJson(Map<String, dynamic> jsonSerialization) {
    return PaymentTransaction(
      id: jsonSerialization['id'] as int?,
      orderId: jsonSerialization['orderId'] as String,
      billId: jsonSerialization['billId'] as int,
      societyId: jsonSerialization['societyId'] as int,
      userId: jsonSerialization['userId'] as int?,
      amount: (jsonSerialization['amount'] as num).toDouble(),
      amountPaise: jsonSerialization['amountPaise'] as int,
      currency: jsonSerialization['currency'] as String,
      status: _i2.PaymentTransactionStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      razorpayPaymentId: jsonSerialization['razorpayPaymentId'] as String?,
      razorpaySignature: jsonSerialization['razorpaySignature'] as String?,
      receiptNumber: jsonSerialization['receiptNumber'] as String?,
      idempotencyKey: jsonSerialization['idempotencyKey'] as String?,
      failureReason: jsonSerialization['failureReason'] as String?,
      isProcessed: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['isProcessed'],
      ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = PaymentTransactionTable();

  static const db = PaymentTransactionRepository._();

  @override
  int? id;

  String orderId;

  int billId;

  int societyId;

  int? userId;

  double amount;

  int amountPaise;

  String currency;

  _i2.PaymentTransactionStatus status;

  String? razorpayPaymentId;

  String? razorpaySignature;

  String? receiptNumber;

  String? idempotencyKey;

  String? failureReason;

  bool isProcessed;

  DateTime createdAt;

  DateTime? updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PaymentTransaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PaymentTransaction copyWith({
    int? id,
    String? orderId,
    int? billId,
    int? societyId,
    int? userId,
    double? amount,
    int? amountPaise,
    String? currency,
    _i2.PaymentTransactionStatus? status,
    String? razorpayPaymentId,
    String? razorpaySignature,
    String? receiptNumber,
    String? idempotencyKey,
    String? failureReason,
    bool? isProcessed,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PaymentTransaction',
      if (id != null) 'id': id,
      'orderId': orderId,
      'billId': billId,
      'societyId': societyId,
      if (userId != null) 'userId': userId,
      'amount': amount,
      'amountPaise': amountPaise,
      'currency': currency,
      'status': status.toJson(),
      if (razorpayPaymentId != null) 'razorpayPaymentId': razorpayPaymentId,
      if (razorpaySignature != null) 'razorpaySignature': razorpaySignature,
      if (receiptNumber != null) 'receiptNumber': receiptNumber,
      if (idempotencyKey != null) 'idempotencyKey': idempotencyKey,
      if (failureReason != null) 'failureReason': failureReason,
      'isProcessed': isProcessed,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PaymentTransaction',
      if (id != null) 'id': id,
      'orderId': orderId,
      'billId': billId,
      'societyId': societyId,
      if (userId != null) 'userId': userId,
      'amount': amount,
      'amountPaise': amountPaise,
      'currency': currency,
      'status': status.toJson(),
      if (razorpayPaymentId != null) 'razorpayPaymentId': razorpayPaymentId,
      if (razorpaySignature != null) 'razorpaySignature': razorpaySignature,
      if (receiptNumber != null) 'receiptNumber': receiptNumber,
      if (idempotencyKey != null) 'idempotencyKey': idempotencyKey,
      if (failureReason != null) 'failureReason': failureReason,
      'isProcessed': isProcessed,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  static PaymentTransactionInclude include() {
    return PaymentTransactionInclude._();
  }

  static PaymentTransactionIncludeList includeList({
    _i1.WhereExpressionBuilder<PaymentTransactionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PaymentTransactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PaymentTransactionTable>? orderByList,
    PaymentTransactionInclude? include,
  }) {
    return PaymentTransactionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PaymentTransaction.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PaymentTransaction.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PaymentTransactionImpl extends PaymentTransaction {
  _PaymentTransactionImpl({
    int? id,
    required String orderId,
    required int billId,
    required int societyId,
    int? userId,
    required double amount,
    required int amountPaise,
    required String currency,
    required _i2.PaymentTransactionStatus status,
    String? razorpayPaymentId,
    String? razorpaySignature,
    String? receiptNumber,
    String? idempotencyKey,
    String? failureReason,
    required bool isProcessed,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         orderId: orderId,
         billId: billId,
         societyId: societyId,
         userId: userId,
         amount: amount,
         amountPaise: amountPaise,
         currency: currency,
         status: status,
         razorpayPaymentId: razorpayPaymentId,
         razorpaySignature: razorpaySignature,
         receiptNumber: receiptNumber,
         idempotencyKey: idempotencyKey,
         failureReason: failureReason,
         isProcessed: isProcessed,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [PaymentTransaction]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PaymentTransaction copyWith({
    Object? id = _Undefined,
    String? orderId,
    int? billId,
    int? societyId,
    Object? userId = _Undefined,
    double? amount,
    int? amountPaise,
    String? currency,
    _i2.PaymentTransactionStatus? status,
    Object? razorpayPaymentId = _Undefined,
    Object? razorpaySignature = _Undefined,
    Object? receiptNumber = _Undefined,
    Object? idempotencyKey = _Undefined,
    Object? failureReason = _Undefined,
    bool? isProcessed,
    DateTime? createdAt,
    Object? updatedAt = _Undefined,
  }) {
    return PaymentTransaction(
      id: id is int? ? id : this.id,
      orderId: orderId ?? this.orderId,
      billId: billId ?? this.billId,
      societyId: societyId ?? this.societyId,
      userId: userId is int? ? userId : this.userId,
      amount: amount ?? this.amount,
      amountPaise: amountPaise ?? this.amountPaise,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      razorpayPaymentId: razorpayPaymentId is String?
          ? razorpayPaymentId
          : this.razorpayPaymentId,
      razorpaySignature: razorpaySignature is String?
          ? razorpaySignature
          : this.razorpaySignature,
      receiptNumber: receiptNumber is String?
          ? receiptNumber
          : this.receiptNumber,
      idempotencyKey: idempotencyKey is String?
          ? idempotencyKey
          : this.idempotencyKey,
      failureReason: failureReason is String?
          ? failureReason
          : this.failureReason,
      isProcessed: isProcessed ?? this.isProcessed,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}

class PaymentTransactionUpdateTable
    extends _i1.UpdateTable<PaymentTransactionTable> {
  PaymentTransactionUpdateTable(super.table);

  _i1.ColumnValue<String, String> orderId(String value) => _i1.ColumnValue(
    table.orderId,
    value,
  );

  _i1.ColumnValue<int, int> billId(int value) => _i1.ColumnValue(
    table.billId,
    value,
  );

  _i1.ColumnValue<int, int> societyId(int value) => _i1.ColumnValue(
    table.societyId,
    value,
  );

  _i1.ColumnValue<int, int> userId(int? value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<double, double> amount(double value) => _i1.ColumnValue(
    table.amount,
    value,
  );

  _i1.ColumnValue<int, int> amountPaise(int value) => _i1.ColumnValue(
    table.amountPaise,
    value,
  );

  _i1.ColumnValue<String, String> currency(String value) => _i1.ColumnValue(
    table.currency,
    value,
  );

  _i1.ColumnValue<_i2.PaymentTransactionStatus, _i2.PaymentTransactionStatus>
  status(_i2.PaymentTransactionStatus value) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<String, String> razorpayPaymentId(String? value) =>
      _i1.ColumnValue(
        table.razorpayPaymentId,
        value,
      );

  _i1.ColumnValue<String, String> razorpaySignature(String? value) =>
      _i1.ColumnValue(
        table.razorpaySignature,
        value,
      );

  _i1.ColumnValue<String, String> receiptNumber(String? value) =>
      _i1.ColumnValue(
        table.receiptNumber,
        value,
      );

  _i1.ColumnValue<String, String> idempotencyKey(String? value) =>
      _i1.ColumnValue(
        table.idempotencyKey,
        value,
      );

  _i1.ColumnValue<String, String> failureReason(String? value) =>
      _i1.ColumnValue(
        table.failureReason,
        value,
      );

  _i1.ColumnValue<bool, bool> isProcessed(bool value) => _i1.ColumnValue(
    table.isProcessed,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );
}

class PaymentTransactionTable extends _i1.Table<int?> {
  PaymentTransactionTable({super.tableRelation})
    : super(tableName: 'payment_transaction') {
    updateTable = PaymentTransactionUpdateTable(this);
    orderId = _i1.ColumnString(
      'orderId',
      this,
    );
    billId = _i1.ColumnInt(
      'billId',
      this,
    );
    societyId = _i1.ColumnInt(
      'societyId',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    amount = _i1.ColumnDouble(
      'amount',
      this,
    );
    amountPaise = _i1.ColumnInt(
      'amountPaise',
      this,
    );
    currency = _i1.ColumnString(
      'currency',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
    razorpayPaymentId = _i1.ColumnString(
      'razorpayPaymentId',
      this,
    );
    razorpaySignature = _i1.ColumnString(
      'razorpaySignature',
      this,
    );
    receiptNumber = _i1.ColumnString(
      'receiptNumber',
      this,
    );
    idempotencyKey = _i1.ColumnString(
      'idempotencyKey',
      this,
    );
    failureReason = _i1.ColumnString(
      'failureReason',
      this,
    );
    isProcessed = _i1.ColumnBool(
      'isProcessed',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final PaymentTransactionUpdateTable updateTable;

  late final _i1.ColumnString orderId;

  late final _i1.ColumnInt billId;

  late final _i1.ColumnInt societyId;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnDouble amount;

  late final _i1.ColumnInt amountPaise;

  late final _i1.ColumnString currency;

  late final _i1.ColumnEnum<_i2.PaymentTransactionStatus> status;

  late final _i1.ColumnString razorpayPaymentId;

  late final _i1.ColumnString razorpaySignature;

  late final _i1.ColumnString receiptNumber;

  late final _i1.ColumnString idempotencyKey;

  late final _i1.ColumnString failureReason;

  late final _i1.ColumnBool isProcessed;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    orderId,
    billId,
    societyId,
    userId,
    amount,
    amountPaise,
    currency,
    status,
    razorpayPaymentId,
    razorpaySignature,
    receiptNumber,
    idempotencyKey,
    failureReason,
    isProcessed,
    createdAt,
    updatedAt,
  ];
}

class PaymentTransactionInclude extends _i1.IncludeObject {
  PaymentTransactionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => PaymentTransaction.t;
}

class PaymentTransactionIncludeList extends _i1.IncludeList {
  PaymentTransactionIncludeList._({
    _i1.WhereExpressionBuilder<PaymentTransactionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PaymentTransaction.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PaymentTransaction.t;
}

class PaymentTransactionRepository {
  const PaymentTransactionRepository._();

  /// Returns a list of [PaymentTransaction]s matching the given query parameters.
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
  Future<List<PaymentTransaction>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PaymentTransactionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PaymentTransactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PaymentTransactionTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<PaymentTransaction>(
      where: where?.call(PaymentTransaction.t),
      orderBy: orderBy?.call(PaymentTransaction.t),
      orderByList: orderByList?.call(PaymentTransaction.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [PaymentTransaction] matching the given query parameters.
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
  Future<PaymentTransaction?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PaymentTransactionTable>? where,
    int? offset,
    _i1.OrderByBuilder<PaymentTransactionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PaymentTransactionTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<PaymentTransaction>(
      where: where?.call(PaymentTransaction.t),
      orderBy: orderBy?.call(PaymentTransaction.t),
      orderByList: orderByList?.call(PaymentTransaction.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [PaymentTransaction] by its [id] or null if no such row exists.
  Future<PaymentTransaction?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<PaymentTransaction>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [PaymentTransaction]s in the list and returns the inserted rows.
  ///
  /// The returned [PaymentTransaction]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<PaymentTransaction>> insert(
    _i1.DatabaseSession session,
    List<PaymentTransaction> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<PaymentTransaction>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [PaymentTransaction] and returns the inserted row.
  ///
  /// The returned [PaymentTransaction] will have its `id` field set.
  Future<PaymentTransaction> insertRow(
    _i1.DatabaseSession session,
    PaymentTransaction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PaymentTransaction>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PaymentTransaction]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PaymentTransaction>> update(
    _i1.DatabaseSession session,
    List<PaymentTransaction> rows, {
    _i1.ColumnSelections<PaymentTransactionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PaymentTransaction>(
      rows,
      columns: columns?.call(PaymentTransaction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PaymentTransaction]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PaymentTransaction> updateRow(
    _i1.DatabaseSession session,
    PaymentTransaction row, {
    _i1.ColumnSelections<PaymentTransactionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PaymentTransaction>(
      row,
      columns: columns?.call(PaymentTransaction.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PaymentTransaction] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PaymentTransaction?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<PaymentTransactionUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PaymentTransaction>(
      id,
      columnValues: columnValues(PaymentTransaction.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PaymentTransaction]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PaymentTransaction>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<PaymentTransactionUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<PaymentTransactionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PaymentTransactionTable>? orderBy,
    _i1.OrderByListBuilder<PaymentTransactionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PaymentTransaction>(
      columnValues: columnValues(PaymentTransaction.t.updateTable),
      where: where(PaymentTransaction.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PaymentTransaction.t),
      orderByList: orderByList?.call(PaymentTransaction.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PaymentTransaction]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PaymentTransaction>> delete(
    _i1.DatabaseSession session,
    List<PaymentTransaction> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PaymentTransaction>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PaymentTransaction].
  Future<PaymentTransaction> deleteRow(
    _i1.DatabaseSession session,
    PaymentTransaction row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PaymentTransaction>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PaymentTransaction>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<PaymentTransactionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PaymentTransaction>(
      where: where(PaymentTransaction.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PaymentTransactionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PaymentTransaction>(
      where: where?.call(PaymentTransaction.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [PaymentTransaction] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<PaymentTransactionTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<PaymentTransaction>(
      where: where(PaymentTransaction.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
