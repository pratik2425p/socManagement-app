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
import '../../accounting/models/voucher_status.dart' as _i2;

abstract class VoucherRequest
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  VoucherRequest._({
    this.id,
    required this.societyId,
    required this.voucherNumber,
    required this.title,
    required this.description,
    required this.amount,
    required this.category,
    required this.requestedByName,
    required this.status,
    this.rejectionReason,
    this.approvedByName,
    this.approvedAt,
    required this.createdAt,
  });

  factory VoucherRequest({
    int? id,
    required int societyId,
    required String voucherNumber,
    required String title,
    required String description,
    required double amount,
    required String category,
    required String requestedByName,
    required _i2.VoucherStatus status,
    String? rejectionReason,
    String? approvedByName,
    DateTime? approvedAt,
    required DateTime createdAt,
  }) = _VoucherRequestImpl;

  factory VoucherRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return VoucherRequest(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      voucherNumber: jsonSerialization['voucherNumber'] as String,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      amount: (jsonSerialization['amount'] as num).toDouble(),
      category: jsonSerialization['category'] as String,
      requestedByName: jsonSerialization['requestedByName'] as String,
      status: _i2.VoucherStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      rejectionReason: jsonSerialization['rejectionReason'] as String?,
      approvedByName: jsonSerialization['approvedByName'] as String?,
      approvedAt: jsonSerialization['approvedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['approvedAt']),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = VoucherRequestTable();

  static const db = VoucherRequestRepository._();

  @override
  int? id;

  int societyId;

  String voucherNumber;

  String title;

  String description;

  double amount;

  String category;

  String requestedByName;

  _i2.VoucherStatus status;

  String? rejectionReason;

  String? approvedByName;

  DateTime? approvedAt;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [VoucherRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VoucherRequest copyWith({
    int? id,
    int? societyId,
    String? voucherNumber,
    String? title,
    String? description,
    double? amount,
    String? category,
    String? requestedByName,
    _i2.VoucherStatus? status,
    String? rejectionReason,
    String? approvedByName,
    DateTime? approvedAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VoucherRequest',
      if (id != null) 'id': id,
      'societyId': societyId,
      'voucherNumber': voucherNumber,
      'title': title,
      'description': description,
      'amount': amount,
      'category': category,
      'requestedByName': requestedByName,
      'status': status.toJson(),
      if (rejectionReason != null) 'rejectionReason': rejectionReason,
      if (approvedByName != null) 'approvedByName': approvedByName,
      if (approvedAt != null) 'approvedAt': approvedAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'VoucherRequest',
      if (id != null) 'id': id,
      'societyId': societyId,
      'voucherNumber': voucherNumber,
      'title': title,
      'description': description,
      'amount': amount,
      'category': category,
      'requestedByName': requestedByName,
      'status': status.toJson(),
      if (rejectionReason != null) 'rejectionReason': rejectionReason,
      if (approvedByName != null) 'approvedByName': approvedByName,
      if (approvedAt != null) 'approvedAt': approvedAt?.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static VoucherRequestInclude include() {
    return VoucherRequestInclude._();
  }

  static VoucherRequestIncludeList includeList({
    _i1.WhereExpressionBuilder<VoucherRequestTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VoucherRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VoucherRequestTable>? orderByList,
    VoucherRequestInclude? include,
  }) {
    return VoucherRequestIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(VoucherRequest.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(VoucherRequest.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VoucherRequestImpl extends VoucherRequest {
  _VoucherRequestImpl({
    int? id,
    required int societyId,
    required String voucherNumber,
    required String title,
    required String description,
    required double amount,
    required String category,
    required String requestedByName,
    required _i2.VoucherStatus status,
    String? rejectionReason,
    String? approvedByName,
    DateTime? approvedAt,
    required DateTime createdAt,
  }) : super._(
         id: id,
         societyId: societyId,
         voucherNumber: voucherNumber,
         title: title,
         description: description,
         amount: amount,
         category: category,
         requestedByName: requestedByName,
         status: status,
         rejectionReason: rejectionReason,
         approvedByName: approvedByName,
         approvedAt: approvedAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [VoucherRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VoucherRequest copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? voucherNumber,
    String? title,
    String? description,
    double? amount,
    String? category,
    String? requestedByName,
    _i2.VoucherStatus? status,
    Object? rejectionReason = _Undefined,
    Object? approvedByName = _Undefined,
    Object? approvedAt = _Undefined,
    DateTime? createdAt,
  }) {
    return VoucherRequest(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      voucherNumber: voucherNumber ?? this.voucherNumber,
      title: title ?? this.title,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      requestedByName: requestedByName ?? this.requestedByName,
      status: status ?? this.status,
      rejectionReason: rejectionReason is String?
          ? rejectionReason
          : this.rejectionReason,
      approvedByName: approvedByName is String?
          ? approvedByName
          : this.approvedByName,
      approvedAt: approvedAt is DateTime? ? approvedAt : this.approvedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class VoucherRequestUpdateTable extends _i1.UpdateTable<VoucherRequestTable> {
  VoucherRequestUpdateTable(super.table);

  _i1.ColumnValue<int, int> societyId(int value) => _i1.ColumnValue(
    table.societyId,
    value,
  );

  _i1.ColumnValue<String, String> voucherNumber(String value) =>
      _i1.ColumnValue(
        table.voucherNumber,
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

  _i1.ColumnValue<double, double> amount(double value) => _i1.ColumnValue(
    table.amount,
    value,
  );

  _i1.ColumnValue<String, String> category(String value) => _i1.ColumnValue(
    table.category,
    value,
  );

  _i1.ColumnValue<String, String> requestedByName(String value) =>
      _i1.ColumnValue(
        table.requestedByName,
        value,
      );

  _i1.ColumnValue<_i2.VoucherStatus, _i2.VoucherStatus> status(
    _i2.VoucherStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<String, String> rejectionReason(String? value) =>
      _i1.ColumnValue(
        table.rejectionReason,
        value,
      );

  _i1.ColumnValue<String, String> approvedByName(String? value) =>
      _i1.ColumnValue(
        table.approvedByName,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> approvedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.approvedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class VoucherRequestTable extends _i1.Table<int?> {
  VoucherRequestTable({super.tableRelation})
    : super(tableName: 'voucher_request') {
    updateTable = VoucherRequestUpdateTable(this);
    societyId = _i1.ColumnInt(
      'societyId',
      this,
    );
    voucherNumber = _i1.ColumnString(
      'voucherNumber',
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
    amount = _i1.ColumnDouble(
      'amount',
      this,
    );
    category = _i1.ColumnString(
      'category',
      this,
    );
    requestedByName = _i1.ColumnString(
      'requestedByName',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
    rejectionReason = _i1.ColumnString(
      'rejectionReason',
      this,
    );
    approvedByName = _i1.ColumnString(
      'approvedByName',
      this,
    );
    approvedAt = _i1.ColumnDateTime(
      'approvedAt',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final VoucherRequestUpdateTable updateTable;

  late final _i1.ColumnInt societyId;

  late final _i1.ColumnString voucherNumber;

  late final _i1.ColumnString title;

  late final _i1.ColumnString description;

  late final _i1.ColumnDouble amount;

  late final _i1.ColumnString category;

  late final _i1.ColumnString requestedByName;

  late final _i1.ColumnEnum<_i2.VoucherStatus> status;

  late final _i1.ColumnString rejectionReason;

  late final _i1.ColumnString approvedByName;

  late final _i1.ColumnDateTime approvedAt;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    societyId,
    voucherNumber,
    title,
    description,
    amount,
    category,
    requestedByName,
    status,
    rejectionReason,
    approvedByName,
    approvedAt,
    createdAt,
  ];
}

class VoucherRequestInclude extends _i1.IncludeObject {
  VoucherRequestInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => VoucherRequest.t;
}

class VoucherRequestIncludeList extends _i1.IncludeList {
  VoucherRequestIncludeList._({
    _i1.WhereExpressionBuilder<VoucherRequestTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(VoucherRequest.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => VoucherRequest.t;
}

class VoucherRequestRepository {
  const VoucherRequestRepository._();

  /// Returns a list of [VoucherRequest]s matching the given query parameters.
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
  Future<List<VoucherRequest>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<VoucherRequestTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VoucherRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VoucherRequestTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<VoucherRequest>(
      where: where?.call(VoucherRequest.t),
      orderBy: orderBy?.call(VoucherRequest.t),
      orderByList: orderByList?.call(VoucherRequest.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [VoucherRequest] matching the given query parameters.
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
  Future<VoucherRequest?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<VoucherRequestTable>? where,
    int? offset,
    _i1.OrderByBuilder<VoucherRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VoucherRequestTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<VoucherRequest>(
      where: where?.call(VoucherRequest.t),
      orderBy: orderBy?.call(VoucherRequest.t),
      orderByList: orderByList?.call(VoucherRequest.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [VoucherRequest] by its [id] or null if no such row exists.
  Future<VoucherRequest?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<VoucherRequest>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [VoucherRequest]s in the list and returns the inserted rows.
  ///
  /// The returned [VoucherRequest]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<VoucherRequest>> insert(
    _i1.DatabaseSession session,
    List<VoucherRequest> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<VoucherRequest>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [VoucherRequest] and returns the inserted row.
  ///
  /// The returned [VoucherRequest] will have its `id` field set.
  Future<VoucherRequest> insertRow(
    _i1.DatabaseSession session,
    VoucherRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<VoucherRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [VoucherRequest]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<VoucherRequest>> update(
    _i1.DatabaseSession session,
    List<VoucherRequest> rows, {
    _i1.ColumnSelections<VoucherRequestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<VoucherRequest>(
      rows,
      columns: columns?.call(VoucherRequest.t),
      transaction: transaction,
    );
  }

  /// Updates a single [VoucherRequest]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<VoucherRequest> updateRow(
    _i1.DatabaseSession session,
    VoucherRequest row, {
    _i1.ColumnSelections<VoucherRequestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<VoucherRequest>(
      row,
      columns: columns?.call(VoucherRequest.t),
      transaction: transaction,
    );
  }

  /// Updates a single [VoucherRequest] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<VoucherRequest?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<VoucherRequestUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<VoucherRequest>(
      id,
      columnValues: columnValues(VoucherRequest.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [VoucherRequest]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<VoucherRequest>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<VoucherRequestUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<VoucherRequestTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VoucherRequestTable>? orderBy,
    _i1.OrderByListBuilder<VoucherRequestTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<VoucherRequest>(
      columnValues: columnValues(VoucherRequest.t.updateTable),
      where: where(VoucherRequest.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(VoucherRequest.t),
      orderByList: orderByList?.call(VoucherRequest.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [VoucherRequest]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<VoucherRequest>> delete(
    _i1.DatabaseSession session,
    List<VoucherRequest> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<VoucherRequest>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [VoucherRequest].
  Future<VoucherRequest> deleteRow(
    _i1.DatabaseSession session,
    VoucherRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<VoucherRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<VoucherRequest>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<VoucherRequestTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<VoucherRequest>(
      where: where(VoucherRequest.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<VoucherRequestTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<VoucherRequest>(
      where: where?.call(VoucherRequest.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [VoucherRequest] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<VoucherRequestTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<VoucherRequest>(
      where: where(VoucherRequest.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
