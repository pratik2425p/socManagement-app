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
import '../../tenancy/models/noc_status.dart' as _i2;

abstract class TenantNoc
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  TenantNoc._({
    this.id,
    required this.societyId,
    required this.flatNumber,
    required this.ownerName,
    required this.ownerPhone,
    required this.tenantName,
    required this.tenantPhone,
    required this.leaseStart,
    required this.leaseEnd,
    required this.monthlyRent,
    required this.nocNumber,
    required this.status,
    this.resolutionNotes,
    required this.issuedAt,
    this.resolvedAt,
    this.documentPath,
    this.documentUrl,
  });

  factory TenantNoc({
    int? id,
    required int societyId,
    required String flatNumber,
    required String ownerName,
    required String ownerPhone,
    required String tenantName,
    required String tenantPhone,
    required DateTime leaseStart,
    required DateTime leaseEnd,
    required double monthlyRent,
    required String nocNumber,
    required _i2.NocStatus status,
    String? resolutionNotes,
    required DateTime issuedAt,
    DateTime? resolvedAt,
    String? documentPath,
    String? documentUrl,
  }) = _TenantNocImpl;

  factory TenantNoc.fromJson(Map<String, dynamic> jsonSerialization) {
    return TenantNoc(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      flatNumber: jsonSerialization['flatNumber'] as String,
      ownerName: jsonSerialization['ownerName'] as String,
      ownerPhone: jsonSerialization['ownerPhone'] as String,
      tenantName: jsonSerialization['tenantName'] as String,
      tenantPhone: jsonSerialization['tenantPhone'] as String,
      leaseStart: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['leaseStart'],
      ),
      leaseEnd: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['leaseEnd'],
      ),
      monthlyRent: (jsonSerialization['monthlyRent'] as num).toDouble(),
      nocNumber: jsonSerialization['nocNumber'] as String,
      status: _i2.NocStatus.fromJson((jsonSerialization['status'] as String)),
      resolutionNotes: jsonSerialization['resolutionNotes'] as String?,
      issuedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['issuedAt'],
      ),
      resolvedAt: jsonSerialization['resolvedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['resolvedAt']),
      documentPath: jsonSerialization['documentPath'] as String?,
      documentUrl: jsonSerialization['documentUrl'] as String?,
    );
  }

  static final t = TenantNocTable();

  static const db = TenantNocRepository._();

  @override
  int? id;

  int societyId;

  String flatNumber;

  String ownerName;

  String ownerPhone;

  String tenantName;

  String tenantPhone;

  DateTime leaseStart;

  DateTime leaseEnd;

  double monthlyRent;

  String nocNumber;

  _i2.NocStatus status;

  String? resolutionNotes;

  DateTime issuedAt;

  DateTime? resolvedAt;

  String? documentPath;

  String? documentUrl;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [TenantNoc]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TenantNoc copyWith({
    int? id,
    int? societyId,
    String? flatNumber,
    String? ownerName,
    String? ownerPhone,
    String? tenantName,
    String? tenantPhone,
    DateTime? leaseStart,
    DateTime? leaseEnd,
    double? monthlyRent,
    String? nocNumber,
    _i2.NocStatus? status,
    String? resolutionNotes,
    DateTime? issuedAt,
    DateTime? resolvedAt,
    String? documentPath,
    String? documentUrl,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TenantNoc',
      if (id != null) 'id': id,
      'societyId': societyId,
      'flatNumber': flatNumber,
      'ownerName': ownerName,
      'ownerPhone': ownerPhone,
      'tenantName': tenantName,
      'tenantPhone': tenantPhone,
      'leaseStart': leaseStart.toJson(),
      'leaseEnd': leaseEnd.toJson(),
      'monthlyRent': monthlyRent,
      'nocNumber': nocNumber,
      'status': status.toJson(),
      if (resolutionNotes != null) 'resolutionNotes': resolutionNotes,
      'issuedAt': issuedAt.toJson(),
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
      if (documentPath != null) 'documentPath': documentPath,
      if (documentUrl != null) 'documentUrl': documentUrl,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TenantNoc',
      if (id != null) 'id': id,
      'societyId': societyId,
      'flatNumber': flatNumber,
      'ownerName': ownerName,
      'ownerPhone': ownerPhone,
      'tenantName': tenantName,
      'tenantPhone': tenantPhone,
      'leaseStart': leaseStart.toJson(),
      'leaseEnd': leaseEnd.toJson(),
      'monthlyRent': monthlyRent,
      'nocNumber': nocNumber,
      'status': status.toJson(),
      if (resolutionNotes != null) 'resolutionNotes': resolutionNotes,
      'issuedAt': issuedAt.toJson(),
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
      if (documentPath != null) 'documentPath': documentPath,
      if (documentUrl != null) 'documentUrl': documentUrl,
    };
  }

  static TenantNocInclude include() {
    return TenantNocInclude._();
  }

  static TenantNocIncludeList includeList({
    _i1.WhereExpressionBuilder<TenantNocTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TenantNocTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TenantNocTable>? orderByList,
    TenantNocInclude? include,
  }) {
    return TenantNocIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TenantNoc.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TenantNoc.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TenantNocImpl extends TenantNoc {
  _TenantNocImpl({
    int? id,
    required int societyId,
    required String flatNumber,
    required String ownerName,
    required String ownerPhone,
    required String tenantName,
    required String tenantPhone,
    required DateTime leaseStart,
    required DateTime leaseEnd,
    required double monthlyRent,
    required String nocNumber,
    required _i2.NocStatus status,
    String? resolutionNotes,
    required DateTime issuedAt,
    DateTime? resolvedAt,
    String? documentPath,
    String? documentUrl,
  }) : super._(
         id: id,
         societyId: societyId,
         flatNumber: flatNumber,
         ownerName: ownerName,
         ownerPhone: ownerPhone,
         tenantName: tenantName,
         tenantPhone: tenantPhone,
         leaseStart: leaseStart,
         leaseEnd: leaseEnd,
         monthlyRent: monthlyRent,
         nocNumber: nocNumber,
         status: status,
         resolutionNotes: resolutionNotes,
         issuedAt: issuedAt,
         resolvedAt: resolvedAt,
         documentPath: documentPath,
         documentUrl: documentUrl,
       );

  /// Returns a shallow copy of this [TenantNoc]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TenantNoc copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? flatNumber,
    String? ownerName,
    String? ownerPhone,
    String? tenantName,
    String? tenantPhone,
    DateTime? leaseStart,
    DateTime? leaseEnd,
    double? monthlyRent,
    String? nocNumber,
    _i2.NocStatus? status,
    Object? resolutionNotes = _Undefined,
    DateTime? issuedAt,
    Object? resolvedAt = _Undefined,
    Object? documentPath = _Undefined,
    Object? documentUrl = _Undefined,
  }) {
    return TenantNoc(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      flatNumber: flatNumber ?? this.flatNumber,
      ownerName: ownerName ?? this.ownerName,
      ownerPhone: ownerPhone ?? this.ownerPhone,
      tenantName: tenantName ?? this.tenantName,
      tenantPhone: tenantPhone ?? this.tenantPhone,
      leaseStart: leaseStart ?? this.leaseStart,
      leaseEnd: leaseEnd ?? this.leaseEnd,
      monthlyRent: monthlyRent ?? this.monthlyRent,
      nocNumber: nocNumber ?? this.nocNumber,
      status: status ?? this.status,
      resolutionNotes: resolutionNotes is String?
          ? resolutionNotes
          : this.resolutionNotes,
      issuedAt: issuedAt ?? this.issuedAt,
      resolvedAt: resolvedAt is DateTime? ? resolvedAt : this.resolvedAt,
      documentPath: documentPath is String? ? documentPath : this.documentPath,
      documentUrl: documentUrl is String? ? documentUrl : this.documentUrl,
    );
  }
}

class TenantNocUpdateTable extends _i1.UpdateTable<TenantNocTable> {
  TenantNocUpdateTable(super.table);

  _i1.ColumnValue<int, int> societyId(int value) => _i1.ColumnValue(
    table.societyId,
    value,
  );

  _i1.ColumnValue<String, String> flatNumber(String value) => _i1.ColumnValue(
    table.flatNumber,
    value,
  );

  _i1.ColumnValue<String, String> ownerName(String value) => _i1.ColumnValue(
    table.ownerName,
    value,
  );

  _i1.ColumnValue<String, String> ownerPhone(String value) => _i1.ColumnValue(
    table.ownerPhone,
    value,
  );

  _i1.ColumnValue<String, String> tenantName(String value) => _i1.ColumnValue(
    table.tenantName,
    value,
  );

  _i1.ColumnValue<String, String> tenantPhone(String value) => _i1.ColumnValue(
    table.tenantPhone,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> leaseStart(DateTime value) =>
      _i1.ColumnValue(
        table.leaseStart,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> leaseEnd(DateTime value) =>
      _i1.ColumnValue(
        table.leaseEnd,
        value,
      );

  _i1.ColumnValue<double, double> monthlyRent(double value) => _i1.ColumnValue(
    table.monthlyRent,
    value,
  );

  _i1.ColumnValue<String, String> nocNumber(String value) => _i1.ColumnValue(
    table.nocNumber,
    value,
  );

  _i1.ColumnValue<_i2.NocStatus, _i2.NocStatus> status(_i2.NocStatus value) =>
      _i1.ColumnValue(
        table.status,
        value,
      );

  _i1.ColumnValue<String, String> resolutionNotes(String? value) =>
      _i1.ColumnValue(
        table.resolutionNotes,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> issuedAt(DateTime value) =>
      _i1.ColumnValue(
        table.issuedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> resolvedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.resolvedAt,
        value,
      );

  _i1.ColumnValue<String, String> documentPath(String? value) =>
      _i1.ColumnValue(
        table.documentPath,
        value,
      );

  _i1.ColumnValue<String, String> documentUrl(String? value) => _i1.ColumnValue(
    table.documentUrl,
    value,
  );
}

class TenantNocTable extends _i1.Table<int?> {
  TenantNocTable({super.tableRelation}) : super(tableName: 'tenant_noc') {
    updateTable = TenantNocUpdateTable(this);
    societyId = _i1.ColumnInt(
      'societyId',
      this,
    );
    flatNumber = _i1.ColumnString(
      'flatNumber',
      this,
    );
    ownerName = _i1.ColumnString(
      'ownerName',
      this,
    );
    ownerPhone = _i1.ColumnString(
      'ownerPhone',
      this,
    );
    tenantName = _i1.ColumnString(
      'tenantName',
      this,
    );
    tenantPhone = _i1.ColumnString(
      'tenantPhone',
      this,
    );
    leaseStart = _i1.ColumnDateTime(
      'leaseStart',
      this,
    );
    leaseEnd = _i1.ColumnDateTime(
      'leaseEnd',
      this,
    );
    monthlyRent = _i1.ColumnDouble(
      'monthlyRent',
      this,
    );
    nocNumber = _i1.ColumnString(
      'nocNumber',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
    resolutionNotes = _i1.ColumnString(
      'resolutionNotes',
      this,
    );
    issuedAt = _i1.ColumnDateTime(
      'issuedAt',
      this,
    );
    resolvedAt = _i1.ColumnDateTime(
      'resolvedAt',
      this,
    );
    documentPath = _i1.ColumnString(
      'documentPath',
      this,
    );
    documentUrl = _i1.ColumnString(
      'documentUrl',
      this,
    );
  }

  late final TenantNocUpdateTable updateTable;

  late final _i1.ColumnInt societyId;

  late final _i1.ColumnString flatNumber;

  late final _i1.ColumnString ownerName;

  late final _i1.ColumnString ownerPhone;

  late final _i1.ColumnString tenantName;

  late final _i1.ColumnString tenantPhone;

  late final _i1.ColumnDateTime leaseStart;

  late final _i1.ColumnDateTime leaseEnd;

  late final _i1.ColumnDouble monthlyRent;

  late final _i1.ColumnString nocNumber;

  late final _i1.ColumnEnum<_i2.NocStatus> status;

  late final _i1.ColumnString resolutionNotes;

  late final _i1.ColumnDateTime issuedAt;

  late final _i1.ColumnDateTime resolvedAt;

  late final _i1.ColumnString documentPath;

  late final _i1.ColumnString documentUrl;

  @override
  List<_i1.Column> get columns => [
    id,
    societyId,
    flatNumber,
    ownerName,
    ownerPhone,
    tenantName,
    tenantPhone,
    leaseStart,
    leaseEnd,
    monthlyRent,
    nocNumber,
    status,
    resolutionNotes,
    issuedAt,
    resolvedAt,
    documentPath,
    documentUrl,
  ];
}

class TenantNocInclude extends _i1.IncludeObject {
  TenantNocInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => TenantNoc.t;
}

class TenantNocIncludeList extends _i1.IncludeList {
  TenantNocIncludeList._({
    _i1.WhereExpressionBuilder<TenantNocTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TenantNoc.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => TenantNoc.t;
}

class TenantNocRepository {
  const TenantNocRepository._();

  /// Returns a list of [TenantNoc]s matching the given query parameters.
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
  Future<List<TenantNoc>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<TenantNocTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TenantNocTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TenantNocTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<TenantNoc>(
      where: where?.call(TenantNoc.t),
      orderBy: orderBy?.call(TenantNoc.t),
      orderByList: orderByList?.call(TenantNoc.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [TenantNoc] matching the given query parameters.
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
  Future<TenantNoc?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<TenantNocTable>? where,
    int? offset,
    _i1.OrderByBuilder<TenantNocTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TenantNocTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<TenantNoc>(
      where: where?.call(TenantNoc.t),
      orderBy: orderBy?.call(TenantNoc.t),
      orderByList: orderByList?.call(TenantNoc.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [TenantNoc] by its [id] or null if no such row exists.
  Future<TenantNoc?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<TenantNoc>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [TenantNoc]s in the list and returns the inserted rows.
  ///
  /// The returned [TenantNoc]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<TenantNoc>> insert(
    _i1.DatabaseSession session,
    List<TenantNoc> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<TenantNoc>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [TenantNoc] and returns the inserted row.
  ///
  /// The returned [TenantNoc] will have its `id` field set.
  Future<TenantNoc> insertRow(
    _i1.DatabaseSession session,
    TenantNoc row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TenantNoc>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [TenantNoc]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<TenantNoc>> update(
    _i1.DatabaseSession session,
    List<TenantNoc> rows, {
    _i1.ColumnSelections<TenantNocTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TenantNoc>(
      rows,
      columns: columns?.call(TenantNoc.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TenantNoc]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TenantNoc> updateRow(
    _i1.DatabaseSession session,
    TenantNoc row, {
    _i1.ColumnSelections<TenantNocTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TenantNoc>(
      row,
      columns: columns?.call(TenantNoc.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TenantNoc] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<TenantNoc?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<TenantNocUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<TenantNoc>(
      id,
      columnValues: columnValues(TenantNoc.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [TenantNoc]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<TenantNoc>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<TenantNocUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<TenantNocTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TenantNocTable>? orderBy,
    _i1.OrderByListBuilder<TenantNocTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<TenantNoc>(
      columnValues: columnValues(TenantNoc.t.updateTable),
      where: where(TenantNoc.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TenantNoc.t),
      orderByList: orderByList?.call(TenantNoc.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [TenantNoc]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<TenantNoc>> delete(
    _i1.DatabaseSession session,
    List<TenantNoc> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TenantNoc>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [TenantNoc].
  Future<TenantNoc> deleteRow(
    _i1.DatabaseSession session,
    TenantNoc row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TenantNoc>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<TenantNoc>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<TenantNocTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TenantNoc>(
      where: where(TenantNoc.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<TenantNocTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TenantNoc>(
      where: where?.call(TenantNoc.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [TenantNoc] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<TenantNocTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<TenantNoc>(
      where: where(TenantNoc.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
