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
import 'package:society_server/src/generated/protocol.dart' as _i2;

abstract class Amenity
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Amenity._({
    this.id,
    required this.societyId,
    required this.name,
    required this.icon,
    required this.capacity,
    required this.rate,
    required this.unit,
    required this.timeSlots,
    required this.description,
    required this.rules,
    required this.isActive,
    required this.createdAt,
  });

  factory Amenity({
    int? id,
    required int societyId,
    required String name,
    required String icon,
    required int capacity,
    required double rate,
    required String unit,
    required List<String> timeSlots,
    required String description,
    required String rules,
    required bool isActive,
    required DateTime createdAt,
  }) = _AmenityImpl;

  factory Amenity.fromJson(Map<String, dynamic> jsonSerialization) {
    return Amenity(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      name: jsonSerialization['name'] as String,
      icon: jsonSerialization['icon'] as String,
      capacity: jsonSerialization['capacity'] as int,
      rate: (jsonSerialization['rate'] as num).toDouble(),
      unit: jsonSerialization['unit'] as String,
      timeSlots: _i2.Protocol().deserialize<List<String>>(
        jsonSerialization['timeSlots'],
      ),
      description: jsonSerialization['description'] as String,
      rules: jsonSerialization['rules'] as String,
      isActive: _i1.BoolJsonExtension.fromJson(jsonSerialization['isActive']),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = AmenityTable();

  static const db = AmenityRepository._();

  @override
  int? id;

  int societyId;

  String name;

  String icon;

  int capacity;

  double rate;

  String unit;

  List<String> timeSlots;

  String description;

  String rules;

  bool isActive;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Amenity]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Amenity copyWith({
    int? id,
    int? societyId,
    String? name,
    String? icon,
    int? capacity,
    double? rate,
    String? unit,
    List<String>? timeSlots,
    String? description,
    String? rules,
    bool? isActive,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Amenity',
      if (id != null) 'id': id,
      'societyId': societyId,
      'name': name,
      'icon': icon,
      'capacity': capacity,
      'rate': rate,
      'unit': unit,
      'timeSlots': timeSlots.toJson(),
      'description': description,
      'rules': rules,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Amenity',
      if (id != null) 'id': id,
      'societyId': societyId,
      'name': name,
      'icon': icon,
      'capacity': capacity,
      'rate': rate,
      'unit': unit,
      'timeSlots': timeSlots.toJson(),
      'description': description,
      'rules': rules,
      'isActive': isActive,
      'createdAt': createdAt.toJson(),
    };
  }

  static AmenityInclude include() {
    return AmenityInclude._();
  }

  static AmenityIncludeList includeList({
    _i1.WhereExpressionBuilder<AmenityTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AmenityTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AmenityTable>? orderByList,
    AmenityInclude? include,
  }) {
    return AmenityIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Amenity.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Amenity.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AmenityImpl extends Amenity {
  _AmenityImpl({
    int? id,
    required int societyId,
    required String name,
    required String icon,
    required int capacity,
    required double rate,
    required String unit,
    required List<String> timeSlots,
    required String description,
    required String rules,
    required bool isActive,
    required DateTime createdAt,
  }) : super._(
         id: id,
         societyId: societyId,
         name: name,
         icon: icon,
         capacity: capacity,
         rate: rate,
         unit: unit,
         timeSlots: timeSlots,
         description: description,
         rules: rules,
         isActive: isActive,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Amenity]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Amenity copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? name,
    String? icon,
    int? capacity,
    double? rate,
    String? unit,
    List<String>? timeSlots,
    String? description,
    String? rules,
    bool? isActive,
    DateTime? createdAt,
  }) {
    return Amenity(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      capacity: capacity ?? this.capacity,
      rate: rate ?? this.rate,
      unit: unit ?? this.unit,
      timeSlots: timeSlots ?? this.timeSlots.map((e0) => e0).toList(),
      description: description ?? this.description,
      rules: rules ?? this.rules,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class AmenityUpdateTable extends _i1.UpdateTable<AmenityTable> {
  AmenityUpdateTable(super.table);

  _i1.ColumnValue<int, int> societyId(int value) => _i1.ColumnValue(
    table.societyId,
    value,
  );

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> icon(String value) => _i1.ColumnValue(
    table.icon,
    value,
  );

  _i1.ColumnValue<int, int> capacity(int value) => _i1.ColumnValue(
    table.capacity,
    value,
  );

  _i1.ColumnValue<double, double> rate(double value) => _i1.ColumnValue(
    table.rate,
    value,
  );

  _i1.ColumnValue<String, String> unit(String value) => _i1.ColumnValue(
    table.unit,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> timeSlots(List<String> value) =>
      _i1.ColumnValue(
        table.timeSlots,
        value,
      );

  _i1.ColumnValue<String, String> description(String value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<String, String> rules(String value) => _i1.ColumnValue(
    table.rules,
    value,
  );

  _i1.ColumnValue<bool, bool> isActive(bool value) => _i1.ColumnValue(
    table.isActive,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class AmenityTable extends _i1.Table<int?> {
  AmenityTable({super.tableRelation}) : super(tableName: 'amenity') {
    updateTable = AmenityUpdateTable(this);
    societyId = _i1.ColumnInt(
      'societyId',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    icon = _i1.ColumnString(
      'icon',
      this,
    );
    capacity = _i1.ColumnInt(
      'capacity',
      this,
    );
    rate = _i1.ColumnDouble(
      'rate',
      this,
    );
    unit = _i1.ColumnString(
      'unit',
      this,
    );
    timeSlots = _i1.ColumnSerializable<List<String>>(
      'timeSlots',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    rules = _i1.ColumnString(
      'rules',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final AmenityUpdateTable updateTable;

  late final _i1.ColumnInt societyId;

  late final _i1.ColumnString name;

  late final _i1.ColumnString icon;

  late final _i1.ColumnInt capacity;

  late final _i1.ColumnDouble rate;

  late final _i1.ColumnString unit;

  late final _i1.ColumnSerializable<List<String>> timeSlots;

  late final _i1.ColumnString description;

  late final _i1.ColumnString rules;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    societyId,
    name,
    icon,
    capacity,
    rate,
    unit,
    timeSlots,
    description,
    rules,
    isActive,
    createdAt,
  ];
}

class AmenityInclude extends _i1.IncludeObject {
  AmenityInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Amenity.t;
}

class AmenityIncludeList extends _i1.IncludeList {
  AmenityIncludeList._({
    _i1.WhereExpressionBuilder<AmenityTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Amenity.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Amenity.t;
}

class AmenityRepository {
  const AmenityRepository._();

  /// Returns a list of [Amenity]s matching the given query parameters.
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
  Future<List<Amenity>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<AmenityTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AmenityTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AmenityTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Amenity>(
      where: where?.call(Amenity.t),
      orderBy: orderBy?.call(Amenity.t),
      orderByList: orderByList?.call(Amenity.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Amenity] matching the given query parameters.
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
  Future<Amenity?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<AmenityTable>? where,
    int? offset,
    _i1.OrderByBuilder<AmenityTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AmenityTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Amenity>(
      where: where?.call(Amenity.t),
      orderBy: orderBy?.call(Amenity.t),
      orderByList: orderByList?.call(Amenity.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Amenity] by its [id] or null if no such row exists.
  Future<Amenity?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Amenity>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Amenity]s in the list and returns the inserted rows.
  ///
  /// The returned [Amenity]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Amenity>> insert(
    _i1.DatabaseSession session,
    List<Amenity> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Amenity>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Amenity] and returns the inserted row.
  ///
  /// The returned [Amenity] will have its `id` field set.
  Future<Amenity> insertRow(
    _i1.DatabaseSession session,
    Amenity row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Amenity>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Amenity]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Amenity>> update(
    _i1.DatabaseSession session,
    List<Amenity> rows, {
    _i1.ColumnSelections<AmenityTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Amenity>(
      rows,
      columns: columns?.call(Amenity.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Amenity]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Amenity> updateRow(
    _i1.DatabaseSession session,
    Amenity row, {
    _i1.ColumnSelections<AmenityTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Amenity>(
      row,
      columns: columns?.call(Amenity.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Amenity] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Amenity?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<AmenityUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Amenity>(
      id,
      columnValues: columnValues(Amenity.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Amenity]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Amenity>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<AmenityUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<AmenityTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AmenityTable>? orderBy,
    _i1.OrderByListBuilder<AmenityTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Amenity>(
      columnValues: columnValues(Amenity.t.updateTable),
      where: where(Amenity.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Amenity.t),
      orderByList: orderByList?.call(Amenity.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Amenity]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Amenity>> delete(
    _i1.DatabaseSession session,
    List<Amenity> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Amenity>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Amenity].
  Future<Amenity> deleteRow(
    _i1.DatabaseSession session,
    Amenity row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Amenity>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Amenity>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<AmenityTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Amenity>(
      where: where(Amenity.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<AmenityTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Amenity>(
      where: where?.call(Amenity.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Amenity] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<AmenityTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Amenity>(
      where: where(Amenity.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
