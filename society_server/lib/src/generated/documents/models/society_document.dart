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
import '../../documents/models/document_category.dart' as _i2;

abstract class SocietyDocument
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  SocietyDocument._({
    this.id,
    required this.societyId,
    required this.title,
    required this.description,
    required this.category,
    this.storagePath,
    required this.fileUrl,
    required this.fileSize,
    required this.uploadedByName,
    required this.isCommitteeOnly,
    required this.uploadedAt,
  });

  factory SocietyDocument({
    int? id,
    required int societyId,
    required String title,
    required String description,
    required _i2.DocumentCategory category,
    String? storagePath,
    required String fileUrl,
    required String fileSize,
    required String uploadedByName,
    required bool isCommitteeOnly,
    required DateTime uploadedAt,
  }) = _SocietyDocumentImpl;

  factory SocietyDocument.fromJson(Map<String, dynamic> jsonSerialization) {
    return SocietyDocument(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      category: _i2.DocumentCategory.fromJson(
        (jsonSerialization['category'] as String),
      ),
      storagePath: jsonSerialization['storagePath'] as String?,
      fileUrl: jsonSerialization['fileUrl'] as String,
      fileSize: jsonSerialization['fileSize'] as String,
      uploadedByName: jsonSerialization['uploadedByName'] as String,
      isCommitteeOnly: _i1.BoolJsonExtension.fromJson(
        jsonSerialization['isCommitteeOnly'],
      ),
      uploadedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['uploadedAt'],
      ),
    );
  }

  static final t = SocietyDocumentTable();

  static const db = SocietyDocumentRepository._();

  @override
  int? id;

  int societyId;

  String title;

  String description;

  _i2.DocumentCategory category;

  String? storagePath;

  String fileUrl;

  String fileSize;

  String uploadedByName;

  bool isCommitteeOnly;

  DateTime uploadedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [SocietyDocument]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SocietyDocument copyWith({
    int? id,
    int? societyId,
    String? title,
    String? description,
    _i2.DocumentCategory? category,
    String? storagePath,
    String? fileUrl,
    String? fileSize,
    String? uploadedByName,
    bool? isCommitteeOnly,
    DateTime? uploadedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SocietyDocument',
      if (id != null) 'id': id,
      'societyId': societyId,
      'title': title,
      'description': description,
      'category': category.toJson(),
      if (storagePath != null) 'storagePath': storagePath,
      'fileUrl': fileUrl,
      'fileSize': fileSize,
      'uploadedByName': uploadedByName,
      'isCommitteeOnly': isCommitteeOnly,
      'uploadedAt': uploadedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SocietyDocument',
      if (id != null) 'id': id,
      'societyId': societyId,
      'title': title,
      'description': description,
      'category': category.toJson(),
      if (storagePath != null) 'storagePath': storagePath,
      'fileUrl': fileUrl,
      'fileSize': fileSize,
      'uploadedByName': uploadedByName,
      'isCommitteeOnly': isCommitteeOnly,
      'uploadedAt': uploadedAt.toJson(),
    };
  }

  static SocietyDocumentInclude include() {
    return SocietyDocumentInclude._();
  }

  static SocietyDocumentIncludeList includeList({
    _i1.WhereExpressionBuilder<SocietyDocumentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SocietyDocumentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SocietyDocumentTable>? orderByList,
    SocietyDocumentInclude? include,
  }) {
    return SocietyDocumentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SocietyDocument.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SocietyDocument.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SocietyDocumentImpl extends SocietyDocument {
  _SocietyDocumentImpl({
    int? id,
    required int societyId,
    required String title,
    required String description,
    required _i2.DocumentCategory category,
    String? storagePath,
    required String fileUrl,
    required String fileSize,
    required String uploadedByName,
    required bool isCommitteeOnly,
    required DateTime uploadedAt,
  }) : super._(
         id: id,
         societyId: societyId,
         title: title,
         description: description,
         category: category,
         storagePath: storagePath,
         fileUrl: fileUrl,
         fileSize: fileSize,
         uploadedByName: uploadedByName,
         isCommitteeOnly: isCommitteeOnly,
         uploadedAt: uploadedAt,
       );

  /// Returns a shallow copy of this [SocietyDocument]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SocietyDocument copyWith({
    Object? id = _Undefined,
    int? societyId,
    String? title,
    String? description,
    _i2.DocumentCategory? category,
    Object? storagePath = _Undefined,
    String? fileUrl,
    String? fileSize,
    String? uploadedByName,
    bool? isCommitteeOnly,
    DateTime? uploadedAt,
  }) {
    return SocietyDocument(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      storagePath: storagePath is String? ? storagePath : this.storagePath,
      fileUrl: fileUrl ?? this.fileUrl,
      fileSize: fileSize ?? this.fileSize,
      uploadedByName: uploadedByName ?? this.uploadedByName,
      isCommitteeOnly: isCommitteeOnly ?? this.isCommitteeOnly,
      uploadedAt: uploadedAt ?? this.uploadedAt,
    );
  }
}

class SocietyDocumentUpdateTable extends _i1.UpdateTable<SocietyDocumentTable> {
  SocietyDocumentUpdateTable(super.table);

  _i1.ColumnValue<int, int> societyId(int value) => _i1.ColumnValue(
    table.societyId,
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

  _i1.ColumnValue<_i2.DocumentCategory, _i2.DocumentCategory> category(
    _i2.DocumentCategory value,
  ) => _i1.ColumnValue(
    table.category,
    value,
  );

  _i1.ColumnValue<String, String> storagePath(String? value) => _i1.ColumnValue(
    table.storagePath,
    value,
  );

  _i1.ColumnValue<String, String> fileUrl(String value) => _i1.ColumnValue(
    table.fileUrl,
    value,
  );

  _i1.ColumnValue<String, String> fileSize(String value) => _i1.ColumnValue(
    table.fileSize,
    value,
  );

  _i1.ColumnValue<String, String> uploadedByName(String value) =>
      _i1.ColumnValue(
        table.uploadedByName,
        value,
      );

  _i1.ColumnValue<bool, bool> isCommitteeOnly(bool value) => _i1.ColumnValue(
    table.isCommitteeOnly,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> uploadedAt(DateTime value) =>
      _i1.ColumnValue(
        table.uploadedAt,
        value,
      );
}

class SocietyDocumentTable extends _i1.Table<int?> {
  SocietyDocumentTable({super.tableRelation})
    : super(tableName: 'society_document') {
    updateTable = SocietyDocumentUpdateTable(this);
    societyId = _i1.ColumnInt(
      'societyId',
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
    category = _i1.ColumnEnum(
      'category',
      this,
      _i1.EnumSerialization.byName,
    );
    storagePath = _i1.ColumnString(
      'storagePath',
      this,
    );
    fileUrl = _i1.ColumnString(
      'fileUrl',
      this,
    );
    fileSize = _i1.ColumnString(
      'fileSize',
      this,
    );
    uploadedByName = _i1.ColumnString(
      'uploadedByName',
      this,
    );
    isCommitteeOnly = _i1.ColumnBool(
      'isCommitteeOnly',
      this,
    );
    uploadedAt = _i1.ColumnDateTime(
      'uploadedAt',
      this,
    );
  }

  late final SocietyDocumentUpdateTable updateTable;

  late final _i1.ColumnInt societyId;

  late final _i1.ColumnString title;

  late final _i1.ColumnString description;

  late final _i1.ColumnEnum<_i2.DocumentCategory> category;

  late final _i1.ColumnString storagePath;

  late final _i1.ColumnString fileUrl;

  late final _i1.ColumnString fileSize;

  late final _i1.ColumnString uploadedByName;

  late final _i1.ColumnBool isCommitteeOnly;

  late final _i1.ColumnDateTime uploadedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    societyId,
    title,
    description,
    category,
    storagePath,
    fileUrl,
    fileSize,
    uploadedByName,
    isCommitteeOnly,
    uploadedAt,
  ];
}

class SocietyDocumentInclude extends _i1.IncludeObject {
  SocietyDocumentInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => SocietyDocument.t;
}

class SocietyDocumentIncludeList extends _i1.IncludeList {
  SocietyDocumentIncludeList._({
    _i1.WhereExpressionBuilder<SocietyDocumentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SocietyDocument.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => SocietyDocument.t;
}

class SocietyDocumentRepository {
  const SocietyDocumentRepository._();

  /// Returns a list of [SocietyDocument]s matching the given query parameters.
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
  Future<List<SocietyDocument>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SocietyDocumentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SocietyDocumentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SocietyDocumentTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<SocietyDocument>(
      where: where?.call(SocietyDocument.t),
      orderBy: orderBy?.call(SocietyDocument.t),
      orderByList: orderByList?.call(SocietyDocument.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [SocietyDocument] matching the given query parameters.
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
  Future<SocietyDocument?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SocietyDocumentTable>? where,
    int? offset,
    _i1.OrderByBuilder<SocietyDocumentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SocietyDocumentTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<SocietyDocument>(
      where: where?.call(SocietyDocument.t),
      orderBy: orderBy?.call(SocietyDocument.t),
      orderByList: orderByList?.call(SocietyDocument.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [SocietyDocument] by its [id] or null if no such row exists.
  Future<SocietyDocument?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<SocietyDocument>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [SocietyDocument]s in the list and returns the inserted rows.
  ///
  /// The returned [SocietyDocument]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<SocietyDocument>> insert(
    _i1.DatabaseSession session,
    List<SocietyDocument> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<SocietyDocument>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [SocietyDocument] and returns the inserted row.
  ///
  /// The returned [SocietyDocument] will have its `id` field set.
  Future<SocietyDocument> insertRow(
    _i1.DatabaseSession session,
    SocietyDocument row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SocietyDocument>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SocietyDocument]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SocietyDocument>> update(
    _i1.DatabaseSession session,
    List<SocietyDocument> rows, {
    _i1.ColumnSelections<SocietyDocumentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SocietyDocument>(
      rows,
      columns: columns?.call(SocietyDocument.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SocietyDocument]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SocietyDocument> updateRow(
    _i1.DatabaseSession session,
    SocietyDocument row, {
    _i1.ColumnSelections<SocietyDocumentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SocietyDocument>(
      row,
      columns: columns?.call(SocietyDocument.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SocietyDocument] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<SocietyDocument?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<SocietyDocumentUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<SocietyDocument>(
      id,
      columnValues: columnValues(SocietyDocument.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [SocietyDocument]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<SocietyDocument>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<SocietyDocumentUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<SocietyDocumentTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SocietyDocumentTable>? orderBy,
    _i1.OrderByListBuilder<SocietyDocumentTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<SocietyDocument>(
      columnValues: columnValues(SocietyDocument.t.updateTable),
      where: where(SocietyDocument.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SocietyDocument.t),
      orderByList: orderByList?.call(SocietyDocument.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [SocietyDocument]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SocietyDocument>> delete(
    _i1.DatabaseSession session,
    List<SocietyDocument> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SocietyDocument>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SocietyDocument].
  Future<SocietyDocument> deleteRow(
    _i1.DatabaseSession session,
    SocietyDocument row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SocietyDocument>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SocietyDocument>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<SocietyDocumentTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SocietyDocument>(
      where: where(SocietyDocument.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<SocietyDocumentTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SocietyDocument>(
      where: where?.call(SocietyDocument.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [SocietyDocument] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<SocietyDocumentTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<SocietyDocument>(
      where: where(SocietyDocument.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
