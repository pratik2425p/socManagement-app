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

abstract class SocietyUser
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  SocietyUser._({
    this.id,
    required this.societyId,
    this.authUserId,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.role,
    this.flatNumber,
    required this.status,
    required this.createdAt,
  });

  factory SocietyUser({
    int? id,
    required int societyId,
    String? authUserId,
    required String fullName,
    required String phone,
    required String email,
    required _i2.UserRole role,
    String? flatNumber,
    required String status,
    required DateTime createdAt,
  }) = _SocietyUserImpl;

  factory SocietyUser.fromJson(Map<String, dynamic> jsonSerialization) {
    return SocietyUser(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      authUserId: jsonSerialization['authUserId'] as String?,
      fullName: jsonSerialization['fullName'] as String,
      phone: jsonSerialization['phone'] as String,
      email: jsonSerialization['email'] as String,
      role: _i2.UserRole.fromJson((jsonSerialization['role'] as String)),
      flatNumber: jsonSerialization['flatNumber'] as String?,
      status: jsonSerialization['status'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = SocietyUserTable();

  static const db = SocietyUserRepository._();

  @override
  int? id;

  int societyId;

  String? authUserId;

  String fullName;

  String phone;

  String email;

  _i2.UserRole role;

  String? flatNumber;

  String status;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [SocietyUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SocietyUser copyWith({
    int? id,
    int? societyId,
    String? authUserId,
    String? fullName,
    String? phone,
    String? email,
    _i2.UserRole? role,
    String? flatNumber,
    String? status,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SocietyUser',
      if (id != null) 'id': id,
      'societyId': societyId,
      if (authUserId != null) 'authUserId': authUserId,
      'fullName': fullName,
      'phone': phone,
      'email': email,
      'role': role.toJson(),
      if (flatNumber != null) 'flatNumber': flatNumber,
      'status': status,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SocietyUser',
      if (id != null) 'id': id,
      'societyId': societyId,
      if (authUserId != null) 'authUserId': authUserId,
      'fullName': fullName,
      'phone': phone,
      'email': email,
      'role': role.toJson(),
      if (flatNumber != null) 'flatNumber': flatNumber,
      'status': status,
      'createdAt': createdAt.toJson(),
    };
  }

  static SocietyUserInclude include() {
    return SocietyUserInclude._();
  }

  static SocietyUserIncludeList includeList({
    _i1.WhereExpressionBuilder<SocietyUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SocietyUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SocietyUserTable>? orderByList,
    SocietyUserInclude? include,
  }) {
    return SocietyUserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SocietyUser.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SocietyUser.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SocietyUserImpl extends SocietyUser {
  _SocietyUserImpl({
    int? id,
    required int societyId,
    String? authUserId,
    required String fullName,
    required String phone,
    required String email,
    required _i2.UserRole role,
    String? flatNumber,
    required String status,
    required DateTime createdAt,
  }) : super._(
         id: id,
         societyId: societyId,
         authUserId: authUserId,
         fullName: fullName,
         phone: phone,
         email: email,
         role: role,
         flatNumber: flatNumber,
         status: status,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [SocietyUser]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SocietyUser copyWith({
    Object? id = _Undefined,
    int? societyId,
    Object? authUserId = _Undefined,
    String? fullName,
    String? phone,
    String? email,
    _i2.UserRole? role,
    Object? flatNumber = _Undefined,
    String? status,
    DateTime? createdAt,
  }) {
    return SocietyUser(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      authUserId: authUserId is String? ? authUserId : this.authUserId,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      role: role ?? this.role,
      flatNumber: flatNumber is String? ? flatNumber : this.flatNumber,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class SocietyUserUpdateTable extends _i1.UpdateTable<SocietyUserTable> {
  SocietyUserUpdateTable(super.table);

  _i1.ColumnValue<int, int> societyId(int value) => _i1.ColumnValue(
    table.societyId,
    value,
  );

  _i1.ColumnValue<String, String> authUserId(String? value) => _i1.ColumnValue(
    table.authUserId,
    value,
  );

  _i1.ColumnValue<String, String> fullName(String value) => _i1.ColumnValue(
    table.fullName,
    value,
  );

  _i1.ColumnValue<String, String> phone(String value) => _i1.ColumnValue(
    table.phone,
    value,
  );

  _i1.ColumnValue<String, String> email(String value) => _i1.ColumnValue(
    table.email,
    value,
  );

  _i1.ColumnValue<_i2.UserRole, _i2.UserRole> role(_i2.UserRole value) =>
      _i1.ColumnValue(
        table.role,
        value,
      );

  _i1.ColumnValue<String, String> flatNumber(String? value) => _i1.ColumnValue(
    table.flatNumber,
    value,
  );

  _i1.ColumnValue<String, String> status(String value) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class SocietyUserTable extends _i1.Table<int?> {
  SocietyUserTable({super.tableRelation}) : super(tableName: 'society_user') {
    updateTable = SocietyUserUpdateTable(this);
    societyId = _i1.ColumnInt(
      'societyId',
      this,
    );
    authUserId = _i1.ColumnString(
      'authUserId',
      this,
    );
    fullName = _i1.ColumnString(
      'fullName',
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
    flatNumber = _i1.ColumnString(
      'flatNumber',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final SocietyUserUpdateTable updateTable;

  late final _i1.ColumnInt societyId;

  late final _i1.ColumnString authUserId;

  late final _i1.ColumnString fullName;

  late final _i1.ColumnString phone;

  late final _i1.ColumnString email;

  late final _i1.ColumnEnum<_i2.UserRole> role;

  late final _i1.ColumnString flatNumber;

  late final _i1.ColumnString status;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    societyId,
    authUserId,
    fullName,
    phone,
    email,
    role,
    flatNumber,
    status,
    createdAt,
  ];
}

class SocietyUserInclude extends _i1.IncludeObject {
  SocietyUserInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => SocietyUser.t;
}

class SocietyUserIncludeList extends _i1.IncludeList {
  SocietyUserIncludeList._({
    _i1.WhereExpressionBuilder<SocietyUserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SocietyUser.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => SocietyUser.t;
}

class SocietyUserRepository {
  const SocietyUserRepository._();

  /// Returns a list of [SocietyUser]s matching the given query parameters.
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
  Future<List<SocietyUser>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SocietyUserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SocietyUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SocietyUserTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<SocietyUser>(
      where: where?.call(SocietyUser.t),
      orderBy: orderBy?.call(SocietyUser.t),
      orderByList: orderByList?.call(SocietyUser.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [SocietyUser] matching the given query parameters.
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
  Future<SocietyUser?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SocietyUserTable>? where,
    int? offset,
    _i1.OrderByBuilder<SocietyUserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SocietyUserTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<SocietyUser>(
      where: where?.call(SocietyUser.t),
      orderBy: orderBy?.call(SocietyUser.t),
      orderByList: orderByList?.call(SocietyUser.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [SocietyUser] by its [id] or null if no such row exists.
  Future<SocietyUser?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<SocietyUser>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [SocietyUser]s in the list and returns the inserted rows.
  ///
  /// The returned [SocietyUser]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<SocietyUser>> insert(
    _i1.DatabaseSession session,
    List<SocietyUser> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<SocietyUser>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [SocietyUser] and returns the inserted row.
  ///
  /// The returned [SocietyUser] will have its `id` field set.
  Future<SocietyUser> insertRow(
    _i1.DatabaseSession session,
    SocietyUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SocietyUser>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SocietyUser]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SocietyUser>> update(
    _i1.DatabaseSession session,
    List<SocietyUser> rows, {
    _i1.ColumnSelections<SocietyUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SocietyUser>(
      rows,
      columns: columns?.call(SocietyUser.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SocietyUser]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SocietyUser> updateRow(
    _i1.DatabaseSession session,
    SocietyUser row, {
    _i1.ColumnSelections<SocietyUserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SocietyUser>(
      row,
      columns: columns?.call(SocietyUser.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SocietyUser] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<SocietyUser?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<SocietyUserUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<SocietyUser>(
      id,
      columnValues: columnValues(SocietyUser.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [SocietyUser]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<SocietyUser>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<SocietyUserUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<SocietyUserTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SocietyUserTable>? orderBy,
    _i1.OrderByListBuilder<SocietyUserTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<SocietyUser>(
      columnValues: columnValues(SocietyUser.t.updateTable),
      where: where(SocietyUser.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SocietyUser.t),
      orderByList: orderByList?.call(SocietyUser.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [SocietyUser]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SocietyUser>> delete(
    _i1.DatabaseSession session,
    List<SocietyUser> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SocietyUser>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SocietyUser].
  Future<SocietyUser> deleteRow(
    _i1.DatabaseSession session,
    SocietyUser row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SocietyUser>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SocietyUser>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<SocietyUserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SocietyUser>(
      where: where(SocietyUser.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SocietyUserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SocietyUser>(
      where: where?.call(SocietyUser.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [SocietyUser] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<SocietyUserTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<SocietyUser>(
      where: where(SocietyUser.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
