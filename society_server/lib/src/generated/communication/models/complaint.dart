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
import '../../communication/models/complaint_status.dart' as _i2;

abstract class Complaint
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Complaint._({
    this.id,
    required this.societyId,
    required this.flatNumber,
    required this.reportedByName,
    required this.title,
    required this.description,
    required this.category,
    required this.status,
    this.assignedTo,
    this.resolutionNotes,
    required this.createdAt,
    this.resolvedAt,
  });

  factory Complaint({
    int? id,
    required int societyId,
    required String flatNumber,
    required String reportedByName,
    required String title,
    required String description,
    required String category,
    required _i2.ComplaintStatus status,
    String? assignedTo,
    String? resolutionNotes,
    required DateTime createdAt,
    DateTime? resolvedAt,
  }) = _ComplaintImpl;

  factory Complaint.fromJson(Map<String, dynamic> jsonSerialization) {
    return Complaint(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      flatNumber: jsonSerialization['flatNumber'] as String,
      reportedByName: jsonSerialization['reportedByName'] as String,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      category: jsonSerialization['category'] as String,
      status: _i2.ComplaintStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      assignedTo: jsonSerialization['assignedTo'] as String?,
      resolutionNotes: jsonSerialization['resolutionNotes'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      resolvedAt: jsonSerialization['resolvedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['resolvedAt']),
    );
  }

  static final t = ComplaintTable();

  static const db = ComplaintRepository._();

  @override
  int? id;

  int societyId;

  String flatNumber;

  String reportedByName;

  String title;

  String description;

  String category;

  _i2.ComplaintStatus status;

  String? assignedTo;

  String? resolutionNotes;

  DateTime createdAt;

  DateTime? resolvedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Complaint]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Complaint copyWith({
    int? id,
    int? societyId,
    String? flatNumber,
    String? reportedByName,
    String? title,
    String? description,
    String? category,
    _i2.ComplaintStatus? status,
    String? assignedTo,
    String? resolutionNotes,
    DateTime? createdAt,
    DateTime? resolvedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Complaint',
      if (id != null) 'id': id,
      'societyId': societyId,
      'flatNumber': flatNumber,
      'reportedByName': reportedByName,
      'title': title,
      'description': description,
      'category': category,
      'status': status.toJson(),
      if (assignedTo != null) 'assignedTo': assignedTo,
      if (resolutionNotes != null) 'resolutionNotes': resolutionNotes,
      'createdAt': createdAt.toJson(),
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Complaint',
      if (id != null) 'id': id,
      'societyId': societyId,
      'flatNumber': flatNumber,
      'reportedByName': reportedByName,
      'title': title,
      'description': description,
      'category': category,
      'status': status.toJson(),
      if (assignedTo != null) 'assignedTo': assignedTo,
      if (resolutionNotes != null) 'resolutionNotes': resolutionNotes,
      'createdAt': createdAt.toJson(),
      if (resolvedAt != null) 'resolvedAt': resolvedAt?.toJson(),
    };
  }

  static ComplaintInclude include() {
    return ComplaintInclude._();
  }

  static ComplaintIncludeList includeList({
    _i1.WhereExpressionBuilder<ComplaintTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ComplaintTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ComplaintTable>? orderByList,
    ComplaintInclude? include,
  }) {
    return ComplaintIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Complaint.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Complaint.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ComplaintImpl extends Complaint {
  _ComplaintImpl({
    int? id,
    required int societyId,
    required String flatNumber,
    required String reportedByName,
    required String title,
    required String description,
    required String category,
    required _i2.ComplaintStatus status,
    String? assignedTo,
    String? resolutionNotes,
    required DateTime createdAt,
    DateTime? resolvedAt,
  }) : super._(
         id: id,
         societyId: societyId,
         flatNumber: flatNumber,
         reportedByName: reportedByName,
         title: title,
         description: description,
         category: category,
         status: status,
         assignedTo: assignedTo,
         resolutionNotes: resolutionNotes,
         createdAt: createdAt,
         resolvedAt: resolvedAt,
       );

  /// Returns a shallow copy of this [Complaint]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Complaint copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? flatNumber,
    String? reportedByName,
    String? title,
    String? description,
    String? category,
    _i2.ComplaintStatus? status,
    Object? assignedTo = _Undefined,
    Object? resolutionNotes = _Undefined,
    DateTime? createdAt,
    Object? resolvedAt = _Undefined,
  }) {
    return Complaint(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      flatNumber: flatNumber ?? this.flatNumber,
      reportedByName: reportedByName ?? this.reportedByName,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      status: status ?? this.status,
      assignedTo: assignedTo is String? ? assignedTo : this.assignedTo,
      resolutionNotes: resolutionNotes is String?
          ? resolutionNotes
          : this.resolutionNotes,
      createdAt: createdAt ?? this.createdAt,
      resolvedAt: resolvedAt is DateTime? ? resolvedAt : this.resolvedAt,
    );
  }
}

class ComplaintUpdateTable extends _i1.UpdateTable<ComplaintTable> {
  ComplaintUpdateTable(super.table);

  _i1.ColumnValue<int, int> societyId(int value) => _i1.ColumnValue(
    table.societyId,
    value,
  );

  _i1.ColumnValue<String, String> flatNumber(String value) => _i1.ColumnValue(
    table.flatNumber,
    value,
  );

  _i1.ColumnValue<String, String> reportedByName(String value) =>
      _i1.ColumnValue(
        table.reportedByName,
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

  _i1.ColumnValue<String, String> category(String value) => _i1.ColumnValue(
    table.category,
    value,
  );

  _i1.ColumnValue<_i2.ComplaintStatus, _i2.ComplaintStatus> status(
    _i2.ComplaintStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<String, String> assignedTo(String? value) => _i1.ColumnValue(
    table.assignedTo,
    value,
  );

  _i1.ColumnValue<String, String> resolutionNotes(String? value) =>
      _i1.ColumnValue(
        table.resolutionNotes,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> resolvedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.resolvedAt,
        value,
      );
}

class ComplaintTable extends _i1.Table<int?> {
  ComplaintTable({super.tableRelation}) : super(tableName: 'complaint') {
    updateTable = ComplaintUpdateTable(this);
    societyId = _i1.ColumnInt(
      'societyId',
      this,
    );
    flatNumber = _i1.ColumnString(
      'flatNumber',
      this,
    );
    reportedByName = _i1.ColumnString(
      'reportedByName',
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
    category = _i1.ColumnString(
      'category',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
    assignedTo = _i1.ColumnString(
      'assignedTo',
      this,
    );
    resolutionNotes = _i1.ColumnString(
      'resolutionNotes',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    resolvedAt = _i1.ColumnDateTime(
      'resolvedAt',
      this,
    );
  }

  late final ComplaintUpdateTable updateTable;

  late final _i1.ColumnInt societyId;

  late final _i1.ColumnString flatNumber;

  late final _i1.ColumnString reportedByName;

  late final _i1.ColumnString title;

  late final _i1.ColumnString description;

  late final _i1.ColumnString category;

  late final _i1.ColumnEnum<_i2.ComplaintStatus> status;

  late final _i1.ColumnString assignedTo;

  late final _i1.ColumnString resolutionNotes;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime resolvedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    societyId,
    flatNumber,
    reportedByName,
    title,
    description,
    category,
    status,
    assignedTo,
    resolutionNotes,
    createdAt,
    resolvedAt,
  ];
}

class ComplaintInclude extends _i1.IncludeObject {
  ComplaintInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Complaint.t;
}

class ComplaintIncludeList extends _i1.IncludeList {
  ComplaintIncludeList._({
    _i1.WhereExpressionBuilder<ComplaintTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Complaint.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Complaint.t;
}

class ComplaintRepository {
  const ComplaintRepository._();

  /// Returns a list of [Complaint]s matching the given query parameters.
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
  Future<List<Complaint>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ComplaintTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ComplaintTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ComplaintTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Complaint>(
      where: where?.call(Complaint.t),
      orderBy: orderBy?.call(Complaint.t),
      orderByList: orderByList?.call(Complaint.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Complaint] matching the given query parameters.
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
  Future<Complaint?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ComplaintTable>? where,
    int? offset,
    _i1.OrderByBuilder<ComplaintTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ComplaintTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Complaint>(
      where: where?.call(Complaint.t),
      orderBy: orderBy?.call(Complaint.t),
      orderByList: orderByList?.call(Complaint.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Complaint] by its [id] or null if no such row exists.
  Future<Complaint?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Complaint>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Complaint]s in the list and returns the inserted rows.
  ///
  /// The returned [Complaint]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Complaint>> insert(
    _i1.DatabaseSession session,
    List<Complaint> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Complaint>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Complaint] and returns the inserted row.
  ///
  /// The returned [Complaint] will have its `id` field set.
  Future<Complaint> insertRow(
    _i1.DatabaseSession session,
    Complaint row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Complaint>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Complaint]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Complaint>> update(
    _i1.DatabaseSession session,
    List<Complaint> rows, {
    _i1.ColumnSelections<ComplaintTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Complaint>(
      rows,
      columns: columns?.call(Complaint.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Complaint]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Complaint> updateRow(
    _i1.DatabaseSession session,
    Complaint row, {
    _i1.ColumnSelections<ComplaintTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Complaint>(
      row,
      columns: columns?.call(Complaint.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Complaint] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Complaint?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<ComplaintUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Complaint>(
      id,
      columnValues: columnValues(Complaint.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Complaint]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Complaint>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<ComplaintUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ComplaintTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ComplaintTable>? orderBy,
    _i1.OrderByListBuilder<ComplaintTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Complaint>(
      columnValues: columnValues(Complaint.t.updateTable),
      where: where(Complaint.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Complaint.t),
      orderByList: orderByList?.call(Complaint.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Complaint]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Complaint>> delete(
    _i1.DatabaseSession session,
    List<Complaint> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Complaint>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Complaint].
  Future<Complaint> deleteRow(
    _i1.DatabaseSession session,
    Complaint row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Complaint>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Complaint>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ComplaintTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Complaint>(
      where: where(Complaint.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<ComplaintTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Complaint>(
      where: where?.call(Complaint.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Complaint] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<ComplaintTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Complaint>(
      where: where(Complaint.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
