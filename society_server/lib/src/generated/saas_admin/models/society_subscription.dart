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
import '../../saas_admin/models/subscription_tier.dart' as _i2;

abstract class SocietySubscription
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  SocietySubscription._({
    this.id,
    required this.societyId,
    required this.societyName,
    required this.tier,
    required this.flatCount,
    required this.ratePerFlat,
    required this.monthlyTotal,
    required this.billingCycle,
    required this.status,
    required this.nextRenewalDate,
    required this.contactEmail,
    required this.contactPhone,
    required this.createdAt,
  });

  factory SocietySubscription({
    int? id,
    required int societyId,
    required String societyName,
    required _i2.SubscriptionTier tier,
    required int flatCount,
    required double ratePerFlat,
    required double monthlyTotal,
    required String billingCycle,
    required String status,
    required DateTime nextRenewalDate,
    required String contactEmail,
    required String contactPhone,
    required DateTime createdAt,
  }) = _SocietySubscriptionImpl;

  factory SocietySubscription.fromJson(Map<String, dynamic> jsonSerialization) {
    return SocietySubscription(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      societyName: jsonSerialization['societyName'] as String,
      tier: _i2.SubscriptionTier.fromJson(
        (jsonSerialization['tier'] as String),
      ),
      flatCount: jsonSerialization['flatCount'] as int,
      ratePerFlat: (jsonSerialization['ratePerFlat'] as num).toDouble(),
      monthlyTotal: (jsonSerialization['monthlyTotal'] as num).toDouble(),
      billingCycle: jsonSerialization['billingCycle'] as String,
      status: jsonSerialization['status'] as String,
      nextRenewalDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['nextRenewalDate'],
      ),
      contactEmail: jsonSerialization['contactEmail'] as String,
      contactPhone: jsonSerialization['contactPhone'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = SocietySubscriptionTable();

  static const db = SocietySubscriptionRepository._();

  @override
  int? id;

  int societyId;

  String societyName;

  _i2.SubscriptionTier tier;

  int flatCount;

  double ratePerFlat;

  double monthlyTotal;

  String billingCycle;

  String status;

  DateTime nextRenewalDate;

  String contactEmail;

  String contactPhone;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [SocietySubscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SocietySubscription copyWith({
    int? id,
    int? societyId,
    String? societyName,
    _i2.SubscriptionTier? tier,
    int? flatCount,
    double? ratePerFlat,
    double? monthlyTotal,
    String? billingCycle,
    String? status,
    DateTime? nextRenewalDate,
    String? contactEmail,
    String? contactPhone,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SocietySubscription',
      if (id != null) 'id': id,
      'societyId': societyId,
      'societyName': societyName,
      'tier': tier.toJson(),
      'flatCount': flatCount,
      'ratePerFlat': ratePerFlat,
      'monthlyTotal': monthlyTotal,
      'billingCycle': billingCycle,
      'status': status,
      'nextRenewalDate': nextRenewalDate.toJson(),
      'contactEmail': contactEmail,
      'contactPhone': contactPhone,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SocietySubscription',
      if (id != null) 'id': id,
      'societyId': societyId,
      'societyName': societyName,
      'tier': tier.toJson(),
      'flatCount': flatCount,
      'ratePerFlat': ratePerFlat,
      'monthlyTotal': monthlyTotal,
      'billingCycle': billingCycle,
      'status': status,
      'nextRenewalDate': nextRenewalDate.toJson(),
      'contactEmail': contactEmail,
      'contactPhone': contactPhone,
      'createdAt': createdAt.toJson(),
    };
  }

  static SocietySubscriptionInclude include() {
    return SocietySubscriptionInclude._();
  }

  static SocietySubscriptionIncludeList includeList({
    _i1.WhereExpressionBuilder<SocietySubscriptionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SocietySubscriptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SocietySubscriptionTable>? orderByList,
    SocietySubscriptionInclude? include,
  }) {
    return SocietySubscriptionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SocietySubscription.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SocietySubscription.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SocietySubscriptionImpl extends SocietySubscription {
  _SocietySubscriptionImpl({
    int? id,
    required int societyId,
    required String societyName,
    required _i2.SubscriptionTier tier,
    required int flatCount,
    required double ratePerFlat,
    required double monthlyTotal,
    required String billingCycle,
    required String status,
    required DateTime nextRenewalDate,
    required String contactEmail,
    required String contactPhone,
    required DateTime createdAt,
  }) : super._(
         id: id,
         societyId: societyId,
         societyName: societyName,
         tier: tier,
         flatCount: flatCount,
         ratePerFlat: ratePerFlat,
         monthlyTotal: monthlyTotal,
         billingCycle: billingCycle,
         status: status,
         nextRenewalDate: nextRenewalDate,
         contactEmail: contactEmail,
         contactPhone: contactPhone,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [SocietySubscription]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SocietySubscription copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? societyName,
    _i2.SubscriptionTier? tier,
    int? flatCount,
    double? ratePerFlat,
    double? monthlyTotal,
    String? billingCycle,
    String? status,
    DateTime? nextRenewalDate,
    String? contactEmail,
    String? contactPhone,
    DateTime? createdAt,
  }) {
    return SocietySubscription(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      societyName: societyName ?? this.societyName,
      tier: tier ?? this.tier,
      flatCount: flatCount ?? this.flatCount,
      ratePerFlat: ratePerFlat ?? this.ratePerFlat,
      monthlyTotal: monthlyTotal ?? this.monthlyTotal,
      billingCycle: billingCycle ?? this.billingCycle,
      status: status ?? this.status,
      nextRenewalDate: nextRenewalDate ?? this.nextRenewalDate,
      contactEmail: contactEmail ?? this.contactEmail,
      contactPhone: contactPhone ?? this.contactPhone,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class SocietySubscriptionUpdateTable
    extends _i1.UpdateTable<SocietySubscriptionTable> {
  SocietySubscriptionUpdateTable(super.table);

  _i1.ColumnValue<int, int> societyId(int value) => _i1.ColumnValue(
    table.societyId,
    value,
  );

  _i1.ColumnValue<String, String> societyName(String value) => _i1.ColumnValue(
    table.societyName,
    value,
  );

  _i1.ColumnValue<_i2.SubscriptionTier, _i2.SubscriptionTier> tier(
    _i2.SubscriptionTier value,
  ) => _i1.ColumnValue(
    table.tier,
    value,
  );

  _i1.ColumnValue<int, int> flatCount(int value) => _i1.ColumnValue(
    table.flatCount,
    value,
  );

  _i1.ColumnValue<double, double> ratePerFlat(double value) => _i1.ColumnValue(
    table.ratePerFlat,
    value,
  );

  _i1.ColumnValue<double, double> monthlyTotal(double value) => _i1.ColumnValue(
    table.monthlyTotal,
    value,
  );

  _i1.ColumnValue<String, String> billingCycle(String value) => _i1.ColumnValue(
    table.billingCycle,
    value,
  );

  _i1.ColumnValue<String, String> status(String value) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> nextRenewalDate(DateTime value) =>
      _i1.ColumnValue(
        table.nextRenewalDate,
        value,
      );

  _i1.ColumnValue<String, String> contactEmail(String value) => _i1.ColumnValue(
    table.contactEmail,
    value,
  );

  _i1.ColumnValue<String, String> contactPhone(String value) => _i1.ColumnValue(
    table.contactPhone,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class SocietySubscriptionTable extends _i1.Table<int?> {
  SocietySubscriptionTable({super.tableRelation})
    : super(tableName: 'society_subscription') {
    updateTable = SocietySubscriptionUpdateTable(this);
    societyId = _i1.ColumnInt(
      'societyId',
      this,
    );
    societyName = _i1.ColumnString(
      'societyName',
      this,
    );
    tier = _i1.ColumnEnum(
      'tier',
      this,
      _i1.EnumSerialization.byName,
    );
    flatCount = _i1.ColumnInt(
      'flatCount',
      this,
    );
    ratePerFlat = _i1.ColumnDouble(
      'ratePerFlat',
      this,
    );
    monthlyTotal = _i1.ColumnDouble(
      'monthlyTotal',
      this,
    );
    billingCycle = _i1.ColumnString(
      'billingCycle',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    nextRenewalDate = _i1.ColumnDateTime(
      'nextRenewalDate',
      this,
    );
    contactEmail = _i1.ColumnString(
      'contactEmail',
      this,
    );
    contactPhone = _i1.ColumnString(
      'contactPhone',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final SocietySubscriptionUpdateTable updateTable;

  late final _i1.ColumnInt societyId;

  late final _i1.ColumnString societyName;

  late final _i1.ColumnEnum<_i2.SubscriptionTier> tier;

  late final _i1.ColumnInt flatCount;

  late final _i1.ColumnDouble ratePerFlat;

  late final _i1.ColumnDouble monthlyTotal;

  late final _i1.ColumnString billingCycle;

  late final _i1.ColumnString status;

  late final _i1.ColumnDateTime nextRenewalDate;

  late final _i1.ColumnString contactEmail;

  late final _i1.ColumnString contactPhone;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    societyId,
    societyName,
    tier,
    flatCount,
    ratePerFlat,
    monthlyTotal,
    billingCycle,
    status,
    nextRenewalDate,
    contactEmail,
    contactPhone,
    createdAt,
  ];
}

class SocietySubscriptionInclude extends _i1.IncludeObject {
  SocietySubscriptionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => SocietySubscription.t;
}

class SocietySubscriptionIncludeList extends _i1.IncludeList {
  SocietySubscriptionIncludeList._({
    _i1.WhereExpressionBuilder<SocietySubscriptionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SocietySubscription.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => SocietySubscription.t;
}

class SocietySubscriptionRepository {
  const SocietySubscriptionRepository._();

  /// Returns a list of [SocietySubscription]s matching the given query parameters.
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
  Future<List<SocietySubscription>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SocietySubscriptionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SocietySubscriptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SocietySubscriptionTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<SocietySubscription>(
      where: where?.call(SocietySubscription.t),
      orderBy: orderBy?.call(SocietySubscription.t),
      orderByList: orderByList?.call(SocietySubscription.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [SocietySubscription] matching the given query parameters.
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
  Future<SocietySubscription?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SocietySubscriptionTable>? where,
    int? offset,
    _i1.OrderByBuilder<SocietySubscriptionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SocietySubscriptionTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<SocietySubscription>(
      where: where?.call(SocietySubscription.t),
      orderBy: orderBy?.call(SocietySubscription.t),
      orderByList: orderByList?.call(SocietySubscription.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [SocietySubscription] by its [id] or null if no such row exists.
  Future<SocietySubscription?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<SocietySubscription>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [SocietySubscription]s in the list and returns the inserted rows.
  ///
  /// The returned [SocietySubscription]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<SocietySubscription>> insert(
    _i1.DatabaseSession session,
    List<SocietySubscription> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<SocietySubscription>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [SocietySubscription] and returns the inserted row.
  ///
  /// The returned [SocietySubscription] will have its `id` field set.
  Future<SocietySubscription> insertRow(
    _i1.DatabaseSession session,
    SocietySubscription row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SocietySubscription>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SocietySubscription]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SocietySubscription>> update(
    _i1.DatabaseSession session,
    List<SocietySubscription> rows, {
    _i1.ColumnSelections<SocietySubscriptionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SocietySubscription>(
      rows,
      columns: columns?.call(SocietySubscription.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SocietySubscription]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SocietySubscription> updateRow(
    _i1.DatabaseSession session,
    SocietySubscription row, {
    _i1.ColumnSelections<SocietySubscriptionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SocietySubscription>(
      row,
      columns: columns?.call(SocietySubscription.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SocietySubscription] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<SocietySubscription?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<SocietySubscriptionUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<SocietySubscription>(
      id,
      columnValues: columnValues(SocietySubscription.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [SocietySubscription]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<SocietySubscription>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<SocietySubscriptionUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<SocietySubscriptionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SocietySubscriptionTable>? orderBy,
    _i1.OrderByListBuilder<SocietySubscriptionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<SocietySubscription>(
      columnValues: columnValues(SocietySubscription.t.updateTable),
      where: where(SocietySubscription.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SocietySubscription.t),
      orderByList: orderByList?.call(SocietySubscription.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [SocietySubscription]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SocietySubscription>> delete(
    _i1.DatabaseSession session,
    List<SocietySubscription> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SocietySubscription>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SocietySubscription].
  Future<SocietySubscription> deleteRow(
    _i1.DatabaseSession session,
    SocietySubscription row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SocietySubscription>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SocietySubscription>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<SocietySubscriptionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SocietySubscription>(
      where: where(SocietySubscription.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SocietySubscriptionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SocietySubscription>(
      where: where?.call(SocietySubscription.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [SocietySubscription] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<SocietySubscriptionTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<SocietySubscription>(
      where: where(SocietySubscription.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
