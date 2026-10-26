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
import '../../amenity/models/booking_status.dart' as _i2;

abstract class AmenityBooking
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  AmenityBooking._({
    this.id,
    required this.societyId,
    required this.amenityId,
    required this.amenityName,
    required this.flatNumber,
    required this.bookedById,
    required this.bookedByName,
    required this.bookingDate,
    required this.slot,
    required this.amountPaid,
    required this.status,
    required this.createdAt,
  });

  factory AmenityBooking({
    int? id,
    required int societyId,
    required int amenityId,
    required String amenityName,
    required String flatNumber,
    required int bookedById,
    required String bookedByName,
    required DateTime bookingDate,
    required String slot,
    required double amountPaid,
    required _i2.BookingStatus status,
    required DateTime createdAt,
  }) = _AmenityBookingImpl;

  factory AmenityBooking.fromJson(Map<String, dynamic> jsonSerialization) {
    return AmenityBooking(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      amenityId: jsonSerialization['amenityId'] as int,
      amenityName: jsonSerialization['amenityName'] as String,
      flatNumber: jsonSerialization['flatNumber'] as String,
      bookedById: jsonSerialization['bookedById'] as int,
      bookedByName: jsonSerialization['bookedByName'] as String,
      bookingDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['bookingDate'],
      ),
      slot: jsonSerialization['slot'] as String,
      amountPaid: (jsonSerialization['amountPaid'] as num).toDouble(),
      status: _i2.BookingStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = AmenityBookingTable();

  static const db = AmenityBookingRepository._();

  @override
  int? id;

  int societyId;

  int amenityId;

  String amenityName;

  String flatNumber;

  int bookedById;

  String bookedByName;

  DateTime bookingDate;

  String slot;

  double amountPaid;

  _i2.BookingStatus status;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [AmenityBooking]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AmenityBooking copyWith({
    int? id,
    int? societyId,
    int? amenityId,
    String? amenityName,
    String? flatNumber,
    int? bookedById,
    String? bookedByName,
    DateTime? bookingDate,
    String? slot,
    double? amountPaid,
    _i2.BookingStatus? status,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AmenityBooking',
      if (id != null) 'id': id,
      'societyId': societyId,
      'amenityId': amenityId,
      'amenityName': amenityName,
      'flatNumber': flatNumber,
      'bookedById': bookedById,
      'bookedByName': bookedByName,
      'bookingDate': bookingDate.toJson(),
      'slot': slot,
      'amountPaid': amountPaid,
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AmenityBooking',
      if (id != null) 'id': id,
      'societyId': societyId,
      'amenityId': amenityId,
      'amenityName': amenityName,
      'flatNumber': flatNumber,
      'bookedById': bookedById,
      'bookedByName': bookedByName,
      'bookingDate': bookingDate.toJson(),
      'slot': slot,
      'amountPaid': amountPaid,
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  static AmenityBookingInclude include() {
    return AmenityBookingInclude._();
  }

  static AmenityBookingIncludeList includeList({
    _i1.WhereExpressionBuilder<AmenityBookingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AmenityBookingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AmenityBookingTable>? orderByList,
    AmenityBookingInclude? include,
  }) {
    return AmenityBookingIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AmenityBooking.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AmenityBooking.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AmenityBookingImpl extends AmenityBooking {
  _AmenityBookingImpl({
    int? id,
    required int societyId,
    required int amenityId,
    required String amenityName,
    required String flatNumber,
    required int bookedById,
    required String bookedByName,
    required DateTime bookingDate,
    required String slot,
    required double amountPaid,
    required _i2.BookingStatus status,
    required DateTime createdAt,
  }) : super._(
         id: id,
         societyId: societyId,
         amenityId: amenityId,
         amenityName: amenityName,
         flatNumber: flatNumber,
         bookedById: bookedById,
         bookedByName: bookedByName,
         bookingDate: bookingDate,
         slot: slot,
         amountPaid: amountPaid,
         status: status,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [AmenityBooking]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AmenityBooking copyWith({
    Object? id = _Undefined,
    int? societyId,
    int? amenityId,
    String? amenityName,
    String? flatNumber,
    int? bookedById,
    String? bookedByName,
    DateTime? bookingDate,
    String? slot,
    double? amountPaid,
    _i2.BookingStatus? status,
    DateTime? createdAt,
  }) {
    return AmenityBooking(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      amenityId: amenityId ?? this.amenityId,
      amenityName: amenityName ?? this.amenityName,
      flatNumber: flatNumber ?? this.flatNumber,
      bookedById: bookedById ?? this.bookedById,
      bookedByName: bookedByName ?? this.bookedByName,
      bookingDate: bookingDate ?? this.bookingDate,
      slot: slot ?? this.slot,
      amountPaid: amountPaid ?? this.amountPaid,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class AmenityBookingUpdateTable extends _i1.UpdateTable<AmenityBookingTable> {
  AmenityBookingUpdateTable(super.table);

  _i1.ColumnValue<int, int> societyId(int value) => _i1.ColumnValue(
    table.societyId,
    value,
  );

  _i1.ColumnValue<int, int> amenityId(int value) => _i1.ColumnValue(
    table.amenityId,
    value,
  );

  _i1.ColumnValue<String, String> amenityName(String value) => _i1.ColumnValue(
    table.amenityName,
    value,
  );

  _i1.ColumnValue<String, String> flatNumber(String value) => _i1.ColumnValue(
    table.flatNumber,
    value,
  );

  _i1.ColumnValue<int, int> bookedById(int value) => _i1.ColumnValue(
    table.bookedById,
    value,
  );

  _i1.ColumnValue<String, String> bookedByName(String value) => _i1.ColumnValue(
    table.bookedByName,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> bookingDate(DateTime value) =>
      _i1.ColumnValue(
        table.bookingDate,
        value,
      );

  _i1.ColumnValue<String, String> slot(String value) => _i1.ColumnValue(
    table.slot,
    value,
  );

  _i1.ColumnValue<double, double> amountPaid(double value) => _i1.ColumnValue(
    table.amountPaid,
    value,
  );

  _i1.ColumnValue<_i2.BookingStatus, _i2.BookingStatus> status(
    _i2.BookingStatus value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class AmenityBookingTable extends _i1.Table<int?> {
  AmenityBookingTable({super.tableRelation})
    : super(tableName: 'amenity_booking') {
    updateTable = AmenityBookingUpdateTable(this);
    societyId = _i1.ColumnInt(
      'societyId',
      this,
    );
    amenityId = _i1.ColumnInt(
      'amenityId',
      this,
    );
    amenityName = _i1.ColumnString(
      'amenityName',
      this,
    );
    flatNumber = _i1.ColumnString(
      'flatNumber',
      this,
    );
    bookedById = _i1.ColumnInt(
      'bookedById',
      this,
    );
    bookedByName = _i1.ColumnString(
      'bookedByName',
      this,
    );
    bookingDate = _i1.ColumnDateTime(
      'bookingDate',
      this,
    );
    slot = _i1.ColumnString(
      'slot',
      this,
    );
    amountPaid = _i1.ColumnDouble(
      'amountPaid',
      this,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final AmenityBookingUpdateTable updateTable;

  late final _i1.ColumnInt societyId;

  late final _i1.ColumnInt amenityId;

  late final _i1.ColumnString amenityName;

  late final _i1.ColumnString flatNumber;

  late final _i1.ColumnInt bookedById;

  late final _i1.ColumnString bookedByName;

  late final _i1.ColumnDateTime bookingDate;

  late final _i1.ColumnString slot;

  late final _i1.ColumnDouble amountPaid;

  late final _i1.ColumnEnum<_i2.BookingStatus> status;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    societyId,
    amenityId,
    amenityName,
    flatNumber,
    bookedById,
    bookedByName,
    bookingDate,
    slot,
    amountPaid,
    status,
    createdAt,
  ];
}

class AmenityBookingInclude extends _i1.IncludeObject {
  AmenityBookingInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => AmenityBooking.t;
}

class AmenityBookingIncludeList extends _i1.IncludeList {
  AmenityBookingIncludeList._({
    _i1.WhereExpressionBuilder<AmenityBookingTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AmenityBooking.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => AmenityBooking.t;
}

class AmenityBookingRepository {
  const AmenityBookingRepository._();

  /// Returns a list of [AmenityBooking]s matching the given query parameters.
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
  Future<List<AmenityBooking>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<AmenityBookingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AmenityBookingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AmenityBookingTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<AmenityBooking>(
      where: where?.call(AmenityBooking.t),
      orderBy: orderBy?.call(AmenityBooking.t),
      orderByList: orderByList?.call(AmenityBooking.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [AmenityBooking] matching the given query parameters.
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
  Future<AmenityBooking?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<AmenityBookingTable>? where,
    int? offset,
    _i1.OrderByBuilder<AmenityBookingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AmenityBookingTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<AmenityBooking>(
      where: where?.call(AmenityBooking.t),
      orderBy: orderBy?.call(AmenityBooking.t),
      orderByList: orderByList?.call(AmenityBooking.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [AmenityBooking] by its [id] or null if no such row exists.
  Future<AmenityBooking?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<AmenityBooking>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [AmenityBooking]s in the list and returns the inserted rows.
  ///
  /// The returned [AmenityBooking]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<AmenityBooking>> insert(
    _i1.DatabaseSession session,
    List<AmenityBooking> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<AmenityBooking>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [AmenityBooking] and returns the inserted row.
  ///
  /// The returned [AmenityBooking] will have its `id` field set.
  Future<AmenityBooking> insertRow(
    _i1.DatabaseSession session,
    AmenityBooking row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AmenityBooking>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [AmenityBooking]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<AmenityBooking>> update(
    _i1.DatabaseSession session,
    List<AmenityBooking> rows, {
    _i1.ColumnSelections<AmenityBookingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AmenityBooking>(
      rows,
      columns: columns?.call(AmenityBooking.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AmenityBooking]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AmenityBooking> updateRow(
    _i1.DatabaseSession session,
    AmenityBooking row, {
    _i1.ColumnSelections<AmenityBookingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AmenityBooking>(
      row,
      columns: columns?.call(AmenityBooking.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AmenityBooking] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<AmenityBooking?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<AmenityBookingUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<AmenityBooking>(
      id,
      columnValues: columnValues(AmenityBooking.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [AmenityBooking]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<AmenityBooking>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<AmenityBookingUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<AmenityBookingTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AmenityBookingTable>? orderBy,
    _i1.OrderByListBuilder<AmenityBookingTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<AmenityBooking>(
      columnValues: columnValues(AmenityBooking.t.updateTable),
      where: where(AmenityBooking.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AmenityBooking.t),
      orderByList: orderByList?.call(AmenityBooking.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [AmenityBooking]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<AmenityBooking>> delete(
    _i1.DatabaseSession session,
    List<AmenityBooking> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AmenityBooking>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [AmenityBooking].
  Future<AmenityBooking> deleteRow(
    _i1.DatabaseSession session,
    AmenityBooking row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AmenityBooking>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<AmenityBooking>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<AmenityBookingTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AmenityBooking>(
      where: where(AmenityBooking.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<AmenityBookingTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AmenityBooking>(
      where: where?.call(AmenityBooking.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [AmenityBooking] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<AmenityBookingTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<AmenityBooking>(
      where: where(AmenityBooking.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
