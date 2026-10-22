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
import '../../emergency/models/emergency_type.dart' as _i2;
import '../../emergency/models/sos_status.dart' as _i3;

abstract class SosAlert
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  SosAlert._({
    this.id,
    required this.societyId,
    required this.flatNumber,
    required this.raisedByName,
    required this.emergencyType,
    this.description,
    required this.status,
    this.acknowledgedByName,
    this.acknowledgedAt,
    this.resolvedByName,
    this.resolvedAt,
    this.resolutionNotes,
    required this.raisedAt,
  });

  factory SosAlert({
    int? id,
    required int societyId,
    required String flatNumber,
    required String raisedByName,
    required _i2.EmergencyType emergencyType,
    String? description,
    required _i3.SosStatus status,
    String? acknowledgedByName,
    DateTime? acknowledgedAt,
    String? resolvedByName,
    DateTime? resolvedAt,
    String? resolutionNotes,
    required DateTime raisedAt,
  }) = _SosAlertImpl;

  factory SosAlert.fromJson(Map<String, dynamic> jsonSerialization) {
    return SosAlert(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      flatNumber: jsonSerialization['flatNumber'] as String,
      raisedByName: jsonSerialization['raisedByName'] as String,
      emergencyType: _i2.EmergencyType.fromJson(
        (jsonSerialization['emergencyType'] as String),
      ),
      description: jsonSerialization['description'] as String?,
      status: _i3.SosStatus.fromJson((jsonSerialization['status'] as String)),
      acknowledgedByName: jsonSerialization['acknowledgedByName'] as String?,
      acknowledgedAt: jsonSerialization['acknowledgedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['acknowledgedAt'],
            ),
      resolvedByName: jsonSerialization['resolvedByName'] as String?,
      resolvedAt: jsonSerialization['resolvedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['resolvedAt']),
      resolutionNotes: jsonSerialization['resolutionNotes'] as String?,
      raisedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['raisedAt'],
      ),
    );
  }

  static final t = SosAlertTable();

  static const db = SosAlertRepository._();

  @override
  int? id;

  int societyId;

  String flatNumber;

  String raisedByName;

  _i2.EmergencyType emergencyType;

  String? description;

  _i3.SosStatus status;

  String? acknowledgedByName;

  DateTime? acknowledgedAt;

  String? resolvedByName;

  DateTime? resolvedAt;

  String? resolutionNotes;

  DateTime raisedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [SosAlert]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SosAlert copyWith({
    int? id,
    int? societyId,
    String? flatNumber,
    String? raisedByName,
    _i2.EmergencyType? emergencyType,
    String? description,
    _i3.SosStatus? status,
    String? acknowledgedByName,
    DateTime? acknowledgedAt,
    String? resolvedByName,
    DateTime? resolvedAt,
    String? resolutionNotes,
    DateTime? raisedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SosAlert',
      if (id != null) 'id': id,
      'societyId': societyId,
      'flatNumber': flatNumber,
      'raisedByName': raisedByName,
      'emergencyType': emergencyType.toJson(),
      if (description != null) 'description': description,
      'status': status.toJson(),
      if (acknowledgedByName != null) 'acknowledgedByName': acknowledgedByName,
      if (acknowledgedAt != null) 'acknowledgedAt': acknowledgedAt?.toJson(),
      if (resolvedByName != null) 'resolvedByName': resolvedByName,
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
      if (resolutionNotes != null) 'resolutionNotes': resolutionNotes,
      'raisedAt': raisedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SosAlert',
      if (id != null) 'id': id,
      'societyId': societyId,
      'flatNumber': flatNumber,
      'raisedByName': raisedByName,
      'emergencyType': emergencyType.toJson(),
      if (description != null) 'description': description,
      'status': status.toJson(),
      if (acknowledgedByName != null) 'acknowledgedByName': acknowledgedByName,
      if (acknowledgedAt != null) 'acknowledgedAt': acknowledgedAt?.toJson(),
      if (resolvedByName != null) 'resolvedByName': resolvedByName,
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
      if (resolutionNotes != null) 'resolutionNotes': resolutionNotes,
      'raisedAt': raisedAt.toJson(),
    };
  }

  static SosAlertInclude include() {
    return SosAlertInclude._();
  }

  static SosAlertIncludeList includeList({
    _i1.WhereExpressionBuilder<SosAlertTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SosAlertTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SosAlertTable>? orderByList,
    SosAlertInclude? include,
  }) {
    return SosAlertIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SosAlert.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SosAlert.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SosAlertImpl extends SosAlert {
  _SosAlertImpl({
    int? id,
    required int societyId,
    required String flatNumber,
    required String raisedByName,
    required _i2.EmergencyType emergencyType,
    String? description,
    required _i3.SosStatus status,
    String? acknowledgedByName,
    DateTime? acknowledgedAt,
    String? resolvedByName,
    DateTime? resolvedAt,
    String? resolutionNotes,
    required DateTime raisedAt,
  }) : super._(
         id: id,
         societyId: societyId,
         flatNumber: flatNumber,
         raisedByName: raisedByName,
         emergencyType: emergencyType,
         description: description,
         status: status,
         acknowledgedByName: acknowledgedByName,
         acknowledgedAt: acknowledgedAt,
         resolvedByName: resolvedByName,
         resolvedAt: resolvedAt,
         resolutionNotes: resolutionNotes,
         raisedAt: raisedAt,
       );

  /// Returns a shallow copy of this [SosAlert]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SosAlert copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? flatNumber,
    String? raisedByName,
    _i2.EmergencyType? emergencyType,
    Object? description = _Undefined,
    _i3.SosStatus? status,
    Object? acknowledgedByName = _Undefined,
    Object? acknowledgedAt = _Undefined,
    Object? resolvedByName = _Undefined,
    Object? resolvedAt = _Undefined,
    Object? resolutionNotes = _Undefined,
    DateTime? raisedAt,
  }) {
    return SosAlert(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      flatNumber: flatNumber ?? this.flatNumber,
      raisedByName: raisedByName ?? this.raisedByName,
      emergencyType: emergencyType ?? this.emergencyType,
      description: description is String? ? description : this.description,
      status: status ?? this.status,
      acknowledgedByName: acknowledgedByName is String?
          ? acknowledgedByName
          : this.acknowledgedByName,
      acknowledgedAt: acknowledgedAt is DateTime?
          ? acknowledgedAt
          : this.acknowledgedAt,
      resolvedByName: resolvedByName is String?
          ? resolvedByName
          : this.resolvedByName,
      resolvedAt: resolvedAt is DateTime? ? resolvedAt : this.resolvedAt,
      resolutionNotes: resolutionNotes is String?
          ? resolutionNotes
          : this.resolutionNotes,
      raisedAt: raisedAt ?? this.raisedAt,
    );
  }
}

class SosAlertUpdateTable extends _i1.UpdateTable<SosAlertTable> {
  SosAlertUpdateTable(super.table);

  _i1.ColumnValue<int, int> societyId(int value) => _i1.ColumnValue(
    table.societyId,
    value,
  );

  _i1.ColumnValue<String, String> flatNumber(String value) => _i1.ColumnValue(
    table.flatNumber,
    value,
  );

  _i1.ColumnValue<String, String> raisedByName(String value) => _i1.ColumnValue(
    table.raisedByName,
    value,
  );

  _i1.ColumnValue<_i2.EmergencyType, _i2.EmergencyType> emergencyType(
    _i2.EmergencyType value,
  ) => _i1.ColumnValue(
    table.emergencyType,
    value,
  );

  _i1.ColumnValue<String, String> description(String? value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<_i3.SosStatus, _i3.SosStatus> status(_i3.SosStatus value) =>
      _i1.ColumnValue(
        table.status,
        value,
      );

  _i1.ColumnValue<String, String> acknowledgedByName(String? value) =>
      _i1.ColumnValue(
        table.acknowledgedByName,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> acknowledgedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.acknowledgedAt,
        value,
      );

  _i1.ColumnValue<String, String> resolvedByName(String? value) =>
      _i1.ColumnValue(
        table.resolvedByName,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> resolvedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.resolvedAt,
        value,
      );

  _i1.ColumnValue<String, String> resolutionNotes(String? value) =>
      _i1.ColumnValue(
        table.resolutionNotes,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> raisedAt(DateTime value) =>
      _i1.ColumnValue(
        table.raisedAt,
        value,
      );
}

class SosAlertTable extends _i1.Table<int?> {
  SosAlertTable({super.tableRelation}) : super(tableName: 'sos_alert') {
    updateTable = SosAlertUpdateTable(this);
    societyId = _i1.ColumnInt(
      'societyId',
      this,
    );
    flatNumber = _i1.ColumnString(
      'flatNumber',
      this,
    );
    raisedByName = _i1.ColumnString(
      'raisedByName',
      this,
    );
    emergencyType = _i1.ColumnEnum(
      'emergencyType',
      this,
      _i1.EnumSerialization.byName,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
    acknowledgedByName = _i1.ColumnString(
      'acknowledgedByName',
      this,
    );
    acknowledgedAt = _i1.ColumnDateTime(
      'acknowledgedAt',
      this,
    );
    resolvedByName = _i1.ColumnString(
      'resolvedByName',
      this,
    );
    resolvedAt = _i1.ColumnDateTime(
      'resolvedAt',
      this,
    );
    resolutionNotes = _i1.ColumnString(
      'resolutionNotes',
      this,
    );
    raisedAt = _i1.ColumnDateTime(
      'raisedAt',
      this,
    );
  }

  late final SosAlertUpdateTable updateTable;

  late final _i1.ColumnInt societyId;

  late final _i1.ColumnString flatNumber;

  late final _i1.ColumnString raisedByName;

  late final _i1.ColumnEnum<_i2.EmergencyType> emergencyType;

  late final _i1.ColumnString description;

  late final _i1.ColumnEnum<_i3.SosStatus> status;

  late final _i1.ColumnString acknowledgedByName;

  late final _i1.ColumnDateTime acknowledgedAt;

  late final _i1.ColumnString resolvedByName;

  late final _i1.ColumnDateTime resolvedAt;

  late final _i1.ColumnString resolutionNotes;

  late final _i1.ColumnDateTime raisedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    societyId,
    flatNumber,
    raisedByName,
    emergencyType,
    description,
    status,
    acknowledgedByName,
    acknowledgedAt,
    resolvedByName,
    resolvedAt,
    resolutionNotes,
    raisedAt,
  ];
}

class SosAlertInclude extends _i1.IncludeObject {
  SosAlertInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => SosAlert.t;
}

class SosAlertIncludeList extends _i1.IncludeList {
  SosAlertIncludeList._({
    _i1.WhereExpressionBuilder<SosAlertTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SosAlert.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => SosAlert.t;
}

class SosAlertRepository {
  const SosAlertRepository._();

  /// Returns a list of [SosAlert]s matching the given query parameters.
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
  Future<List<SosAlert>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SosAlertTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SosAlertTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SosAlertTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<SosAlert>(
      where: where?.call(SosAlert.t),
      orderBy: orderBy?.call(SosAlert.t),
      orderByList: orderByList?.call(SosAlert.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [SosAlert] matching the given query parameters.
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
  Future<SosAlert?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SosAlertTable>? where,
    int? offset,
    _i1.OrderByBuilder<SosAlertTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SosAlertTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<SosAlert>(
      where: where?.call(SosAlert.t),
      orderBy: orderBy?.call(SosAlert.t),
      orderByList: orderByList?.call(SosAlert.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [SosAlert] by its [id] or null if no such row exists.
  Future<SosAlert?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<SosAlert>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [SosAlert]s in the list and returns the inserted rows.
  ///
  /// The returned [SosAlert]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<SosAlert>> insert(
    _i1.DatabaseSession session,
    List<SosAlert> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<SosAlert>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [SosAlert] and returns the inserted row.
  ///
  /// The returned [SosAlert] will have its `id` field set.
  Future<SosAlert> insertRow(
    _i1.DatabaseSession session,
    SosAlert row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SosAlert>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SosAlert]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SosAlert>> update(
    _i1.DatabaseSession session,
    List<SosAlert> rows, {
    _i1.ColumnSelections<SosAlertTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SosAlert>(
      rows,
      columns: columns?.call(SosAlert.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SosAlert]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SosAlert> updateRow(
    _i1.DatabaseSession session,
    SosAlert row, {
    _i1.ColumnSelections<SosAlertTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SosAlert>(
      row,
      columns: columns?.call(SosAlert.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SosAlert] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<SosAlert?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<SosAlertUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<SosAlert>(
      id,
      columnValues: columnValues(SosAlert.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [SosAlert]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<SosAlert>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<SosAlertUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<SosAlertTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SosAlertTable>? orderBy,
    _i1.OrderByListBuilder<SosAlertTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<SosAlert>(
      columnValues: columnValues(SosAlert.t.updateTable),
      where: where(SosAlert.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SosAlert.t),
      orderByList: orderByList?.call(SosAlert.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [SosAlert]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SosAlert>> delete(
    _i1.DatabaseSession session,
    List<SosAlert> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SosAlert>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SosAlert].
  Future<SosAlert> deleteRow(
    _i1.DatabaseSession session,
    SosAlert row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SosAlert>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SosAlert>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<SosAlertTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SosAlert>(
      where: where(SosAlert.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SosAlertTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SosAlert>(
      where: where?.call(SosAlert.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [SosAlert] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<SosAlertTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<SosAlert>(
      where: where(SosAlert.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
