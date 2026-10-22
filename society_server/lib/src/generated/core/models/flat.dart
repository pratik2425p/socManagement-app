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

abstract class Flat implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Flat._({
    this.id,
    required this.societyId,
    required this.buildingId,
    required this.flatNumber,
    required this.floor,
    required this.squareFeet,
    this.intercomNumber,
    required this.status,
  });

  factory Flat({
    int? id,
    required int societyId,
    required int buildingId,
    required String flatNumber,
    required int floor,
    required double squareFeet,
    String? intercomNumber,
    required String status,
  }) = _FlatImpl;

  factory Flat.fromJson(Map<String, dynamic> jsonSerialization) {
    return Flat(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      buildingId: jsonSerialization['buildingId'] as int,
      flatNumber: jsonSerialization['flatNumber'] as String,
      floor: jsonSerialization['floor'] as int,
      squareFeet: (jsonSerialization['squareFeet'] as num).toDouble(),
      intercomNumber: jsonSerialization['intercomNumber'] as String?,
      status: jsonSerialization['status'] as String,
    );
  }

  static final t = FlatTable();

  static const db = FlatRepository._();

  @override
  int? id;

  int societyId;

  int buildingId;

  String flatNumber;

  int floor;

  double squareFeet;

  String? intercomNumber;

  String status;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Flat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Flat copyWith({
    int? id,
    int? societyId,
    int? buildingId,
    String? flatNumber,
    int? floor,
    double? squareFeet,
    String? intercomNumber,
    String? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Flat',
      if (id != null) 'id': id,
      'societyId': societyId,
      'buildingId': buildingId,
      'flatNumber': flatNumber,
      'floor': floor,
      'squareFeet': squareFeet,
      if (intercomNumber != null) 'intercomNumber': intercomNumber,
      'status': status,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Flat',
      if (id != null) 'id': id,
      'societyId': societyId,
      'buildingId': buildingId,
      'flatNumber': flatNumber,
      'floor': floor,
      'squareFeet': squareFeet,
      if (intercomNumber != null) 'intercomNumber': intercomNumber,
      'status': status,
    };
  }

  static FlatInclude include() {
    return FlatInclude._();
  }

  static FlatIncludeList includeList({
    _i1.WhereExpressionBuilder<FlatTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FlatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FlatTable>? orderByList,
    FlatInclude? include,
  }) {
    return FlatIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Flat.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Flat.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FlatImpl extends Flat {
  _FlatImpl({
    int? id,
    required int societyId,
    required int buildingId,
    required String flatNumber,
    required int floor,
    required double squareFeet,
    String? intercomNumber,
    required String status,
  }) : super._(
         id: id,
         societyId: societyId,
         buildingId: buildingId,
         flatNumber: flatNumber,
         floor: floor,
         squareFeet: squareFeet,
         intercomNumber: intercomNumber,
         status: status,
       );

  /// Returns a shallow copy of this [Flat]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Flat copyWith({
    Object? id = _Undefined,
    int? societyId,
    int? buildingId,
    String? flatNumber,
    int? floor,
    double? squareFeet,
    Object? intercomNumber = _Undefined,
    String? status,
  }) {
    return Flat(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      buildingId: buildingId ?? this.buildingId,
      flatNumber: flatNumber ?? this.flatNumber,
      floor: floor ?? this.floor,
      squareFeet: squareFeet ?? this.squareFeet,
      intercomNumber: intercomNumber is String?
          ? intercomNumber
          : this.intercomNumber,
      status: status ?? this.status,
    );
  }
}

class FlatUpdateTable extends _i1.UpdateTable<FlatTable> {
  FlatUpdateTable(super.table);

  _i1.ColumnValue<int, int> societyId(int value) => _i1.ColumnValue(
    table.societyId,
    value,
  );

  _i1.ColumnValue<int, int> buildingId(int value) => _i1.ColumnValue(
    table.buildingId,
    value,
  );

  _i1.ColumnValue<String, String> flatNumber(String value) => _i1.ColumnValue(
    table.flatNumber,
    value,
  );

  _i1.ColumnValue<int, int> floor(int value) => _i1.ColumnValue(
    table.floor,
    value,
  );

  _i1.ColumnValue<double, double> squareFeet(double value) => _i1.ColumnValue(
    table.squareFeet,
    value,
  );

  _i1.ColumnValue<String, String> intercomNumber(String? value) =>
      _i1.ColumnValue(
        table.intercomNumber,
        value,
      );

  _i1.ColumnValue<String, String> status(String value) => _i1.ColumnValue(
    table.status,
    value,
  );
}

class FlatTable extends _i1.Table<int?> {
  FlatTable({super.tableRelation}) : super(tableName: 'flat') {
    updateTable = FlatUpdateTable(this);
    societyId = _i1.ColumnInt(
      'societyId',
      this,
    );
    buildingId = _i1.ColumnInt(
      'buildingId',
      this,
    );
    flatNumber = _i1.ColumnString(
      'flatNumber',
      this,
    );
    floor = _i1.ColumnInt(
      'floor',
      this,
    );
    squareFeet = _i1.ColumnDouble(
      'squareFeet',
      this,
    );
    intercomNumber = _i1.ColumnString(
      'intercomNumber',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
  }

  late final FlatUpdateTable updateTable;

  late final _i1.ColumnInt societyId;

  late final _i1.ColumnInt buildingId;

  late final _i1.ColumnString flatNumber;

  late final _i1.ColumnInt floor;

  late final _i1.ColumnDouble squareFeet;

  late final _i1.ColumnString intercomNumber;

  late final _i1.ColumnString status;

  @override
  List<_i1.Column> get columns => [
    id,
    societyId,
    buildingId,
    flatNumber,
    floor,
    squareFeet,
    intercomNumber,
    status,
  ];
}

class FlatInclude extends _i1.IncludeObject {
  FlatInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Flat.t;
}

class FlatIncludeList extends _i1.IncludeList {
  FlatIncludeList._({
    _i1.WhereExpressionBuilder<FlatTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Flat.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Flat.t;
}

class FlatRepository {
  const FlatRepository._();

  /// Returns a list of [Flat]s matching the given query parameters.
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
  Future<List<Flat>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<FlatTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FlatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FlatTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Flat>(
      where: where?.call(Flat.t),
      orderBy: orderBy?.call(Flat.t),
      orderByList: orderByList?.call(Flat.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Flat] matching the given query parameters.
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
  Future<Flat?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<FlatTable>? where,
    int? offset,
    _i1.OrderByBuilder<FlatTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FlatTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Flat>(
      where: where?.call(Flat.t),
      orderBy: orderBy?.call(Flat.t),
      orderByList: orderByList?.call(Flat.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Flat] by its [id] or null if no such row exists.
  Future<Flat?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Flat>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Flat]s in the list and returns the inserted rows.
  ///
  /// The returned [Flat]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Flat>> insert(
    _i1.DatabaseSession session,
    List<Flat> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Flat>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Flat] and returns the inserted row.
  ///
  /// The returned [Flat] will have its `id` field set.
  Future<Flat> insertRow(
    _i1.DatabaseSession session,
    Flat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Flat>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Flat]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Flat>> update(
    _i1.DatabaseSession session,
    List<Flat> rows, {
    _i1.ColumnSelections<FlatTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Flat>(
      rows,
      columns: columns?.call(Flat.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Flat]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Flat> updateRow(
    _i1.DatabaseSession session,
    Flat row, {
    _i1.ColumnSelections<FlatTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Flat>(
      row,
      columns: columns?.call(Flat.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Flat] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Flat?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<FlatUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Flat>(
      id,
      columnValues: columnValues(Flat.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Flat]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Flat>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<FlatUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<FlatTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FlatTable>? orderBy,
    _i1.OrderByListBuilder<FlatTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Flat>(
      columnValues: columnValues(Flat.t.updateTable),
      where: where(Flat.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Flat.t),
      orderByList: orderByList?.call(Flat.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Flat]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Flat>> delete(
    _i1.DatabaseSession session,
    List<Flat> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Flat>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Flat].
  Future<Flat> deleteRow(
    _i1.DatabaseSession session,
    Flat row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Flat>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Flat>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<FlatTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Flat>(
      where: where(Flat.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<FlatTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Flat>(
      where: where?.call(Flat.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Flat] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<FlatTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Flat>(
      where: where(Flat.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
