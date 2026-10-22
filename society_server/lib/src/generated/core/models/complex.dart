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

abstract class Complex
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Complex._({
    this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.pincode,
    required this.createdAt,
  });

  factory Complex({
    int? id,
    required String name,
    required String address,
    required String city,
    required String pincode,
    required DateTime createdAt,
  }) = _ComplexImpl;

  factory Complex.fromJson(Map<String, dynamic> jsonSerialization) {
    return Complex(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      address: jsonSerialization['address'] as String,
      city: jsonSerialization['city'] as String,
      pincode: jsonSerialization['pincode'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = ComplexTable();

  static const db = ComplexRepository._();

  @override
  int? id;

  String name;

  String address;

  String city;

  String pincode;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Complex]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Complex copyWith({
    int? id,
    String? name,
    String? address,
    String? city,
    String? pincode,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Complex',
      if (id != null) 'id': id,
      'name': name,
      'address': address,
      'city': city,
      'pincode': pincode,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Complex',
      if (id != null) 'id': id,
      'name': name,
      'address': address,
      'city': city,
      'pincode': pincode,
      'createdAt': createdAt.toJson(),
    };
  }

  static ComplexInclude include() {
    return ComplexInclude._();
  }

  static ComplexIncludeList includeList({
    _i1.WhereExpressionBuilder<ComplexTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ComplexTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ComplexTable>? orderByList,
    ComplexInclude? include,
  }) {
    return ComplexIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Complex.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Complex.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ComplexImpl extends Complex {
  _ComplexImpl({
    int? id,
    required String name,
    required String address,
    required String city,
    required String pincode,
    required DateTime createdAt,
  }) : super._(
         id: id,
         name: name,
         address: address,
         city: city,
         pincode: pincode,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Complex]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Complex copyWith({
    Object? id = _Undefined,
    String? name,
    String? address,
    String? city,
    String? pincode,
    DateTime? createdAt,
  }) {
    return Complex(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      city: city ?? this.city,
      pincode: pincode ?? this.pincode,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class ComplexUpdateTable extends _i1.UpdateTable<ComplexTable> {
  ComplexUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> address(String value) => _i1.ColumnValue(
    table.address,
    value,
  );

  _i1.ColumnValue<String, String> city(String value) => _i1.ColumnValue(
    table.city,
    value,
  );

  _i1.ColumnValue<String, String> pincode(String value) => _i1.ColumnValue(
    table.pincode,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class ComplexTable extends _i1.Table<int?> {
  ComplexTable({super.tableRelation}) : super(tableName: 'complex') {
    updateTable = ComplexUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    address = _i1.ColumnString(
      'address',
      this,
    );
    city = _i1.ColumnString(
      'city',
      this,
    );
    pincode = _i1.ColumnString(
      'pincode',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final ComplexUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString address;

  late final _i1.ColumnString city;

  late final _i1.ColumnString pincode;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    address,
    city,
    pincode,
    createdAt,
  ];
}

class ComplexInclude extends _i1.IncludeObject {
  ComplexInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Complex.t;
}

class ComplexIncludeList extends _i1.IncludeList {
  ComplexIncludeList._({
    _i1.WhereExpressionBuilder<ComplexTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Complex.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Complex.t;
}

class ComplexRepository {
  const ComplexRepository._();

  /// Returns a list of [Complex]s matching the given query parameters.
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
  Future<List<Complex>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ComplexTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ComplexTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ComplexTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Complex>(
      where: where?.call(Complex.t),
      orderBy: orderBy?.call(Complex.t),
      orderByList: orderByList?.call(Complex.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Complex] matching the given query parameters.
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
  Future<Complex?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ComplexTable>? where,
    int? offset,
    _i1.OrderByBuilder<ComplexTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ComplexTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Complex>(
      where: where?.call(Complex.t),
      orderBy: orderBy?.call(Complex.t),
      orderByList: orderByList?.call(Complex.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Complex] by its [id] or null if no such row exists.
  Future<Complex?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Complex>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Complex]s in the list and returns the inserted rows.
  ///
  /// The returned [Complex]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Complex>> insert(
    _i1.DatabaseSession session,
    List<Complex> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Complex>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Complex] and returns the inserted row.
  ///
  /// The returned [Complex] will have its `id` field set.
  Future<Complex> insertRow(
    _i1.DatabaseSession session,
    Complex row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Complex>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Complex]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Complex>> update(
    _i1.DatabaseSession session,
    List<Complex> rows, {
    _i1.ColumnSelections<ComplexTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Complex>(
      rows,
      columns: columns?.call(Complex.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Complex]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Complex> updateRow(
    _i1.DatabaseSession session,
    Complex row, {
    _i1.ColumnSelections<ComplexTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Complex>(
      row,
      columns: columns?.call(Complex.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Complex] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Complex?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<ComplexUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Complex>(
      id,
      columnValues: columnValues(Complex.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Complex]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Complex>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<ComplexUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ComplexTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ComplexTable>? orderBy,
    _i1.OrderByListBuilder<ComplexTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Complex>(
      columnValues: columnValues(Complex.t.updateTable),
      where: where(Complex.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Complex.t),
      orderByList: orderByList?.call(Complex.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Complex]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Complex>> delete(
    _i1.DatabaseSession session,
    List<Complex> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Complex>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Complex].
  Future<Complex> deleteRow(
    _i1.DatabaseSession session,
    Complex row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Complex>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Complex>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ComplexTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Complex>(
      where: where(Complex.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ComplexTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Complex>(
      where: where?.call(Complex.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Complex] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ComplexTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Complex>(
      where: where(Complex.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
