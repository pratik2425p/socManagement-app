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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i3;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i4;
import 'accounting/models/ledger_account.dart' as _i5;
import 'accounting/models/ledger_entry.dart' as _i6;
import 'accounting/models/voucher_request.dart' as _i7;
import 'accounting/models/voucher_status.dart' as _i8;
import 'communication/models/complaint.dart' as _i9;
import 'communication/models/complaint_status.dart' as _i10;
import 'communication/models/notice.dart' as _i11;
import 'core/models/building.dart' as _i12;
import 'core/models/complex.dart' as _i13;
import 'core/models/flat.dart' as _i14;
import 'core/models/society.dart' as _i15;
import 'core/models/society_user.dart' as _i16;
import 'core/models/user_role.dart' as _i17;
import 'greetings/greeting.dart' as _i18;
import 'maintenance/models/bill_status.dart' as _i19;
import 'maintenance/models/maintenance_bill.dart' as _i20;
import 'maintenance/models/maintenance_head.dart' as _i21;
import 'maintenance/models/payment_record.dart' as _i22;
import 'visitor/models/visitor_entry.dart' as _i23;
import 'visitor/models/visitor_status.dart' as _i24;
import 'package:society_server/src/generated/accounting/models/voucher_request.dart'
    as _i25;
import 'package:society_server/src/generated/accounting/models/ledger_entry.dart'
    as _i26;
import 'package:society_server/src/generated/accounting/models/ledger_account.dart'
    as _i27;
import 'package:society_server/src/generated/communication/models/notice.dart'
    as _i28;
import 'package:society_server/src/generated/communication/models/complaint.dart'
    as _i29;
import 'package:society_server/src/generated/core/models/society.dart' as _i30;
import 'package:society_server/src/generated/core/models/flat.dart' as _i31;
import 'package:society_server/src/generated/core/models/society_user.dart'
    as _i32;
import 'package:society_server/src/generated/maintenance/models/maintenance_bill.dart'
    as _i33;
import 'package:society_server/src/generated/maintenance/models/payment_record.dart'
    as _i34;
import 'package:society_server/src/generated/visitor/models/visitor_entry.dart'
    as _i35;
export 'accounting/models/ledger_account.dart';
export 'accounting/models/ledger_entry.dart';
export 'accounting/models/voucher_request.dart';
export 'accounting/models/voucher_status.dart';
export 'communication/models/complaint.dart';
export 'communication/models/complaint_status.dart';
export 'communication/models/notice.dart';
export 'core/models/building.dart';
export 'core/models/complex.dart';
export 'core/models/flat.dart';
export 'core/models/society.dart';
export 'core/models/society_user.dart';
export 'core/models/user_role.dart';
export 'greetings/greeting.dart';
export 'maintenance/models/bill_status.dart';
export 'maintenance/models/maintenance_bill.dart';
export 'maintenance/models/maintenance_head.dart';
export 'maintenance/models/payment_record.dart';
export 'visitor/models/visitor_entry.dart';
export 'visitor/models/visitor_status.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'building',
      dartName: 'Building',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'building_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'societyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'totalFloors',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'building_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'complaint',
      dartName: 'Complaint',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'complaint_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'societyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'flatNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'reportedByName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'category',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ComplaintStatus',
        ),
        _i2.ColumnDefinition(
          name: 'assignedTo',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'resolutionNotes',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'resolvedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'complaint_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'complex',
      dartName: 'Complex',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'complex_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'address',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'city',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'pincode',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'complex_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'flat',
      dartName: 'Flat',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'flat_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'societyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'buildingId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'flatNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'floor',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'squareFeet',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'intercomNumber',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'flat_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ledger_account',
      dartName: 'LedgerAccount',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ledger_account_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'societyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'accountCode',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'accountName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'accountType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'balance',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ledger_account_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ledger_entry',
      dartName: 'LedgerEntry',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ledger_entry_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'societyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'entryNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'voucherId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'entryDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'postedByName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'totalDebit',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'totalCredit',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'postedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ledger_entry_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'maintenance_bill',
      dartName: 'MaintenanceBill',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'maintenance_bill_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'societyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'flatId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'flatNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'billNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'billingMonth',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'dueDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'amount',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'lateFee',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:BillStatus',
        ),
        _i2.ColumnDefinition(
          name: 'issuedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'maintenance_bill_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'maintenance_head',
      dartName: 'MaintenanceHead',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'maintenance_head_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'societyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'chargeType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'rate',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'maintenance_head_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'notice',
      dartName: 'Notice',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'notice_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'societyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'content',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'category',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'priority',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'postedByName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'postedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'expiresAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'notice_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'payment_record',
      dartName: 'PaymentRecord',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'payment_record_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'societyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'billId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'flatId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'flatNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'payerName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'amount',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'paymentMethod',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'transactionReference',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'receiptNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'paymentDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'isVerified',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'payment_record_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'society',
      dartName: 'Society',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'society_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'code',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'address',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'city',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'state',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'pincode',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'totalFlats',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'subscriptionPlan',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'subscriptionStatus',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'complexId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'society_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'society_user',
      dartName: 'SocietyUser',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'society_user_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'societyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'fullName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'phone',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'role',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:UserRole',
        ),
        _i2.ColumnDefinition(
          name: 'flatNumber',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'society_user_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'visitor_entry',
      dartName: 'VisitorEntry',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'visitor_entry_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'societyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'complexId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'flatNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'visitorName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'phoneNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'purpose',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'vehicleNumber',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'passcode',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:VisitorStatus',
        ),
        _i2.ColumnDefinition(
          name: 'entryGate',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'checkInTime',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'checkOutTime',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'visitor_entry_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'voucher_request',
      dartName: 'VoucherRequest',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'voucher_request_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'societyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'voucherNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'amount',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'category',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'requestedByName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:VoucherStatus',
        ),
        _i2.ColumnDefinition(
          name: 'rejectionReason',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'approvedByName',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'approvedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'voucher_request_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i4.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i5.LedgerAccount) {
      return _i5.LedgerAccount.fromJson(data) as T;
    }
    if (t == _i6.LedgerEntry) {
      return _i6.LedgerEntry.fromJson(data) as T;
    }
    if (t == _i7.VoucherRequest) {
      return _i7.VoucherRequest.fromJson(data) as T;
    }
    if (t == _i8.VoucherStatus) {
      return _i8.VoucherStatus.fromJson(data) as T;
    }
    if (t == _i9.Complaint) {
      return _i9.Complaint.fromJson(data) as T;
    }
    if (t == _i10.ComplaintStatus) {
      return _i10.ComplaintStatus.fromJson(data) as T;
    }
    if (t == _i11.Notice) {
      return _i11.Notice.fromJson(data) as T;
    }
    if (t == _i12.Building) {
      return _i12.Building.fromJson(data) as T;
    }
    if (t == _i13.Complex) {
      return _i13.Complex.fromJson(data) as T;
    }
    if (t == _i14.Flat) {
      return _i14.Flat.fromJson(data) as T;
    }
    if (t == _i15.Society) {
      return _i15.Society.fromJson(data) as T;
    }
    if (t == _i16.SocietyUser) {
      return _i16.SocietyUser.fromJson(data) as T;
    }
    if (t == _i17.UserRole) {
      return _i17.UserRole.fromJson(data) as T;
    }
    if (t == _i18.Greeting) {
      return _i18.Greeting.fromJson(data) as T;
    }
    if (t == _i19.BillStatus) {
      return _i19.BillStatus.fromJson(data) as T;
    }
    if (t == _i20.MaintenanceBill) {
      return _i20.MaintenanceBill.fromJson(data) as T;
    }
    if (t == _i21.MaintenanceHead) {
      return _i21.MaintenanceHead.fromJson(data) as T;
    }
    if (t == _i22.PaymentRecord) {
      return _i22.PaymentRecord.fromJson(data) as T;
    }
    if (t == _i23.VisitorEntry) {
      return _i23.VisitorEntry.fromJson(data) as T;
    }
    if (t == _i24.VisitorStatus) {
      return _i24.VisitorStatus.fromJson(data) as T;
    }
    if (t == _i1.getType<_i5.LedgerAccount?>()) {
      return (data != null ? _i5.LedgerAccount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.LedgerEntry?>()) {
      return (data != null ? _i6.LedgerEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.VoucherRequest?>()) {
      return (data != null ? _i7.VoucherRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.VoucherStatus?>()) {
      return (data != null ? _i8.VoucherStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Complaint?>()) {
      return (data != null ? _i9.Complaint.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.ComplaintStatus?>()) {
      return (data != null ? _i10.ComplaintStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Notice?>()) {
      return (data != null ? _i11.Notice.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Building?>()) {
      return (data != null ? _i12.Building.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Complex?>()) {
      return (data != null ? _i13.Complex.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Flat?>()) {
      return (data != null ? _i14.Flat.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Society?>()) {
      return (data != null ? _i15.Society.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.SocietyUser?>()) {
      return (data != null ? _i16.SocietyUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.UserRole?>()) {
      return (data != null ? _i17.UserRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Greeting?>()) {
      return (data != null ? _i18.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.BillStatus?>()) {
      return (data != null ? _i19.BillStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.MaintenanceBill?>()) {
      return (data != null ? _i20.MaintenanceBill.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.MaintenanceHead?>()) {
      return (data != null ? _i21.MaintenanceHead.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.PaymentRecord?>()) {
      return (data != null ? _i22.PaymentRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.VisitorEntry?>()) {
      return (data != null ? _i23.VisitorEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.VisitorStatus?>()) {
      return (data != null ? _i24.VisitorStatus.fromJson(data) : null) as T;
    }
    if (t == List<_i25.VoucherRequest>) {
      return (data as List)
              .map((e) => deserialize<_i25.VoucherRequest>(e))
              .toList()
          as T;
    }
    if (t == List<_i26.LedgerEntry>) {
      return (data as List)
              .map((e) => deserialize<_i26.LedgerEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i27.LedgerAccount>) {
      return (data as List)
              .map((e) => deserialize<_i27.LedgerAccount>(e))
              .toList()
          as T;
    }
    if (t == List<_i28.Notice>) {
      return (data as List).map((e) => deserialize<_i28.Notice>(e)).toList()
          as T;
    }
    if (t == List<_i29.Complaint>) {
      return (data as List).map((e) => deserialize<_i29.Complaint>(e)).toList()
          as T;
    }
    if (t == List<_i30.Society>) {
      return (data as List).map((e) => deserialize<_i30.Society>(e)).toList()
          as T;
    }
    if (t == List<_i31.Flat>) {
      return (data as List).map((e) => deserialize<_i31.Flat>(e)).toList() as T;
    }
    if (t == List<_i32.SocietyUser>) {
      return (data as List)
              .map((e) => deserialize<_i32.SocietyUser>(e))
              .toList()
          as T;
    }
    if (t == List<_i33.MaintenanceBill>) {
      return (data as List)
              .map((e) => deserialize<_i33.MaintenanceBill>(e))
              .toList()
          as T;
    }
    if (t == List<_i34.PaymentRecord>) {
      return (data as List)
              .map((e) => deserialize<_i34.PaymentRecord>(e))
              .toList()
          as T;
    }
    if (t == List<_i35.VisitorEntry>) {
      return (data as List)
              .map((e) => deserialize<_i35.VisitorEntry>(e))
              .toList()
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i5.LedgerAccount => 'LedgerAccount',
      _i6.LedgerEntry => 'LedgerEntry',
      _i7.VoucherRequest => 'VoucherRequest',
      _i8.VoucherStatus => 'VoucherStatus',
      _i9.Complaint => 'Complaint',
      _i10.ComplaintStatus => 'ComplaintStatus',
      _i11.Notice => 'Notice',
      _i12.Building => 'Building',
      _i13.Complex => 'Complex',
      _i14.Flat => 'Flat',
      _i15.Society => 'Society',
      _i16.SocietyUser => 'SocietyUser',
      _i17.UserRole => 'UserRole',
      _i18.Greeting => 'Greeting',
      _i19.BillStatus => 'BillStatus',
      _i20.MaintenanceBill => 'MaintenanceBill',
      _i21.MaintenanceHead => 'MaintenanceHead',
      _i22.PaymentRecord => 'PaymentRecord',
      _i23.VisitorEntry => 'VisitorEntry',
      _i24.VisitorStatus => 'VisitorStatus',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('society.', '');
    }

    switch (data) {
      case _i5.LedgerAccount():
        return 'LedgerAccount';
      case _i6.LedgerEntry():
        return 'LedgerEntry';
      case _i7.VoucherRequest():
        return 'VoucherRequest';
      case _i8.VoucherStatus():
        return 'VoucherStatus';
      case _i9.Complaint():
        return 'Complaint';
      case _i10.ComplaintStatus():
        return 'ComplaintStatus';
      case _i11.Notice():
        return 'Notice';
      case _i12.Building():
        return 'Building';
      case _i13.Complex():
        return 'Complex';
      case _i14.Flat():
        return 'Flat';
      case _i15.Society():
        return 'Society';
      case _i16.SocietyUser():
        return 'SocietyUser';
      case _i17.UserRole():
        return 'UserRole';
      case _i18.Greeting():
        return 'Greeting';
      case _i19.BillStatus():
        return 'BillStatus';
      case _i20.MaintenanceBill():
        return 'MaintenanceBill';
      case _i21.MaintenanceHead():
        return 'MaintenanceHead';
      case _i22.PaymentRecord():
        return 'PaymentRecord';
      case _i23.VisitorEntry():
        return 'VisitorEntry';
      case _i24.VisitorStatus():
        return 'VisitorStatus';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i4.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'LedgerAccount') {
      return deserialize<_i5.LedgerAccount>(data['data']);
    }
    if (dataClassName == 'LedgerEntry') {
      return deserialize<_i6.LedgerEntry>(data['data']);
    }
    if (dataClassName == 'VoucherRequest') {
      return deserialize<_i7.VoucherRequest>(data['data']);
    }
    if (dataClassName == 'VoucherStatus') {
      return deserialize<_i8.VoucherStatus>(data['data']);
    }
    if (dataClassName == 'Complaint') {
      return deserialize<_i9.Complaint>(data['data']);
    }
    if (dataClassName == 'ComplaintStatus') {
      return deserialize<_i10.ComplaintStatus>(data['data']);
    }
    if (dataClassName == 'Notice') {
      return deserialize<_i11.Notice>(data['data']);
    }
    if (dataClassName == 'Building') {
      return deserialize<_i12.Building>(data['data']);
    }
    if (dataClassName == 'Complex') {
      return deserialize<_i13.Complex>(data['data']);
    }
    if (dataClassName == 'Flat') {
      return deserialize<_i14.Flat>(data['data']);
    }
    if (dataClassName == 'Society') {
      return deserialize<_i15.Society>(data['data']);
    }
    if (dataClassName == 'SocietyUser') {
      return deserialize<_i16.SocietyUser>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_i17.UserRole>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i18.Greeting>(data['data']);
    }
    if (dataClassName == 'BillStatus') {
      return deserialize<_i19.BillStatus>(data['data']);
    }
    if (dataClassName == 'MaintenanceBill') {
      return deserialize<_i20.MaintenanceBill>(data['data']);
    }
    if (dataClassName == 'MaintenanceHead') {
      return deserialize<_i21.MaintenanceHead>(data['data']);
    }
    if (dataClassName == 'PaymentRecord') {
      return deserialize<_i22.PaymentRecord>(data['data']);
    }
    if (dataClassName == 'VisitorEntry') {
      return deserialize<_i23.VisitorEntry>(data['data']);
    }
    if (dataClassName == 'VisitorStatus') {
      return deserialize<_i24.VisitorStatus>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i4.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i4.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i5.LedgerAccount:
        return _i5.LedgerAccount.t;
      case _i6.LedgerEntry:
        return _i6.LedgerEntry.t;
      case _i7.VoucherRequest:
        return _i7.VoucherRequest.t;
      case _i9.Complaint:
        return _i9.Complaint.t;
      case _i11.Notice:
        return _i11.Notice.t;
      case _i12.Building:
        return _i12.Building.t;
      case _i13.Complex:
        return _i13.Complex.t;
      case _i14.Flat:
        return _i14.Flat.t;
      case _i15.Society:
        return _i15.Society.t;
      case _i16.SocietyUser:
        return _i16.SocietyUser.t;
      case _i20.MaintenanceBill:
        return _i20.MaintenanceBill.t;
      case _i21.MaintenanceHead:
        return _i21.MaintenanceHead.t;
      case _i22.PaymentRecord:
        return _i22.PaymentRecord.t;
      case _i23.VisitorEntry:
        return _i23.VisitorEntry.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'society';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i3.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i4.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
