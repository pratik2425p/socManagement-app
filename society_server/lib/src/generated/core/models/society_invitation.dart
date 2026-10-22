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
import '../../core/models/user_role.dart' as _i2;

abstract class SocietyInvitation
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  SocietyInvitation._({
    this.id,
    required this.societyId,
    required this.flatNumber,
    required this.inviteeName,
    required this.phone,
    this.email,
    required this.role,
    required this.occupancyType,
    required this.inviteCode,
    required this.status,
    required this.expiresAt,
    required this.createdAt,
  });

  factory SocietyInvitation({
    int? id,
    required int societyId,
    required String flatNumber,
    required String inviteeName,
    required String phone,
    String? email,
    required _i2.UserRole role,
    required String occupancyType,
    required String inviteCode,
    required String status,
    required DateTime expiresAt,
    required DateTime createdAt,
  }) = _SocietyInvitationImpl;

  factory SocietyInvitation.fromJson(Map<String, dynamic> jsonSerialization) {
    return SocietyInvitation(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      flatNumber: jsonSerialization['flatNumber'] as String,
      inviteeName: jsonSerialization['inviteeName'] as String,
      phone: jsonSerialization['phone'] as String,
      email: jsonSerialization['email'] as String?,
      role: _i2.UserRole.fromJson((jsonSerialization['role'] as String)),
      occupancyType: jsonSerialization['occupancyType'] as String,
      inviteCode: jsonSerialization['inviteCode'] as String,
      status: jsonSerialization['status'] as String,
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = SocietyInvitationTable();

  static const db = SocietyInvitationRepository._();

  @override
  int? id;

  int societyId;

  String flatNumber;

  String inviteeName;

  String phone;

  String? email;

  _i2.UserRole role;

  String occupancyType;

  String inviteCode;

  String status;

  DateTime expiresAt;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [SocietyInvitation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SocietyInvitation copyWith({
    int? id,
    int? societyId,
    String? flatNumber,
    String? inviteeName,
    String? phone,
    String? email,
    _i2.UserRole? role,
    String? occupancyType,
    String? inviteCode,
    String? status,
    DateTime? expiresAt,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SocietyInvitation',
      if (id != null) 'id': id,
      'societyId': societyId,
      'flatNumber': flatNumber,
      'inviteeName': inviteeName,
      'phone': phone,
      if (email != null) 'email': email,
      'role': role.toJson(),
      'occupancyType': occupancyType,
      'inviteCode': inviteCode,
      'status': status,
      'expiresAt': expiresAt.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SocietyInvitation',
      if (id != null) 'id': id,
      'societyId': societyId,
      'flatNumber': flatNumber,
      'inviteeName': inviteeName,
      'phone': phone,
      if (email != null) 'email': email,
      'role': role.toJson(),
      'occupancyType': occupancyType,
      'inviteCode': inviteCode,
      'status': status,
      'expiresAt': expiresAt.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static SocietyInvitationInclude include() {
    return SocietyInvitationInclude._();
  }

  static SocietyInvitationIncludeList includeList({
    _i1.WhereExpressionBuilder<SocietyInvitationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SocietyInvitationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SocietyInvitationTable>? orderByList,
    SocietyInvitationInclude? include,
  }) {
    return SocietyInvitationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SocietyInvitation.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SocietyInvitation.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SocietyInvitationImpl extends SocietyInvitation {
  _SocietyInvitationImpl({
    int? id,
    required int societyId,
    required String flatNumber,
    required String inviteeName,
    required String phone,
    String? email,
    required _i2.UserRole role,
    required String occupancyType,
    required String inviteCode,
    required String status,
    required DateTime expiresAt,
    required DateTime createdAt,
  }) : super._(
         id: id,
         societyId: societyId,
         flatNumber: flatNumber,
         inviteeName: inviteeName,
         phone: phone,
         email: email,
         role: role,
         occupancyType: occupancyType,
         inviteCode: inviteCode,
         status: status,
         expiresAt: expiresAt,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [SocietyInvitation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SocietyInvitation copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? flatNumber,
    String? inviteeName,
    String? phone,
    Object? email = _Undefined,
    _i2.UserRole? role,
    String? occupancyType,
    String? inviteCode,
    String? status,
    DateTime? expiresAt,
    DateTime? createdAt,
  }) {
    return SocietyInvitation(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      flatNumber: flatNumber ?? this.flatNumber,
      inviteeName: inviteeName ?? this.inviteeName,
      phone: phone ?? this.phone,
      email: email is String? ? email : this.email,
      role: role ?? this.role,
      occupancyType: occupancyType ?? this.occupancyType,
      inviteCode: inviteCode ?? this.inviteCode,
      status: status ?? this.status,
      expiresAt: expiresAt ?? this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class SocietyInvitationUpdateTable
    extends _i1.UpdateTable<SocietyInvitationTable> {
  SocietyInvitationUpdateTable(super.table);

  _i1.ColumnValue<int, int> societyId(int value) => _i1.ColumnValue(
    table.societyId,
    value,
  );

  _i1.ColumnValue<String, String> flatNumber(String value) => _i1.ColumnValue(
    table.flatNumber,
    value,
  );

  _i1.ColumnValue<String, String> inviteeName(String value) => _i1.ColumnValue(
    table.inviteeName,
    value,
  );

  _i1.ColumnValue<String, String> phone(String value) => _i1.ColumnValue(
    table.phone,
    value,
  );

  _i1.ColumnValue<String, String> email(String? value) => _i1.ColumnValue(
    table.email,
    value,
  );

  _i1.ColumnValue<_i2.UserRole, _i2.UserRole> role(_i2.UserRole value) =>
      _i1.ColumnValue(
        table.role,
        value,
      );

  _i1.ColumnValue<String, String> occupancyType(String value) =>
      _i1.ColumnValue(
        table.occupancyType,
        value,
      );

  _i1.ColumnValue<String, String> inviteCode(String value) => _i1.ColumnValue(
    table.inviteCode,
    value,
  );

  _i1.ColumnValue<String, String> status(String value) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> expiresAt(DateTime value) =>
      _i1.ColumnValue(
        table.expiresAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class SocietyInvitationTable extends _i1.Table<int?> {
  SocietyInvitationTable({super.tableRelation})
    : super(tableName: 'society_invitation') {
    updateTable = SocietyInvitationUpdateTable(this);
    societyId = _i1.ColumnInt(
      'societyId',
      this,
    );
    flatNumber = _i1.ColumnString(
      'flatNumber',
      this,
    );
    inviteeName = _i1.ColumnString(
      'inviteeName',
      this,
    );
    phone = _i1.ColumnString(
      'phone',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    role = _i1.ColumnEnum(
      'role',
      this,
      _i1.EnumSerialization.byName,
    );
    occupancyType = _i1.ColumnString(
      'occupancyType',
      this,
    );
    inviteCode = _i1.ColumnString(
      'inviteCode',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    expiresAt = _i1.ColumnDateTime(
      'expiresAt',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final SocietyInvitationUpdateTable updateTable;

  late final _i1.ColumnInt societyId;

  late final _i1.ColumnString flatNumber;

  late final _i1.ColumnString inviteeName;

  late final _i1.ColumnString phone;

  late final _i1.ColumnString email;

  late final _i1.ColumnEnum<_i2.UserRole> role;

  late final _i1.ColumnString occupancyType;

  late final _i1.ColumnString inviteCode;

  late final _i1.ColumnString status;

  late final _i1.ColumnDateTime expiresAt;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    societyId,
    flatNumber,
    inviteeName,
    phone,
    email,
    role,
    occupancyType,
    inviteCode,
    status,
    expiresAt,
    createdAt,
  ];
}

class SocietyInvitationInclude extends _i1.IncludeObject {
  SocietyInvitationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => SocietyInvitation.t;
}

class SocietyInvitationIncludeList extends _i1.IncludeList {
  SocietyInvitationIncludeList._({
    _i1.WhereExpressionBuilder<SocietyInvitationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SocietyInvitation.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => SocietyInvitation.t;
}

class SocietyInvitationRepository {
  const SocietyInvitationRepository._();

  /// Returns a list of [SocietyInvitation]s matching the given query parameters.
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
  Future<List<SocietyInvitation>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SocietyInvitationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SocietyInvitationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SocietyInvitationTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<SocietyInvitation>(
      where: where?.call(SocietyInvitation.t),
      orderBy: orderBy?.call(SocietyInvitation.t),
      orderByList: orderByList?.call(SocietyInvitation.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [SocietyInvitation] matching the given query parameters.
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
  Future<SocietyInvitation?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SocietyInvitationTable>? where,
    int? offset,
    _i1.OrderByBuilder<SocietyInvitationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SocietyInvitationTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<SocietyInvitation>(
      where: where?.call(SocietyInvitation.t),
      orderBy: orderBy?.call(SocietyInvitation.t),
      orderByList: orderByList?.call(SocietyInvitation.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [SocietyInvitation] by its [id] or null if no such row exists.
  Future<SocietyInvitation?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<SocietyInvitation>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [SocietyInvitation]s in the list and returns the inserted rows.
  ///
  /// The returned [SocietyInvitation]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<SocietyInvitation>> insert(
    _i1.DatabaseSession session,
    List<SocietyInvitation> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<SocietyInvitation>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [SocietyInvitation] and returns the inserted row.
  ///
  /// The returned [SocietyInvitation] will have its `id` field set.
  Future<SocietyInvitation> insertRow(
    _i1.DatabaseSession session,
    SocietyInvitation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SocietyInvitation>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SocietyInvitation]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SocietyInvitation>> update(
    _i1.DatabaseSession session,
    List<SocietyInvitation> rows, {
    _i1.ColumnSelections<SocietyInvitationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SocietyInvitation>(
      rows,
      columns: columns?.call(SocietyInvitation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SocietyInvitation]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SocietyInvitation> updateRow(
    _i1.DatabaseSession session,
    SocietyInvitation row, {
    _i1.ColumnSelections<SocietyInvitationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SocietyInvitation>(
      row,
      columns: columns?.call(SocietyInvitation.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SocietyInvitation] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<SocietyInvitation?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<SocietyInvitationUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<SocietyInvitation>(
      id,
      columnValues: columnValues(SocietyInvitation.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [SocietyInvitation]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<SocietyInvitation>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<SocietyInvitationUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<SocietyInvitationTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SocietyInvitationTable>? orderBy,
    _i1.OrderByListBuilder<SocietyInvitationTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<SocietyInvitation>(
      columnValues: columnValues(SocietyInvitation.t.updateTable),
      where: where(SocietyInvitation.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SocietyInvitation.t),
      orderByList: orderByList?.call(SocietyInvitation.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [SocietyInvitation]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SocietyInvitation>> delete(
    _i1.DatabaseSession session,
    List<SocietyInvitation> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SocietyInvitation>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SocietyInvitation].
  Future<SocietyInvitation> deleteRow(
    _i1.DatabaseSession session,
    SocietyInvitation row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SocietyInvitation>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SocietyInvitation>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<SocietyInvitationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SocietyInvitation>(
      where: where(SocietyInvitation.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SocietyInvitationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SocietyInvitation>(
      where: where?.call(SocietyInvitation.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [SocietyInvitation] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<SocietyInvitationTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<SocietyInvitation>(
      where: where(SocietyInvitation.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
