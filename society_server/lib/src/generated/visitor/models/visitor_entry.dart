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
import '../../visitor/models/visitor_status.dart' as _i2;

abstract class VisitorEntry
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  VisitorEntry._({
    this.id,
    required this.societyId,
    this.complexId,
    required this.flatNumber,
    required this.visitorName,
    required this.phoneNumber,
    required this.purpose,
    this.vehicleNumber,
    this.passcode,
    required this.status,
    required this.entryGate,
    this.checkInTime,
    this.checkOutTime,
  });

  factory VisitorEntry({
    int? id,
    required int societyId,
    int? complexId,
    required String flatNumber,
    required String visitorName,
    required String phoneNumber,
    required String purpose,
    String? vehicleNumber,
    String? passcode,
    required _i2.VisitorStatus status,
    required String entryGate,
    DateTime? checkInTime,
    DateTime? checkOutTime,
  }) = _VisitorEntryImpl;

  factory VisitorEntry.fromJson(Map<String, dynamic> jsonSerialization) {
    return VisitorEntry(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      complexId: jsonSerialization['complexId'] as int?,
      flatNumber: jsonSerialization['flatNumber'] as String,
      visitorName: jsonSerialization['visitorName'] as String,
      phoneNumber: jsonSerialization['phoneNumber'] as String,
      purpose: jsonSerialization['purpose'] as String,
      vehicleNumber: jsonSerialization['vehicleNumber'] as String?,
      passcode: jsonSerialization['passcode'] as String?,
      status: _i2.VisitorStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      entryGate: jsonSerialization['entryGate'] as String,
      checkInTime: jsonSerialization['checkInTime'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['checkInTime'],
            ),
      checkOutTime: jsonSerialization['checkOutTime'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['checkOutTime'],
            ),
    );
  }

  static final t = VisitorEntryTable();

  static const db = VisitorEntryRepository._();

  @override
  int? id;

  int societyId;

  int? complexId;

  String flatNumber;

  String visitorName;

  String phoneNumber;

  String purpose;

  String? vehicleNumber;

  String? passcode;

  _i2.VisitorStatus status;

  String entryGate;

  DateTime? checkInTime;

  DateTime? checkOutTime;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [VisitorEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VisitorEntry copyWith({
    int? id,
    int? societyId,
    int? complexId,
    String? flatNumber,
    String? visitorName,
    String? phoneNumber,
    String? purpose,
    String? vehicleNumber,
    String? passcode,
    _i2.VisitorStatus? status,
    String? entryGate,
    DateTime? checkInTime,
    DateTime? checkOutTime,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VisitorEntry',
      if (id != null) 'id': id,
      'societyId': societyId,
      if (complexId != null) 'complexId': complexId,
      'flatNumber': flatNumber,
      'visitorName': visitorName,
      'phoneNumber': phoneNumber,
      'purpose': purpose,
      if (vehicleNumber != null) 'vehicleNumber': vehicleNumber,
      if (passcode != null) 'passcode': passcode,
      'status': status.toJson(),
      'entryGate': entryGate,
      if (checkInTime != null) 'checkInTime': checkInTime?.toJson(),
      if (checkOutTime != null) 'checkOutTime': checkOutTime?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'VisitorEntry',
      if (id != null) 'id': id,
      'societyId': societyId,
      if (complexId != null) 'complexId': complexId,
      'flatNumber': flatNumber,
      'visitorName': visitorName,
      'phoneNumber': phoneNumber,
      'purpose': purpose,
      if (vehicleNumber != null) 'vehicleNumber': vehicleNumber,
      if (passcode != null) 'passcode': passcode,
      'status': status.toJson(),
      'entryGate': entryGate,
      if (checkInTime != null) 'checkInTime': checkInTime?.toJson(),
      if (checkOutTime != null) 'checkOutTime': checkOutTime?.toJson(),
    };
  }

  static VisitorEntryInclude include() {
    return VisitorEntryInclude._();
  }

  static VisitorEntryIncludeList includeList({
    _i1.WhereExpressionBuilder<VisitorEntryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VisitorEntryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VisitorEntryTable>? orderByList,
    VisitorEntryInclude? include,
  }) {
    return VisitorEntryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(VisitorEntry.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(VisitorEntry.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VisitorEntryImpl extends VisitorEntry {
  _VisitorEntryImpl({
    int? id,
    required int societyId,
    int? complexId,
    required String flatNumber,
    required String visitorName,
    required String phoneNumber,
    required String purpose,
    String? vehicleNumber,
    String? passcode,
    required _i2.VisitorStatus status,
    required String entryGate,
    DateTime? checkInTime,
    DateTime? checkOutTime,
  }) : super._(
         id: id,
         societyId: societyId,
         complexId: complexId,
         flatNumber: flatNumber,
         visitorName: visitorName,
         phoneNumber: phoneNumber,
         purpose: purpose,
         vehicleNumber: vehicleNumber,
         passcode: passcode,
         status: status,
         entryGate: entryGate,
         checkInTime: checkInTime,
         checkOutTime: checkOutTime,
       );

  /// Returns a shallow copy of this [VisitorEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VisitorEntry copyWith({
    Object? id = _Undefined,
    int? societyId,
    Object? complexId = _Undefined,
    String? flatNumber,
    String? visitorName,
    String? phoneNumber,
    String? purpose,
    Object? vehicleNumber = _Undefined,
    Object? passcode = _Undefined,
    _i2.VisitorStatus? status,
    String? entryGate,
    Object? checkInTime = _Undefined,
    Object? checkOutTime = _Undefined,
  }) {
    return VisitorEntry(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      complexId: complexId is int? ? complexId : this.complexId,
      flatNumber: flatNumber ?? this.flatNumber,
      visitorName: visitorName ?? this.visitorName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      purpose: purpose ?? this.purpose,
      vehicleNumber: vehicleNumber is String?
          ? vehicleNumber
          : this.vehicleNumber,
      passcode: passcode is String? ? passcode : this.passcode,
      status: status ?? this.status,
      entryGate: entryGate ?? this.entryGate,
      checkInTime: checkInTime is DateTime? ? checkInTime : this.checkInTime,
      checkOutTime: checkOutTime is DateTime?
          ? checkOutTime
          : this.checkOutTime,
    );
  }
}

class VisitorEntryUpdateTable extends _i1.UpdateTable<VisitorEntryTable> {
  VisitorEntryUpdateTable(super.table);

  _i1.ColumnValue<int, int> societyId(int value) => _i1.ColumnValue(
    table.societyId,
    value,
  );

  _i1.ColumnValue<int, int> complexId(int? value) => _i1.ColumnValue(
    table.complexId,
    value,
  );

  _i1.ColumnValue<String, String> flatNumber(String value) => _i1.ColumnValue(
    table.flatNumber,
    value,
  );

  _i1.ColumnValue<String, String> visitorName(String value) => _i1.ColumnValue(
    table.visitorName,
    value,
  );

  _i1.ColumnValue<String, String> phoneNumber(String value) => _i1.ColumnValue(
    table.phoneNumber,
    value,
  );

  _i1.ColumnValue<String, String> purpose(String value) => _i1.ColumnValue(
    table.purpose,
    value,
  );

  _i1.ColumnValue<String, String> vehicleNumber(String? value) =>
      _i1.ColumnValue(
        table.vehicleNumber,
        value,
      );

  _i1.ColumnValue<String, String> passcode(String? value) => _i1.ColumnValue(
    table.passcode,
    value,
  );

  _i1.ColumnValue<_i2.VisitorStatus, _i2.VisitorStatus> status(
    _i2.VisitorStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<String, String> entryGate(String value) => _i1.ColumnValue(
    table.entryGate,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> checkInTime(DateTime? value) =>
      _i1.ColumnValue(
        table.checkInTime,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> checkOutTime(DateTime? value) =>
      _i1.ColumnValue(
        table.checkOutTime,
        value,
      );
}

class VisitorEntryTable extends _i1.Table<int?> {
  VisitorEntryTable({super.tableRelation}) : super(tableName: 'visitor_entry') {
    updateTable = VisitorEntryUpdateTable(this);
    societyId = _i1.ColumnInt(
      'societyId',
      this,
    );
    complexId = _i1.ColumnInt(
      'complexId',
      this,
    );
    flatNumber = _i1.ColumnString(
      'flatNumber',
      this,
    );
    visitorName = _i1.ColumnString(
      'visitorName',
      this,
    );
    phoneNumber = _i1.ColumnString(
      'phoneNumber',
      this,
    );
    purpose = _i1.ColumnString(
      'purpose',
      this,
    );
    vehicleNumber = _i1.ColumnString(
      'vehicleNumber',
      this,
    );
    passcode = _i1.ColumnString(
      'passcode',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
    entryGate = _i1.ColumnString(
      'entryGate',
      this,
    );
    checkInTime = _i1.ColumnDateTime(
      'checkInTime',
      this,
    );
    checkOutTime = _i1.ColumnDateTime(
      'checkOutTime',
      this,
    );
  }

  late final VisitorEntryUpdateTable updateTable;

  late final _i1.ColumnInt societyId;

  late final _i1.ColumnInt complexId;

  late final _i1.ColumnString flatNumber;

  late final _i1.ColumnString visitorName;

  late final _i1.ColumnString phoneNumber;

  late final _i1.ColumnString purpose;

  late final _i1.ColumnString vehicleNumber;

  late final _i1.ColumnString passcode;

  late final _i1.ColumnEnum<_i2.VisitorStatus> status;

  late final _i1.ColumnString entryGate;

  late final _i1.ColumnDateTime checkInTime;

  late final _i1.ColumnDateTime checkOutTime;

  @override
  List<_i1.Column> get columns => [
    id,
    societyId,
    complexId,
    flatNumber,
    visitorName,
    phoneNumber,
    purpose,
    vehicleNumber,
    passcode,
    status,
    entryGate,
    checkInTime,
    checkOutTime,
  ];
}

class VisitorEntryInclude extends _i1.IncludeObject {
  VisitorEntryInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => VisitorEntry.t;
}

class VisitorEntryIncludeList extends _i1.IncludeList {
  VisitorEntryIncludeList._({
    _i1.WhereExpressionBuilder<VisitorEntryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(VisitorEntry.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => VisitorEntry.t;
}

class VisitorEntryRepository {
  const VisitorEntryRepository._();

  /// Returns a list of [VisitorEntry]s matching the given query parameters.
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
  Future<List<VisitorEntry>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<VisitorEntryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VisitorEntryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VisitorEntryTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<VisitorEntry>(
      where: where?.call(VisitorEntry.t),
      orderBy: orderBy?.call(VisitorEntry.t),
      orderByList: orderByList?.call(VisitorEntry.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [VisitorEntry] matching the given query parameters.
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
  Future<VisitorEntry?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<VisitorEntryTable>? where,
    int? offset,
    _i1.OrderByBuilder<VisitorEntryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VisitorEntryTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<VisitorEntry>(
      where: where?.call(VisitorEntry.t),
      orderBy: orderBy?.call(VisitorEntry.t),
      orderByList: orderByList?.call(VisitorEntry.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [VisitorEntry] by its [id] or null if no such row exists.
  Future<VisitorEntry?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<VisitorEntry>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [VisitorEntry]s in the list and returns the inserted rows.
  ///
  /// The returned [VisitorEntry]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<VisitorEntry>> insert(
    _i1.DatabaseSession session,
    List<VisitorEntry> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<VisitorEntry>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [VisitorEntry] and returns the inserted row.
  ///
  /// The returned [VisitorEntry] will have its `id` field set.
  Future<VisitorEntry> insertRow(
    _i1.DatabaseSession session,
    VisitorEntry row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<VisitorEntry>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [VisitorEntry]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<VisitorEntry>> update(
    _i1.DatabaseSession session,
    List<VisitorEntry> rows, {
    _i1.ColumnSelections<VisitorEntryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<VisitorEntry>(
      rows,
      columns: columns?.call(VisitorEntry.t),
      transaction: transaction,
    );
  }

  /// Updates a single [VisitorEntry]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<VisitorEntry> updateRow(
    _i1.DatabaseSession session,
    VisitorEntry row, {
    _i1.ColumnSelections<VisitorEntryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<VisitorEntry>(
      row,
      columns: columns?.call(VisitorEntry.t),
      transaction: transaction,
    );
  }

  /// Updates a single [VisitorEntry] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<VisitorEntry?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<VisitorEntryUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<VisitorEntry>(
      id,
      columnValues: columnValues(VisitorEntry.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [VisitorEntry]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<VisitorEntry>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<VisitorEntryUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<VisitorEntryTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VisitorEntryTable>? orderBy,
    _i1.OrderByListBuilder<VisitorEntryTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<VisitorEntry>(
      columnValues: columnValues(VisitorEntry.t.updateTable),
      where: where(VisitorEntry.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(VisitorEntry.t),
      orderByList: orderByList?.call(VisitorEntry.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [VisitorEntry]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<VisitorEntry>> delete(
    _i1.DatabaseSession session,
    List<VisitorEntry> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<VisitorEntry>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [VisitorEntry].
  Future<VisitorEntry> deleteRow(
    _i1.DatabaseSession session,
    VisitorEntry row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<VisitorEntry>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<VisitorEntry>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<VisitorEntryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<VisitorEntry>(
      where: where(VisitorEntry.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<VisitorEntryTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<VisitorEntry>(
      where: where?.call(VisitorEntry.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [VisitorEntry] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<VisitorEntryTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<VisitorEntry>(
      where: where(VisitorEntry.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
