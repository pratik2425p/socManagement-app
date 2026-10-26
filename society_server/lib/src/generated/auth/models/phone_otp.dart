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

abstract class PhoneOtp
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  PhoneOtp._({
    this.id,
    required this.phone,
    required this.salt,
    required this.otpHash,
    required this.attempts,
    required this.maxAttempts,
    required this.expiresAt,
    required this.lastSentAt,
    this.ipAddress,
    required this.isUsed,
  });

  factory PhoneOtp({
    int? id,
    required String phone,
    required String salt,
    required String otpHash,
    required int attempts,
    required int maxAttempts,
    required DateTime expiresAt,
    required DateTime lastSentAt,
    String? ipAddress,
    required bool isUsed,
  }) = _PhoneOtpImpl;

  factory PhoneOtp.fromJson(Map<String, dynamic> jsonSerialization) {
    return PhoneOtp(
      id: jsonSerialization['id'] as int?,
      phone: jsonSerialization['phone'] as String,
      salt: jsonSerialization['salt'] as String,
      otpHash: jsonSerialization['otpHash'] as String,
      attempts: jsonSerialization['attempts'] as int,
      maxAttempts: jsonSerialization['maxAttempts'] as int,
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      lastSentAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['lastSentAt'],
      ),
      ipAddress: jsonSerialization['ipAddress'] as String?,
      isUsed: _i1.BoolJsonExtension.fromJson(jsonSerialization['isUsed']),
    );
  }

  static final t = PhoneOtpTable();

  static const db = PhoneOtpRepository._();

  @override
  int? id;

  String phone;

  String salt;

  String otpHash;

  int attempts;

  int maxAttempts;

  DateTime expiresAt;

  DateTime lastSentAt;

  String? ipAddress;

  bool isUsed;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [PhoneOtp]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PhoneOtp copyWith({
    int? id,
    String? phone,
    String? salt,
    String? otpHash,
    int? attempts,
    int? maxAttempts,
    DateTime? expiresAt,
    DateTime? lastSentAt,
    String? ipAddress,
    bool? isUsed,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PhoneOtp',
      if (id != null) 'id': id,
      'phone': phone,
      'salt': salt,
      'otpHash': otpHash,
      'attempts': attempts,
      'maxAttempts': maxAttempts,
      'expiresAt': expiresAt.toJson(),
      'lastSentAt': lastSentAt.toJson(),
      if (ipAddress != null) 'ipAddress': ipAddress,
      'isUsed': isUsed,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PhoneOtp',
      if (id != null) 'id': id,
      'phone': phone,
      'salt': salt,
      'otpHash': otpHash,
      'attempts': attempts,
      'maxAttempts': maxAttempts,
      'expiresAt': expiresAt.toJson(),
      'lastSentAt': lastSentAt.toJson(),
      if (ipAddress != null) 'ipAddress': ipAddress,
      'isUsed': isUsed,
    };
  }

  static PhoneOtpInclude include() {
    return PhoneOtpInclude._();
  }

  static PhoneOtpIncludeList includeList({
    _i1.WhereExpressionBuilder<PhoneOtpTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PhoneOtpTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PhoneOtpTable>? orderByList,
    PhoneOtpInclude? include,
  }) {
    return PhoneOtpIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PhoneOtp.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(PhoneOtp.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PhoneOtpImpl extends PhoneOtp {
  _PhoneOtpImpl({
    int? id,
    required String phone,
    required String salt,
    required String otpHash,
    required int attempts,
    required int maxAttempts,
    required DateTime expiresAt,
    required DateTime lastSentAt,
    String? ipAddress,
    required bool isUsed,
  }) : super._(
         id: id,
         phone: phone,
         salt: salt,
         otpHash: otpHash,
         attempts: attempts,
         maxAttempts: maxAttempts,
         expiresAt: expiresAt,
         lastSentAt: lastSentAt,
         ipAddress: ipAddress,
         isUsed: isUsed,
       );

  /// Returns a shallow copy of this [PhoneOtp]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PhoneOtp copyWith({
    Object? id = _Undefined,
    String? phone,
    String? salt,
    String? otpHash,
    int? attempts,
    int? maxAttempts,
    DateTime? expiresAt,
    DateTime? lastSentAt,
    Object? ipAddress = _Undefined,
    bool? isUsed,
  }) {
    return PhoneOtp(
      id: id is int? ? id : this.id,
      phone: phone ?? this.phone,
      salt: salt ?? this.salt,
      otpHash: otpHash ?? this.otpHash,
      attempts: attempts ?? this.attempts,
      maxAttempts: maxAttempts ?? this.maxAttempts,
      expiresAt: expiresAt ?? this.expiresAt,
      lastSentAt: lastSentAt ?? this.lastSentAt,
      ipAddress: ipAddress is String? ? ipAddress : this.ipAddress,
      isUsed: isUsed ?? this.isUsed,
    );
  }
}

class PhoneOtpUpdateTable extends _i1.UpdateTable<PhoneOtpTable> {
  PhoneOtpUpdateTable(super.table);

  _i1.ColumnValue<String, String> phone(String value) => _i1.ColumnValue(
    table.phone,
    value,
  );

  _i1.ColumnValue<String, String> salt(String value) => _i1.ColumnValue(
    table.salt,
    value,
  );

  _i1.ColumnValue<String, String> otpHash(String value) => _i1.ColumnValue(
    table.otpHash,
    value,
  );

  _i1.ColumnValue<int, int> attempts(int value) => _i1.ColumnValue(
    table.attempts,
    value,
  );

  _i1.ColumnValue<int, int> maxAttempts(int value) => _i1.ColumnValue(
    table.maxAttempts,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> expiresAt(DateTime value) =>
      _i1.ColumnValue(
        table.expiresAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> lastSentAt(DateTime value) =>
      _i1.ColumnValue(
        table.lastSentAt,
        value,
      );

  _i1.ColumnValue<String, String> ipAddress(String? value) => _i1.ColumnValue(
    table.ipAddress,
    value,
  );

  _i1.ColumnValue<bool, bool> isUsed(bool value) => _i1.ColumnValue(
    table.isUsed,
    value,
  );
}

class PhoneOtpTable extends _i1.Table<int?> {
  PhoneOtpTable({super.tableRelation}) : super(tableName: 'phone_otp') {
    updateTable = PhoneOtpUpdateTable(this);
    phone = _i1.ColumnString(
      'phone',
      this,
    );
    salt = _i1.ColumnString(
      'salt',
      this,
    );
    otpHash = _i1.ColumnString(
      'otpHash',
      this,
    );
    attempts = _i1.ColumnInt(
      'attempts',
      this,
    );
    maxAttempts = _i1.ColumnInt(
      'maxAttempts',
      this,
    );
    expiresAt = _i1.ColumnDateTime(
      'expiresAt',
      this,
    );
    lastSentAt = _i1.ColumnDateTime(
      'lastSentAt',
      this,
    );
    ipAddress = _i1.ColumnString(
      'ipAddress',
      this,
    );
    isUsed = _i1.ColumnBool(
      'isUsed',
      this,
    );
  }

  late final PhoneOtpUpdateTable updateTable;

  late final _i1.ColumnString phone;

  late final _i1.ColumnString salt;

  late final _i1.ColumnString otpHash;

  late final _i1.ColumnInt attempts;

  late final _i1.ColumnInt maxAttempts;

  late final _i1.ColumnDateTime expiresAt;

  late final _i1.ColumnDateTime lastSentAt;

  late final _i1.ColumnString ipAddress;

  late final _i1.ColumnBool isUsed;

  @override
  List<_i1.Column> get columns => [
    id,
    phone,
    salt,
    otpHash,
    attempts,
    maxAttempts,
    expiresAt,
    lastSentAt,
    ipAddress,
    isUsed,
  ];
}

class PhoneOtpInclude extends _i1.IncludeObject {
  PhoneOtpInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => PhoneOtp.t;
}

class PhoneOtpIncludeList extends _i1.IncludeList {
  PhoneOtpIncludeList._({
    _i1.WhereExpressionBuilder<PhoneOtpTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PhoneOtp.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => PhoneOtp.t;
}

class PhoneOtpRepository {
  const PhoneOtpRepository._();

  /// Returns a list of [PhoneOtp]s matching the given query parameters.
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
  Future<List<PhoneOtp>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PhoneOtpTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PhoneOtpTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PhoneOtpTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<PhoneOtp>(
      where: where?.call(PhoneOtp.t),
      orderBy: orderBy?.call(PhoneOtp.t),
      orderByList: orderByList?.call(PhoneOtp.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [PhoneOtp] matching the given query parameters.
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
  Future<PhoneOtp?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PhoneOtpTable>? where,
    int? offset,
    _i1.OrderByBuilder<PhoneOtpTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PhoneOtpTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<PhoneOtp>(
      where: where?.call(PhoneOtp.t),
      orderBy: orderBy?.call(PhoneOtp.t),
      orderByList: orderByList?.call(PhoneOtp.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [PhoneOtp] by its [id] or null if no such row exists.
  Future<PhoneOtp?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<PhoneOtp>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [PhoneOtp]s in the list and returns the inserted rows.
  ///
  /// The returned [PhoneOtp]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<PhoneOtp>> insert(
    _i1.DatabaseSession session,
    List<PhoneOtp> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<PhoneOtp>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [PhoneOtp] and returns the inserted row.
  ///
  /// The returned [PhoneOtp] will have its `id` field set.
  Future<PhoneOtp> insertRow(
    _i1.DatabaseSession session,
    PhoneOtp row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<PhoneOtp>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [PhoneOtp]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<PhoneOtp>> update(
    _i1.DatabaseSession session,
    List<PhoneOtp> rows, {
    _i1.ColumnSelections<PhoneOtpTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<PhoneOtp>(
      rows,
      columns: columns?.call(PhoneOtp.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PhoneOtp]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PhoneOtp> updateRow(
    _i1.DatabaseSession session,
    PhoneOtp row, {
    _i1.ColumnSelections<PhoneOtpTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<PhoneOtp>(
      row,
      columns: columns?.call(PhoneOtp.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PhoneOtp] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PhoneOtp?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<PhoneOtpUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<PhoneOtp>(
      id,
      columnValues: columnValues(PhoneOtp.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PhoneOtp]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<PhoneOtp>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<PhoneOtpUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<PhoneOtpTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PhoneOtpTable>? orderBy,
    _i1.OrderByListBuilder<PhoneOtpTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<PhoneOtp>(
      columnValues: columnValues(PhoneOtp.t.updateTable),
      where: where(PhoneOtp.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PhoneOtp.t),
      orderByList: orderByList?.call(PhoneOtp.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [PhoneOtp]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<PhoneOtp>> delete(
    _i1.DatabaseSession session,
    List<PhoneOtp> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PhoneOtp>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [PhoneOtp].
  Future<PhoneOtp> deleteRow(
    _i1.DatabaseSession session,
    PhoneOtp row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PhoneOtp>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<PhoneOtp>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<PhoneOtpTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<PhoneOtp>(
      where: where(PhoneOtp.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<PhoneOtpTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PhoneOtp>(
      where: where?.call(PhoneOtp.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [PhoneOtp] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<PhoneOtpTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<PhoneOtp>(
      where: where(PhoneOtp.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
