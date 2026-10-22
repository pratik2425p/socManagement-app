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
import 'core/models/society_invitation.dart' as _i16;
import 'core/models/society_user.dart' as _i17;
import 'core/models/user_role.dart' as _i18;
import 'documents/models/document_category.dart' as _i19;
import 'documents/models/meeting_minutes.dart' as _i20;
import 'documents/models/society_document.dart' as _i21;
import 'emergency/models/emergency_type.dart' as _i22;
import 'emergency/models/sos_alert.dart' as _i23;
import 'emergency/models/sos_status.dart' as _i24;
import 'greetings/greeting.dart' as _i25;
import 'maintenance/models/bill_status.dart' as _i26;
import 'maintenance/models/maintenance_bill.dart' as _i27;
import 'maintenance/models/maintenance_head.dart' as _i28;
import 'maintenance/models/payment_record.dart' as _i29;
import 'polling/models/poll_option.dart' as _i30;
import 'polling/models/poll_status.dart' as _i31;
import 'polling/models/poll_vote.dart' as _i32;
import 'polling/models/society_poll.dart' as _i33;
import 'saas_admin/models/saas_metric_summary.dart' as _i34;
import 'saas_admin/models/society_subscription.dart' as _i35;
import 'saas_admin/models/subscription_tier.dart' as _i36;
import 'visitor/models/visitor_entry.dart' as _i37;
import 'visitor/models/visitor_status.dart' as _i38;
import 'package:society_server/src/generated/accounting/models/voucher_request.dart'
    as _i39;
import 'package:society_server/src/generated/accounting/models/ledger_entry.dart'
    as _i40;
import 'package:society_server/src/generated/accounting/models/ledger_account.dart'
    as _i41;
import 'package:society_server/src/generated/communication/models/notice.dart'
    as _i42;
import 'package:society_server/src/generated/communication/models/complaint.dart'
    as _i43;
import 'package:society_server/src/generated/core/models/society.dart' as _i44;
import 'package:society_server/src/generated/core/models/building.dart' as _i45;
import 'package:society_server/src/generated/core/models/flat.dart' as _i46;
import 'package:society_server/src/generated/core/models/society_user.dart'
    as _i47;
import 'package:society_server/src/generated/core/models/society_invitation.dart'
    as _i48;
import 'package:society_server/src/generated/documents/models/society_document.dart'
    as _i49;
import 'package:society_server/src/generated/documents/models/meeting_minutes.dart'
    as _i50;
import 'package:society_server/src/generated/emergency/models/sos_alert.dart'
    as _i51;
import 'package:society_server/src/generated/maintenance/models/maintenance_bill.dart'
    as _i52;
import 'package:society_server/src/generated/maintenance/models/payment_record.dart'
    as _i53;
import 'package:society_server/src/generated/polling/models/society_poll.dart'
    as _i54;
import 'package:society_server/src/generated/polling/models/poll_option.dart'
    as _i55;
import 'package:society_server/src/generated/saas_admin/models/society_subscription.dart'
    as _i56;
import 'package:society_server/src/generated/visitor/models/visitor_entry.dart'
    as _i57;
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
export 'core/models/society_invitation.dart';
export 'core/models/society_user.dart';
export 'core/models/user_role.dart';
export 'documents/models/document_category.dart';
export 'documents/models/meeting_minutes.dart';
export 'documents/models/society_document.dart';
export 'emergency/models/emergency_type.dart';
export 'emergency/models/sos_alert.dart';
export 'emergency/models/sos_status.dart';
export 'greetings/greeting.dart';
export 'maintenance/models/bill_status.dart';
export 'maintenance/models/maintenance_bill.dart';
export 'maintenance/models/maintenance_head.dart';
export 'maintenance/models/payment_record.dart';
export 'polling/models/poll_option.dart';
export 'polling/models/poll_status.dart';
export 'polling/models/poll_vote.dart';
export 'polling/models/society_poll.dart';
export 'saas_admin/models/saas_metric_summary.dart';
export 'saas_admin/models/society_subscription.dart';
export 'saas_admin/models/subscription_tier.dart';
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
      name: 'meeting_minutes',
      dartName: 'MeetingMinutes',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'meeting_minutes_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'societyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'meetingTitle',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'meetingType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'meetingDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'agenda',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'minutesSummary',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'attendeesCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'documentUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'recordedByName',
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
          indexName: 'meeting_minutes_pkey',
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
      name: 'poll_option',
      dartName: 'PollOption',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'poll_option_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'pollId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'optionText',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'votesCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'poll_option_pkey',
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
      name: 'poll_vote',
      dartName: 'PollVote',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'poll_vote_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'pollId',
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
          name: 'voterName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'optionId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'votedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'poll_vote_pkey',
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
      name: 'society_document',
      dartName: 'SocietyDocument',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'society_document_id_seq\'::regclass)',
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
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'category',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:DocumentCategory',
        ),
        _i2.ColumnDefinition(
          name: 'fileUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'fileSize',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'uploadedByName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isCommitteeOnly',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'uploadedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'society_document_pkey',
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
      name: 'society_invitation',
      dartName: 'SocietyInvitation',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'society_invitation_id_seq\'::regclass)',
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
          name: 'inviteeName',
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
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'role',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:UserRole',
        ),
        _i2.ColumnDefinition(
          name: 'occupancyType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'inviteCode',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'expiresAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
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
          indexName: 'society_invitation_pkey',
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
      name: 'society_poll',
      dartName: 'SocietyPoll',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'society_poll_id_seq\'::regclass)',
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
          dartType: 'protocol:PollStatus',
        ),
        _i2.ColumnDefinition(
          name: 'startDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'endDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'totalEligibleFlats',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'totalVotesCast',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdByName',
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
          indexName: 'society_poll_pkey',
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
      name: 'society_subscription',
      dartName: 'SocietySubscription',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'society_subscription_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'societyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'societyName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'tier',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:SubscriptionTier',
        ),
        _i2.ColumnDefinition(
          name: 'flatCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'ratePerFlat',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'monthlyTotal',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'billingCycle',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'nextRenewalDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'contactEmail',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'contactPhone',
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
          indexName: 'society_subscription_pkey',
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
      name: 'sos_alert',
      dartName: 'SosAlert',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'sos_alert_id_seq\'::regclass)',
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
          name: 'raisedByName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'emergencyType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:EmergencyType',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:SosStatus',
        ),
        _i2.ColumnDefinition(
          name: 'acknowledgedByName',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'acknowledgedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'resolvedByName',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'resolvedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'resolutionNotes',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'raisedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'sos_alert_pkey',
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
    if (t == _i16.SocietyInvitation) {
      return _i16.SocietyInvitation.fromJson(data) as T;
    }
    if (t == _i17.SocietyUser) {
      return _i17.SocietyUser.fromJson(data) as T;
    }
    if (t == _i18.UserRole) {
      return _i18.UserRole.fromJson(data) as T;
    }
    if (t == _i19.DocumentCategory) {
      return _i19.DocumentCategory.fromJson(data) as T;
    }
    if (t == _i20.MeetingMinutes) {
      return _i20.MeetingMinutes.fromJson(data) as T;
    }
    if (t == _i21.SocietyDocument) {
      return _i21.SocietyDocument.fromJson(data) as T;
    }
    if (t == _i22.EmergencyType) {
      return _i22.EmergencyType.fromJson(data) as T;
    }
    if (t == _i23.SosAlert) {
      return _i23.SosAlert.fromJson(data) as T;
    }
    if (t == _i24.SosStatus) {
      return _i24.SosStatus.fromJson(data) as T;
    }
    if (t == _i25.Greeting) {
      return _i25.Greeting.fromJson(data) as T;
    }
    if (t == _i26.BillStatus) {
      return _i26.BillStatus.fromJson(data) as T;
    }
    if (t == _i27.MaintenanceBill) {
      return _i27.MaintenanceBill.fromJson(data) as T;
    }
    if (t == _i28.MaintenanceHead) {
      return _i28.MaintenanceHead.fromJson(data) as T;
    }
    if (t == _i29.PaymentRecord) {
      return _i29.PaymentRecord.fromJson(data) as T;
    }
    if (t == _i30.PollOption) {
      return _i30.PollOption.fromJson(data) as T;
    }
    if (t == _i31.PollStatus) {
      return _i31.PollStatus.fromJson(data) as T;
    }
    if (t == _i32.PollVote) {
      return _i32.PollVote.fromJson(data) as T;
    }
    if (t == _i33.SocietyPoll) {
      return _i33.SocietyPoll.fromJson(data) as T;
    }
    if (t == _i34.SaasMetricSummary) {
      return _i34.SaasMetricSummary.fromJson(data) as T;
    }
    if (t == _i35.SocietySubscription) {
      return _i35.SocietySubscription.fromJson(data) as T;
    }
    if (t == _i36.SubscriptionTier) {
      return _i36.SubscriptionTier.fromJson(data) as T;
    }
    if (t == _i37.VisitorEntry) {
      return _i37.VisitorEntry.fromJson(data) as T;
    }
    if (t == _i38.VisitorStatus) {
      return _i38.VisitorStatus.fromJson(data) as T;
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
    if (t == _i1.getType<_i16.SocietyInvitation?>()) {
      return (data != null ? _i16.SocietyInvitation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.SocietyUser?>()) {
      return (data != null ? _i17.SocietyUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.UserRole?>()) {
      return (data != null ? _i18.UserRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.DocumentCategory?>()) {
      return (data != null ? _i19.DocumentCategory.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.MeetingMinutes?>()) {
      return (data != null ? _i20.MeetingMinutes.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.SocietyDocument?>()) {
      return (data != null ? _i21.SocietyDocument.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.EmergencyType?>()) {
      return (data != null ? _i22.EmergencyType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.SosAlert?>()) {
      return (data != null ? _i23.SosAlert.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.SosStatus?>()) {
      return (data != null ? _i24.SosStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.Greeting?>()) {
      return (data != null ? _i25.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.BillStatus?>()) {
      return (data != null ? _i26.BillStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.MaintenanceBill?>()) {
      return (data != null ? _i27.MaintenanceBill.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.MaintenanceHead?>()) {
      return (data != null ? _i28.MaintenanceHead.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.PaymentRecord?>()) {
      return (data != null ? _i29.PaymentRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.PollOption?>()) {
      return (data != null ? _i30.PollOption.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.PollStatus?>()) {
      return (data != null ? _i31.PollStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.PollVote?>()) {
      return (data != null ? _i32.PollVote.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.SocietyPoll?>()) {
      return (data != null ? _i33.SocietyPoll.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.SaasMetricSummary?>()) {
      return (data != null ? _i34.SaasMetricSummary.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.SocietySubscription?>()) {
      return (data != null ? _i35.SocietySubscription.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i36.SubscriptionTier?>()) {
      return (data != null ? _i36.SubscriptionTier.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.VisitorEntry?>()) {
      return (data != null ? _i37.VisitorEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.VisitorStatus?>()) {
      return (data != null ? _i38.VisitorStatus.fromJson(data) : null) as T;
    }
    if (t == List<_i39.VoucherRequest>) {
      return (data as List)
              .map((e) => deserialize<_i39.VoucherRequest>(e))
              .toList()
          as T;
    }
    if (t == List<_i40.LedgerEntry>) {
      return (data as List)
              .map((e) => deserialize<_i40.LedgerEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i41.LedgerAccount>) {
      return (data as List)
              .map((e) => deserialize<_i41.LedgerAccount>(e))
              .toList()
          as T;
    }
    if (t == List<_i42.Notice>) {
      return (data as List).map((e) => deserialize<_i42.Notice>(e)).toList()
          as T;
    }
    if (t == List<_i43.Complaint>) {
      return (data as List).map((e) => deserialize<_i43.Complaint>(e)).toList()
          as T;
    }
    if (t == List<_i44.Society>) {
      return (data as List).map((e) => deserialize<_i44.Society>(e)).toList()
          as T;
    }
    if (t == List<_i45.Building>) {
      return (data as List).map((e) => deserialize<_i45.Building>(e)).toList()
          as T;
    }
    if (t == List<_i46.Flat>) {
      return (data as List).map((e) => deserialize<_i46.Flat>(e)).toList() as T;
    }
    if (t == List<_i47.SocietyUser>) {
      return (data as List)
              .map((e) => deserialize<_i47.SocietyUser>(e))
              .toList()
          as T;
    }
    if (t == List<_i48.SocietyInvitation>) {
      return (data as List)
              .map((e) => deserialize<_i48.SocietyInvitation>(e))
              .toList()
          as T;
    }
    if (t == List<_i49.SocietyDocument>) {
      return (data as List)
              .map((e) => deserialize<_i49.SocietyDocument>(e))
              .toList()
          as T;
    }
    if (t == List<_i50.MeetingMinutes>) {
      return (data as List)
              .map((e) => deserialize<_i50.MeetingMinutes>(e))
              .toList()
          as T;
    }
    if (t == List<_i51.SosAlert>) {
      return (data as List).map((e) => deserialize<_i51.SosAlert>(e)).toList()
          as T;
    }
    if (t == List<_i52.MaintenanceBill>) {
      return (data as List)
              .map((e) => deserialize<_i52.MaintenanceBill>(e))
              .toList()
          as T;
    }
    if (t == List<_i53.PaymentRecord>) {
      return (data as List)
              .map((e) => deserialize<_i53.PaymentRecord>(e))
              .toList()
          as T;
    }
    if (t == List<_i54.SocietyPoll>) {
      return (data as List)
              .map((e) => deserialize<_i54.SocietyPoll>(e))
              .toList()
          as T;
    }
    if (t == List<_i55.PollOption>) {
      return (data as List).map((e) => deserialize<_i55.PollOption>(e)).toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i56.SocietySubscription>) {
      return (data as List)
              .map((e) => deserialize<_i56.SocietySubscription>(e))
              .toList()
          as T;
    }
    if (t == List<_i57.VisitorEntry>) {
      return (data as List)
              .map((e) => deserialize<_i57.VisitorEntry>(e))
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
      _i16.SocietyInvitation => 'SocietyInvitation',
      _i17.SocietyUser => 'SocietyUser',
      _i18.UserRole => 'UserRole',
      _i19.DocumentCategory => 'DocumentCategory',
      _i20.MeetingMinutes => 'MeetingMinutes',
      _i21.SocietyDocument => 'SocietyDocument',
      _i22.EmergencyType => 'EmergencyType',
      _i23.SosAlert => 'SosAlert',
      _i24.SosStatus => 'SosStatus',
      _i25.Greeting => 'Greeting',
      _i26.BillStatus => 'BillStatus',
      _i27.MaintenanceBill => 'MaintenanceBill',
      _i28.MaintenanceHead => 'MaintenanceHead',
      _i29.PaymentRecord => 'PaymentRecord',
      _i30.PollOption => 'PollOption',
      _i31.PollStatus => 'PollStatus',
      _i32.PollVote => 'PollVote',
      _i33.SocietyPoll => 'SocietyPoll',
      _i34.SaasMetricSummary => 'SaasMetricSummary',
      _i35.SocietySubscription => 'SocietySubscription',
      _i36.SubscriptionTier => 'SubscriptionTier',
      _i37.VisitorEntry => 'VisitorEntry',
      _i38.VisitorStatus => 'VisitorStatus',
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
      case _i16.SocietyInvitation():
        return 'SocietyInvitation';
      case _i17.SocietyUser():
        return 'SocietyUser';
      case _i18.UserRole():
        return 'UserRole';
      case _i19.DocumentCategory():
        return 'DocumentCategory';
      case _i20.MeetingMinutes():
        return 'MeetingMinutes';
      case _i21.SocietyDocument():
        return 'SocietyDocument';
      case _i22.EmergencyType():
        return 'EmergencyType';
      case _i23.SosAlert():
        return 'SosAlert';
      case _i24.SosStatus():
        return 'SosStatus';
      case _i25.Greeting():
        return 'Greeting';
      case _i26.BillStatus():
        return 'BillStatus';
      case _i27.MaintenanceBill():
        return 'MaintenanceBill';
      case _i28.MaintenanceHead():
        return 'MaintenanceHead';
      case _i29.PaymentRecord():
        return 'PaymentRecord';
      case _i30.PollOption():
        return 'PollOption';
      case _i31.PollStatus():
        return 'PollStatus';
      case _i32.PollVote():
        return 'PollVote';
      case _i33.SocietyPoll():
        return 'SocietyPoll';
      case _i34.SaasMetricSummary():
        return 'SaasMetricSummary';
      case _i35.SocietySubscription():
        return 'SocietySubscription';
      case _i36.SubscriptionTier():
        return 'SubscriptionTier';
      case _i37.VisitorEntry():
        return 'VisitorEntry';
      case _i38.VisitorStatus():
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
    if (dataClassName == 'SocietyInvitation') {
      return deserialize<_i16.SocietyInvitation>(data['data']);
    }
    if (dataClassName == 'SocietyUser') {
      return deserialize<_i17.SocietyUser>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_i18.UserRole>(data['data']);
    }
    if (dataClassName == 'DocumentCategory') {
      return deserialize<_i19.DocumentCategory>(data['data']);
    }
    if (dataClassName == 'MeetingMinutes') {
      return deserialize<_i20.MeetingMinutes>(data['data']);
    }
    if (dataClassName == 'SocietyDocument') {
      return deserialize<_i21.SocietyDocument>(data['data']);
    }
    if (dataClassName == 'EmergencyType') {
      return deserialize<_i22.EmergencyType>(data['data']);
    }
    if (dataClassName == 'SosAlert') {
      return deserialize<_i23.SosAlert>(data['data']);
    }
    if (dataClassName == 'SosStatus') {
      return deserialize<_i24.SosStatus>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i25.Greeting>(data['data']);
    }
    if (dataClassName == 'BillStatus') {
      return deserialize<_i26.BillStatus>(data['data']);
    }
    if (dataClassName == 'MaintenanceBill') {
      return deserialize<_i27.MaintenanceBill>(data['data']);
    }
    if (dataClassName == 'MaintenanceHead') {
      return deserialize<_i28.MaintenanceHead>(data['data']);
    }
    if (dataClassName == 'PaymentRecord') {
      return deserialize<_i29.PaymentRecord>(data['data']);
    }
    if (dataClassName == 'PollOption') {
      return deserialize<_i30.PollOption>(data['data']);
    }
    if (dataClassName == 'PollStatus') {
      return deserialize<_i31.PollStatus>(data['data']);
    }
    if (dataClassName == 'PollVote') {
      return deserialize<_i32.PollVote>(data['data']);
    }
    if (dataClassName == 'SocietyPoll') {
      return deserialize<_i33.SocietyPoll>(data['data']);
    }
    if (dataClassName == 'SaasMetricSummary') {
      return deserialize<_i34.SaasMetricSummary>(data['data']);
    }
    if (dataClassName == 'SocietySubscription') {
      return deserialize<_i35.SocietySubscription>(data['data']);
    }
    if (dataClassName == 'SubscriptionTier') {
      return deserialize<_i36.SubscriptionTier>(data['data']);
    }
    if (dataClassName == 'VisitorEntry') {
      return deserialize<_i37.VisitorEntry>(data['data']);
    }
    if (dataClassName == 'VisitorStatus') {
      return deserialize<_i38.VisitorStatus>(data['data']);
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
      case _i16.SocietyInvitation:
        return _i16.SocietyInvitation.t;
      case _i17.SocietyUser:
        return _i17.SocietyUser.t;
      case _i20.MeetingMinutes:
        return _i20.MeetingMinutes.t;
      case _i21.SocietyDocument:
        return _i21.SocietyDocument.t;
      case _i23.SosAlert:
        return _i23.SosAlert.t;
      case _i27.MaintenanceBill:
        return _i27.MaintenanceBill.t;
      case _i28.MaintenanceHead:
        return _i28.MaintenanceHead.t;
      case _i29.PaymentRecord:
        return _i29.PaymentRecord.t;
      case _i30.PollOption:
        return _i30.PollOption.t;
      case _i32.PollVote:
        return _i32.PollVote.t;
      case _i33.SocietyPoll:
        return _i33.SocietyPoll.t;
      case _i35.SocietySubscription:
        return _i35.SocietySubscription.t;
      case _i37.VisitorEntry:
        return _i37.VisitorEntry.t;
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
