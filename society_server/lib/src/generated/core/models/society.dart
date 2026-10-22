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

abstract class Society
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Society._({
    this.id,
    required this.name,
    required this.code,
    required this.address,
    required this.city,
    required this.state,
    required this.pincode,
    required this.totalFlats,
    required this.subscriptionPlan,
    required this.subscriptionStatus,
    this.complexId,
    required this.createdAt,
  });

  factory Society({
    int? id,
    required String name,
    required String code,
    required String address,
    required String city,
    required String state,
    required String pincode,
    required int totalFlats,
    required String subscriptionPlan,
    required String subscriptionStatus,
    int? complexId,
    required DateTime createdAt,
  }) = _SocietyImpl;

  factory Society.fromJson(Map<String, dynamic> jsonSerialization) {
    return Society(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      code: jsonSerialization['code'] as String,
      address: jsonSerialization['address'] as String,
      city: jsonSerialization['city'] as String,
      state: jsonSerialization['state'] as String,
      pincode: jsonSerialization['pincode'] as String,
      totalFlats: jsonSerialization['totalFlats'] as int,
      subscriptionPlan: jsonSerialization['subscriptionPlan'] as String,
      subscriptionStatus: jsonSerialization['subscriptionStatus'] as String,
      complexId: jsonSerialization['complexId'] as int?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = SocietyTable();

  static const db = SocietyRepository._();

  @override
  int? id;

  String name;

  String code;

  String address;

  String city;

  String state;

  String pincode;

  int totalFlats;

  String subscriptionPlan;

  String subscriptionStatus;

  int? complexId;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Society]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Society copyWith({
    int? id,
    String? name,
    String? code,
    String? address,
    String? city,
    String? state,
    String? pincode,
    int? totalFlats,
    String? subscriptionPlan,
    String? subscriptionStatus,
    int? complexId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Society',
      if (id != null) 'id': id,
      'name': name,
      'code': code,
      'address': address,
      'city': city,
      'state': state,
      'pincode': pincode,
      'totalFlats': totalFlats,
      'subscriptionPlan': subscriptionPlan,
      'subscriptionStatus': subscriptionStatus,
      if (complexId != null) 'complexId': complexId,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Society',
      if (id != null) 'id': id,
      'name': name,
      'code': code,
      'address': address,
      'city': city,
      'state': state,
      'pincode': pincode,
      'totalFlats': totalFlats,
      'subscriptionPlan': subscriptionPlan,
      'subscriptionStatus': subscriptionStatus,
      if (complexId != null) 'complexId': complexId,
      'createdAt': createdAt.toJson(),
    };
  }

  static SocietyInclude include() {
    return SocietyInclude._();
  }

  static SocietyIncludeList includeList({
    _i1.WhereExpressionBuilder<SocietyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SocietyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SocietyTable>? orderByList,
    SocietyInclude? include,
  }) {
    return SocietyIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Society.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Society.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SocietyImpl extends Society {
  _SocietyImpl({
    int? id,
    required String name,
    required String code,
    required String address,
    required String city,
    required String state,
    required String pincode,
    required int totalFlats,
    required String subscriptionPlan,
    required String subscriptionStatus,
    int? complexId,
    required DateTime createdAt,
  }) : super._(
         id: id,
         name: name,
         code: code,
         address: address,
         city: city,
         state: state,
         pincode: pincode,
         totalFlats: totalFlats,
         subscriptionPlan: subscriptionPlan,
         subscriptionStatus: subscriptionStatus,
         complexId: complexId,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Society]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Society copyWith({
    Object? id = _Undefined,
    String? name,
    String? code,
    String? address,
    String? city,
    String? state,
    String? pincode,
    int? totalFlats,
    String? subscriptionPlan,
    String? subscriptionStatus,
    Object? complexId = _Undefined,
    DateTime? createdAt,
  }) {
    return Society(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      totalFlats: totalFlats ?? this.totalFlats,
      subscriptionPlan: subscriptionPlan ?? this.subscriptionPlan,
      subscriptionStatus: subscriptionStatus ?? this.subscriptionStatus,
      complexId: complexId is int? ? complexId : this.complexId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class SocietyUpdateTable extends _i1.UpdateTable<SocietyTable> {
  SocietyUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> code(String value) => _i1.ColumnValue(
    table.code,
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

  _i1.ColumnValue<String, String> state(String value) => _i1.ColumnValue(
    table.state,
    value,
  );

  _i1.ColumnValue<String, String> pincode(String value) => _i1.ColumnValue(
    table.pincode,
    value,
  );

  _i1.ColumnValue<int, int> totalFlats(int value) => _i1.ColumnValue(
    table.totalFlats,
    value,
  );

  _i1.ColumnValue<String, String> subscriptionPlan(String value) =>
      _i1.ColumnValue(
        table.subscriptionPlan,
        value,
      );

  _i1.ColumnValue<String, String> subscriptionStatus(String value) =>
      _i1.ColumnValue(
        table.subscriptionStatus,
        value,
      );

  _i1.ColumnValue<int, int> complexId(int? value) => _i1.ColumnValue(
    table.complexId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class SocietyTable extends _i1.Table<int?> {
  SocietyTable({super.tableRelation}) : super(tableName: 'society') {
    updateTable = SocietyUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    code = _i1.ColumnString(
      'code',
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
    state = _i1.ColumnString(
      'state',
      this,
    );
    pincode = _i1.ColumnString(
      'pincode',
      this,
    );
    totalFlats = _i1.ColumnInt(
      'totalFlats',
      this,
    );
    subscriptionPlan = _i1.ColumnString(
      'subscriptionPlan',
      this,
    );
    subscriptionStatus = _i1.ColumnString(
      'subscriptionStatus',
      this,
    );
    complexId = _i1.ColumnInt(
      'complexId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final SocietyUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString code;

  late final _i1.ColumnString address;

  late final _i1.ColumnString city;

  late final _i1.ColumnString state;

  late final _i1.ColumnString pincode;

  late final _i1.ColumnInt totalFlats;

  late final _i1.ColumnString subscriptionPlan;

  late final _i1.ColumnString subscriptionStatus;

  late final _i1.ColumnInt complexId;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    code,
    address,
    city,
    state,
    pincode,
    totalFlats,
    subscriptionPlan,
    subscriptionStatus,
    complexId,
    createdAt,
  ];
}

class SocietyInclude extends _i1.IncludeObject {
  SocietyInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Society.t;
}

class SocietyIncludeList extends _i1.IncludeList {
  SocietyIncludeList._({
    _i1.WhereExpressionBuilder<SocietyTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Society.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Society.t;
}

class SocietyRepository {
  const SocietyRepository._();

  /// Returns a list of [Society]s matching the given query parameters.
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
  Future<List<Society>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SocietyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SocietyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SocietyTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Society>(
      where: where?.call(Society.t),
      orderBy: orderBy?.call(Society.t),
      orderByList: orderByList?.call(Society.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Society] matching the given query parameters.
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
  Future<Society?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SocietyTable>? where,
    int? offset,
    _i1.OrderByBuilder<SocietyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SocietyTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Society>(
      where: where?.call(Society.t),
      orderBy: orderBy?.call(Society.t),
      orderByList: orderByList?.call(Society.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Society] by its [id] or null if no such row exists.
  Future<Society?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Society>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Society]s in the list and returns the inserted rows.
  ///
  /// The returned [Society]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Society>> insert(
    _i1.DatabaseSession session,
    List<Society> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Society>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Society] and returns the inserted row.
  ///
  /// The returned [Society] will have its `id` field set.
  Future<Society> insertRow(
    _i1.DatabaseSession session,
    Society row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Society>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Society]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Society>> update(
    _i1.DatabaseSession session,
    List<Society> rows, {
    _i1.ColumnSelections<SocietyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Society>(
      rows,
      columns: columns?.call(Society.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Society]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Society> updateRow(
    _i1.DatabaseSession session,
    Society row, {
    _i1.ColumnSelections<SocietyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Society>(
      row,
      columns: columns?.call(Society.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Society] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Society?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<SocietyUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Society>(
      id,
      columnValues: columnValues(Society.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Society]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Society>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<SocietyUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<SocietyTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SocietyTable>? orderBy,
    _i1.OrderByListBuilder<SocietyTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Society>(
      columnValues: columnValues(Society.t.updateTable),
      where: where(Society.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Society.t),
      orderByList: orderByList?.call(Society.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Society]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Society>> delete(
    _i1.DatabaseSession session,
    List<Society> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Society>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Society].
  Future<Society> deleteRow(
    _i1.DatabaseSession session,
    Society row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Society>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Society>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<SocietyTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Society>(
      where: where(Society.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SocietyTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Society>(
      where: where?.call(Society.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Society] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<SocietyTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Society>(
      where: where(Society.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
