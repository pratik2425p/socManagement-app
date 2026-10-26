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
import 'amenity/models/amenity.dart' as _i9;
import 'amenity/models/amenity_booking.dart' as _i10;
import 'amenity/models/booking_status.dart' as _i11;
import 'audit/models/audit_category.dart' as _i12;
import 'audit/models/audit_log.dart' as _i13;
import 'auth/models/auth_response.dart' as _i14;
import 'auth/models/otp_send_result.dart' as _i15;
import 'auth/models/phone_otp.dart' as _i16;
import 'communication/models/complaint.dart' as _i17;
import 'communication/models/complaint_status.dart' as _i18;
import 'communication/models/notice.dart' as _i19;
import 'core/models/building.dart' as _i20;
import 'core/models/complex.dart' as _i21;
import 'core/models/flat.dart' as _i22;
import 'core/models/society.dart' as _i23;
import 'core/models/society_invitation.dart' as _i24;
import 'core/models/society_user.dart' as _i25;
import 'core/models/user_role.dart' as _i26;
import 'documents/models/document_category.dart' as _i27;
import 'documents/models/meeting_minutes.dart' as _i28;
import 'documents/models/society_document.dart' as _i29;
import 'documents/models/upload_description_response.dart' as _i30;
import 'emergency/models/emergency_type.dart' as _i31;
import 'emergency/models/sos_alert.dart' as _i32;
import 'emergency/models/sos_status.dart' as _i33;
import 'greetings/greeting.dart' as _i34;
import 'maintenance/models/bill_status.dart' as _i35;
import 'maintenance/models/maintenance_bill.dart' as _i36;
import 'maintenance/models/maintenance_head.dart' as _i37;
import 'maintenance/models/payment_record.dart' as _i38;
import 'notifications/models/device_token.dart' as _i39;
import 'notifications/models/push_notification_payload.dart' as _i40;
import 'payment/models/payment_order.dart' as _i41;
import 'payment/models/payment_transaction.dart' as _i42;
import 'payment/models/payment_transaction_status.dart' as _i43;
import 'payment/models/payment_verification_result.dart' as _i44;
import 'payment/models/webhook_result.dart' as _i45;
import 'polling/models/poll_option.dart' as _i46;
import 'polling/models/poll_status.dart' as _i47;
import 'polling/models/poll_vote.dart' as _i48;
import 'polling/models/society_poll.dart' as _i49;
import 'realtime/models/gate_bell_event.dart' as _i50;
import 'realtime/models/sos_alert_event.dart' as _i51;
import 'saas_admin/models/saas_metric_summary.dart' as _i52;
import 'saas_admin/models/society_subscription.dart' as _i53;
import 'saas_admin/models/subscription_tier.dart' as _i54;
import 'tenancy/models/noc_status.dart' as _i55;
import 'tenancy/models/tenant_noc.dart' as _i56;
import 'visitor/models/visitor_entry.dart' as _i57;
import 'visitor/models/visitor_status.dart' as _i58;
import 'package:society_server/src/generated/accounting/models/voucher_request.dart'
    as _i59;
import 'package:society_server/src/generated/accounting/models/ledger_entry.dart'
    as _i60;
import 'package:society_server/src/generated/accounting/models/ledger_account.dart'
    as _i61;
import 'package:society_server/src/generated/amenity/models/amenity.dart'
    as _i62;
import 'package:society_server/src/generated/amenity/models/amenity_booking.dart'
    as _i63;
import 'package:society_server/src/generated/audit/models/audit_log.dart'
    as _i64;
import 'package:society_server/src/generated/communication/models/notice.dart'
    as _i65;
import 'package:society_server/src/generated/communication/models/complaint.dart'
    as _i66;
import 'package:society_server/src/generated/core/models/society.dart' as _i67;
import 'package:society_server/src/generated/core/models/building.dart' as _i68;
import 'package:society_server/src/generated/core/models/flat.dart' as _i69;
import 'package:society_server/src/generated/core/models/society_user.dart'
    as _i70;
import 'package:society_server/src/generated/core/models/society_invitation.dart'
    as _i71;
import 'package:society_server/src/generated/documents/models/society_document.dart'
    as _i72;
import 'package:society_server/src/generated/documents/models/meeting_minutes.dart'
    as _i73;
import 'package:society_server/src/generated/emergency/models/sos_alert.dart'
    as _i74;
import 'package:society_server/src/generated/maintenance/models/maintenance_bill.dart'
    as _i75;
import 'package:society_server/src/generated/maintenance/models/payment_record.dart'
    as _i76;
import 'package:society_server/src/generated/polling/models/society_poll.dart'
    as _i77;
import 'package:society_server/src/generated/polling/models/poll_option.dart'
    as _i78;
import 'package:society_server/src/generated/saas_admin/models/society_subscription.dart'
    as _i79;
import 'package:society_server/src/generated/tenancy/models/tenant_noc.dart'
    as _i80;
import 'package:society_server/src/generated/visitor/models/visitor_entry.dart'
    as _i81;
export 'accounting/models/ledger_account.dart';
export 'accounting/models/ledger_entry.dart';
export 'accounting/models/voucher_request.dart';
export 'accounting/models/voucher_status.dart';
export 'amenity/models/amenity.dart';
export 'amenity/models/amenity_booking.dart';
export 'amenity/models/booking_status.dart';
export 'audit/models/audit_category.dart';
export 'audit/models/audit_log.dart';
export 'auth/models/auth_response.dart';
export 'auth/models/otp_send_result.dart';
export 'auth/models/phone_otp.dart';
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
export 'documents/models/upload_description_response.dart';
export 'emergency/models/emergency_type.dart';
export 'emergency/models/sos_alert.dart';
export 'emergency/models/sos_status.dart';
export 'greetings/greeting.dart';
export 'maintenance/models/bill_status.dart';
export 'maintenance/models/maintenance_bill.dart';
export 'maintenance/models/maintenance_head.dart';
export 'maintenance/models/payment_record.dart';
export 'notifications/models/device_token.dart';
export 'notifications/models/push_notification_payload.dart';
export 'payment/models/payment_order.dart';
export 'payment/models/payment_transaction.dart';
export 'payment/models/payment_transaction_status.dart';
export 'payment/models/payment_verification_result.dart';
export 'payment/models/webhook_result.dart';
export 'polling/models/poll_option.dart';
export 'polling/models/poll_status.dart';
export 'polling/models/poll_vote.dart';
export 'polling/models/society_poll.dart';
export 'realtime/models/gate_bell_event.dart';
export 'realtime/models/sos_alert_event.dart';
export 'saas_admin/models/saas_metric_summary.dart';
export 'saas_admin/models/society_subscription.dart';
export 'saas_admin/models/subscription_tier.dart';
export 'tenancy/models/noc_status.dart';
export 'tenancy/models/tenant_noc.dart';
export 'visitor/models/visitor_entry.dart';
export 'visitor/models/visitor_status.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'amenity',
      dartName: 'Amenity',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'amenity_id_seq\'::regclass)',
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
          name: 'icon',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'capacity',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'rate',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'unit',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'timeSlots',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'rules',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isActive',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
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
          indexName: 'amenity_pkey',
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
        _i2.IndexDefinition(
          indexName: 'amenity_society_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'societyId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'amenity_booking',
      dartName: 'AmenityBooking',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'amenity_booking_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'societyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'amenityId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'amenityName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'flatNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'bookedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'bookedByName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'bookingDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'slot',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'amountPaid',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:BookingStatus',
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
          indexName: 'amenity_booking_pkey',
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
        _i2.IndexDefinition(
          indexName: 'amenity_booking_society_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'societyId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'amenity_booking_unique_slot_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'societyId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'amenityId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'bookingDate',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'slot',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'audit_log',
      dartName: 'AuditLog',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'audit_log_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'societyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'category',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:AuditCategory',
        ),
        _i2.ColumnDefinition(
          name: 'action',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'actorId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'actorName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'actorRole',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:UserRole',
        ),
        _i2.ColumnDefinition(
          name: 'target',
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
          name: 'timestamp',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'audit_log_pkey',
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
        _i2.IndexDefinition(
          indexName: 'audit_log_society_timestamp_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'societyId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'timestamp',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'audit_log_society_category_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'societyId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'category',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
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
      name: 'device_token',
      dartName: 'DeviceToken',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'device_token_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'societyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'deviceToken',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'platform',
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
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'device_token_pkey',
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
        _i2.IndexDefinition(
          indexName: 'device_token_user_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'device_token_token_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'deviceToken',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
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
      name: 'payment_transaction',
      dartName: 'PaymentTransaction',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'payment_transaction_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'orderId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'billId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'societyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'amount',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'amountPaise',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'currency',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:PaymentTransactionStatus',
        ),
        _i2.ColumnDefinition(
          name: 'razorpayPaymentId',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'razorpaySignature',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'receiptNumber',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'idempotencyKey',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'failureReason',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'isProcessed',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'payment_transaction_pkey',
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
        _i2.IndexDefinition(
          indexName: 'payment_tx_order_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'orderId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'payment_tx_bill_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'billId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'payment_tx_society_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'societyId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'payment_tx_payment_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'razorpayPaymentId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'phone_otp',
      dartName: 'PhoneOtp',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'phone_otp_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'phone',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'salt',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'otpHash',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'attempts',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'maxAttempts',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'expiresAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'lastSentAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'ipAddress',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'isUsed',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'phone_otp_pkey',
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
        _i2.IndexDefinition(
          indexName: 'phone_otp_phone_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'phone',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'phone_otp_expires_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'expiresAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
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
          name: 'registrationNumber',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'gstin',
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
          name: 'storagePath',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
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
        _i2.IndexDefinition(
          indexName: 'society_document_society_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'societyId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
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
          name: 'authUserId',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
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
        _i2.IndexDefinition(
          indexName: 'society_user_phone_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'phone',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'society_user_auth_user_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'authUserId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
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
      name: 'tenant_noc',
      dartName: 'TenantNoc',
      schema: 'public',
      module: 'society',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'tenant_noc_id_seq\'::regclass)',
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
          name: 'ownerName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'ownerPhone',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'tenantName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'tenantPhone',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'leaseStart',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'leaseEnd',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'monthlyRent',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'nocNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:NocStatus',
        ),
        _i2.ColumnDefinition(
          name: 'resolutionNotes',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'issuedAt',
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
        _i2.ColumnDefinition(
          name: 'documentPath',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'documentUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'tenant_noc_pkey',
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
        _i2.IndexDefinition(
          indexName: 'tenant_noc_society_flat_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'societyId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'flatNumber',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'tenant_noc_society_status_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'societyId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'status',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
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
    if (t == _i9.Amenity) {
      return _i9.Amenity.fromJson(data) as T;
    }
    if (t == _i10.AmenityBooking) {
      return _i10.AmenityBooking.fromJson(data) as T;
    }
    if (t == _i11.BookingStatus) {
      return _i11.BookingStatus.fromJson(data) as T;
    }
    if (t == _i12.AuditCategory) {
      return _i12.AuditCategory.fromJson(data) as T;
    }
    if (t == _i13.AuditLog) {
      return _i13.AuditLog.fromJson(data) as T;
    }
    if (t == _i14.AuthResponse) {
      return _i14.AuthResponse.fromJson(data) as T;
    }
    if (t == _i15.OtpSendResult) {
      return _i15.OtpSendResult.fromJson(data) as T;
    }
    if (t == _i16.PhoneOtp) {
      return _i16.PhoneOtp.fromJson(data) as T;
    }
    if (t == _i17.Complaint) {
      return _i17.Complaint.fromJson(data) as T;
    }
    if (t == _i18.ComplaintStatus) {
      return _i18.ComplaintStatus.fromJson(data) as T;
    }
    if (t == _i19.Notice) {
      return _i19.Notice.fromJson(data) as T;
    }
    if (t == _i20.Building) {
      return _i20.Building.fromJson(data) as T;
    }
    if (t == _i21.Complex) {
      return _i21.Complex.fromJson(data) as T;
    }
    if (t == _i22.Flat) {
      return _i22.Flat.fromJson(data) as T;
    }
    if (t == _i23.Society) {
      return _i23.Society.fromJson(data) as T;
    }
    if (t == _i24.SocietyInvitation) {
      return _i24.SocietyInvitation.fromJson(data) as T;
    }
    if (t == _i25.SocietyUser) {
      return _i25.SocietyUser.fromJson(data) as T;
    }
    if (t == _i26.UserRole) {
      return _i26.UserRole.fromJson(data) as T;
    }
    if (t == _i27.DocumentCategory) {
      return _i27.DocumentCategory.fromJson(data) as T;
    }
    if (t == _i28.MeetingMinutes) {
      return _i28.MeetingMinutes.fromJson(data) as T;
    }
    if (t == _i29.SocietyDocument) {
      return _i29.SocietyDocument.fromJson(data) as T;
    }
    if (t == _i30.UploadDescriptionResponse) {
      return _i30.UploadDescriptionResponse.fromJson(data) as T;
    }
    if (t == _i31.EmergencyType) {
      return _i31.EmergencyType.fromJson(data) as T;
    }
    if (t == _i32.SosAlert) {
      return _i32.SosAlert.fromJson(data) as T;
    }
    if (t == _i33.SosStatus) {
      return _i33.SosStatus.fromJson(data) as T;
    }
    if (t == _i34.Greeting) {
      return _i34.Greeting.fromJson(data) as T;
    }
    if (t == _i35.BillStatus) {
      return _i35.BillStatus.fromJson(data) as T;
    }
    if (t == _i36.MaintenanceBill) {
      return _i36.MaintenanceBill.fromJson(data) as T;
    }
    if (t == _i37.MaintenanceHead) {
      return _i37.MaintenanceHead.fromJson(data) as T;
    }
    if (t == _i38.PaymentRecord) {
      return _i38.PaymentRecord.fromJson(data) as T;
    }
    if (t == _i39.DeviceToken) {
      return _i39.DeviceToken.fromJson(data) as T;
    }
    if (t == _i40.PushNotificationPayload) {
      return _i40.PushNotificationPayload.fromJson(data) as T;
    }
    if (t == _i41.RazorpayOrderResponse) {
      return _i41.RazorpayOrderResponse.fromJson(data) as T;
    }
    if (t == _i42.PaymentTransaction) {
      return _i42.PaymentTransaction.fromJson(data) as T;
    }
    if (t == _i43.PaymentTransactionStatus) {
      return _i43.PaymentTransactionStatus.fromJson(data) as T;
    }
    if (t == _i44.PaymentVerificationResult) {
      return _i44.PaymentVerificationResult.fromJson(data) as T;
    }
    if (t == _i45.WebhookResult) {
      return _i45.WebhookResult.fromJson(data) as T;
    }
    if (t == _i46.PollOption) {
      return _i46.PollOption.fromJson(data) as T;
    }
    if (t == _i47.PollStatus) {
      return _i47.PollStatus.fromJson(data) as T;
    }
    if (t == _i48.PollVote) {
      return _i48.PollVote.fromJson(data) as T;
    }
    if (t == _i49.SocietyPoll) {
      return _i49.SocietyPoll.fromJson(data) as T;
    }
    if (t == _i50.GateBellEvent) {
      return _i50.GateBellEvent.fromJson(data) as T;
    }
    if (t == _i51.SosAlertEvent) {
      return _i51.SosAlertEvent.fromJson(data) as T;
    }
    if (t == _i52.SaasMetricSummary) {
      return _i52.SaasMetricSummary.fromJson(data) as T;
    }
    if (t == _i53.SocietySubscription) {
      return _i53.SocietySubscription.fromJson(data) as T;
    }
    if (t == _i54.SubscriptionTier) {
      return _i54.SubscriptionTier.fromJson(data) as T;
    }
    if (t == _i55.NocStatus) {
      return _i55.NocStatus.fromJson(data) as T;
    }
    if (t == _i56.TenantNoc) {
      return _i56.TenantNoc.fromJson(data) as T;
    }
    if (t == _i57.VisitorEntry) {
      return _i57.VisitorEntry.fromJson(data) as T;
    }
    if (t == _i58.VisitorStatus) {
      return _i58.VisitorStatus.fromJson(data) as T;
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
    if (t == _i1.getType<_i9.Amenity?>()) {
      return (data != null ? _i9.Amenity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.AmenityBooking?>()) {
      return (data != null ? _i10.AmenityBooking.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.BookingStatus?>()) {
      return (data != null ? _i11.BookingStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.AuditCategory?>()) {
      return (data != null ? _i12.AuditCategory.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.AuditLog?>()) {
      return (data != null ? _i13.AuditLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.AuthResponse?>()) {
      return (data != null ? _i14.AuthResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.OtpSendResult?>()) {
      return (data != null ? _i15.OtpSendResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.PhoneOtp?>()) {
      return (data != null ? _i16.PhoneOtp.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.Complaint?>()) {
      return (data != null ? _i17.Complaint.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.ComplaintStatus?>()) {
      return (data != null ? _i18.ComplaintStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.Notice?>()) {
      return (data != null ? _i19.Notice.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.Building?>()) {
      return (data != null ? _i20.Building.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.Complex?>()) {
      return (data != null ? _i21.Complex.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.Flat?>()) {
      return (data != null ? _i22.Flat.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.Society?>()) {
      return (data != null ? _i23.Society.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.SocietyInvitation?>()) {
      return (data != null ? _i24.SocietyInvitation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.SocietyUser?>()) {
      return (data != null ? _i25.SocietyUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.UserRole?>()) {
      return (data != null ? _i26.UserRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.DocumentCategory?>()) {
      return (data != null ? _i27.DocumentCategory.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.MeetingMinutes?>()) {
      return (data != null ? _i28.MeetingMinutes.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.SocietyDocument?>()) {
      return (data != null ? _i29.SocietyDocument.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.UploadDescriptionResponse?>()) {
      return (data != null
              ? _i30.UploadDescriptionResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i31.EmergencyType?>()) {
      return (data != null ? _i31.EmergencyType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.SosAlert?>()) {
      return (data != null ? _i32.SosAlert.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.SosStatus?>()) {
      return (data != null ? _i33.SosStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.Greeting?>()) {
      return (data != null ? _i34.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.BillStatus?>()) {
      return (data != null ? _i35.BillStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.MaintenanceBill?>()) {
      return (data != null ? _i36.MaintenanceBill.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.MaintenanceHead?>()) {
      return (data != null ? _i37.MaintenanceHead.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.PaymentRecord?>()) {
      return (data != null ? _i38.PaymentRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.DeviceToken?>()) {
      return (data != null ? _i39.DeviceToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.PushNotificationPayload?>()) {
      return (data != null ? _i40.PushNotificationPayload.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i41.RazorpayOrderResponse?>()) {
      return (data != null ? _i41.RazorpayOrderResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i42.PaymentTransaction?>()) {
      return (data != null ? _i42.PaymentTransaction.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i43.PaymentTransactionStatus?>()) {
      return (data != null
              ? _i43.PaymentTransactionStatus.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i44.PaymentVerificationResult?>()) {
      return (data != null
              ? _i44.PaymentVerificationResult.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i45.WebhookResult?>()) {
      return (data != null ? _i45.WebhookResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i46.PollOption?>()) {
      return (data != null ? _i46.PollOption.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i47.PollStatus?>()) {
      return (data != null ? _i47.PollStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i48.PollVote?>()) {
      return (data != null ? _i48.PollVote.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i49.SocietyPoll?>()) {
      return (data != null ? _i49.SocietyPoll.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i50.GateBellEvent?>()) {
      return (data != null ? _i50.GateBellEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i51.SosAlertEvent?>()) {
      return (data != null ? _i51.SosAlertEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i52.SaasMetricSummary?>()) {
      return (data != null ? _i52.SaasMetricSummary.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i53.SocietySubscription?>()) {
      return (data != null ? _i53.SocietySubscription.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i54.SubscriptionTier?>()) {
      return (data != null ? _i54.SubscriptionTier.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i55.NocStatus?>()) {
      return (data != null ? _i55.NocStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i56.TenantNoc?>()) {
      return (data != null ? _i56.TenantNoc.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i57.VisitorEntry?>()) {
      return (data != null ? _i57.VisitorEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i58.VisitorStatus?>()) {
      return (data != null ? _i58.VisitorStatus.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == Map<String, String>) {
      return (data as Map).map(
            (k, v) => MapEntry(deserialize<String>(k), deserialize<String>(v)),
          )
          as T;
    }
    if (t == _i1.getType<Map<String, String>?>()) {
      return (data != null
              ? (data as Map).map(
                  (k, v) =>
                      MapEntry(deserialize<String>(k), deserialize<String>(v)),
                )
              : null)
          as T;
    }
    if (t == List<_i59.VoucherRequest>) {
      return (data as List)
              .map((e) => deserialize<_i59.VoucherRequest>(e))
              .toList()
          as T;
    }
    if (t == List<_i60.LedgerEntry>) {
      return (data as List)
              .map((e) => deserialize<_i60.LedgerEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i61.LedgerAccount>) {
      return (data as List)
              .map((e) => deserialize<_i61.LedgerAccount>(e))
              .toList()
          as T;
    }
    if (t == List<_i62.Amenity>) {
      return (data as List).map((e) => deserialize<_i62.Amenity>(e)).toList()
          as T;
    }
    if (t == List<_i63.AmenityBooking>) {
      return (data as List)
              .map((e) => deserialize<_i63.AmenityBooking>(e))
              .toList()
          as T;
    }
    if (t == List<_i64.AuditLog>) {
      return (data as List).map((e) => deserialize<_i64.AuditLog>(e)).toList()
          as T;
    }
    if (t == List<_i65.Notice>) {
      return (data as List).map((e) => deserialize<_i65.Notice>(e)).toList()
          as T;
    }
    if (t == List<_i66.Complaint>) {
      return (data as List).map((e) => deserialize<_i66.Complaint>(e)).toList()
          as T;
    }
    if (t == List<_i67.Society>) {
      return (data as List).map((e) => deserialize<_i67.Society>(e)).toList()
          as T;
    }
    if (t == List<_i68.Building>) {
      return (data as List).map((e) => deserialize<_i68.Building>(e)).toList()
          as T;
    }
    if (t == List<_i69.Flat>) {
      return (data as List).map((e) => deserialize<_i69.Flat>(e)).toList() as T;
    }
    if (t == List<_i70.SocietyUser>) {
      return (data as List)
              .map((e) => deserialize<_i70.SocietyUser>(e))
              .toList()
          as T;
    }
    if (t == List<_i71.SocietyInvitation>) {
      return (data as List)
              .map((e) => deserialize<_i71.SocietyInvitation>(e))
              .toList()
          as T;
    }
    if (t == List<_i72.SocietyDocument>) {
      return (data as List)
              .map((e) => deserialize<_i72.SocietyDocument>(e))
              .toList()
          as T;
    }
    if (t == List<_i73.MeetingMinutes>) {
      return (data as List)
              .map((e) => deserialize<_i73.MeetingMinutes>(e))
              .toList()
          as T;
    }
    if (t == List<_i74.SosAlert>) {
      return (data as List).map((e) => deserialize<_i74.SosAlert>(e)).toList()
          as T;
    }
    if (t == List<_i75.MaintenanceBill>) {
      return (data as List)
              .map((e) => deserialize<_i75.MaintenanceBill>(e))
              .toList()
          as T;
    }
    if (t == List<_i76.PaymentRecord>) {
      return (data as List)
              .map((e) => deserialize<_i76.PaymentRecord>(e))
              .toList()
          as T;
    }
    if (t == List<_i77.SocietyPoll>) {
      return (data as List)
              .map((e) => deserialize<_i77.SocietyPoll>(e))
              .toList()
          as T;
    }
    if (t == List<_i78.PollOption>) {
      return (data as List).map((e) => deserialize<_i78.PollOption>(e)).toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i79.SocietySubscription>) {
      return (data as List)
              .map((e) => deserialize<_i79.SocietySubscription>(e))
              .toList()
          as T;
    }
    if (t == List<_i80.TenantNoc>) {
      return (data as List).map((e) => deserialize<_i80.TenantNoc>(e)).toList()
          as T;
    }
    if (t == List<_i81.VisitorEntry>) {
      return (data as List)
              .map((e) => deserialize<_i81.VisitorEntry>(e))
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
      _i9.Amenity => 'Amenity',
      _i10.AmenityBooking => 'AmenityBooking',
      _i11.BookingStatus => 'BookingStatus',
      _i12.AuditCategory => 'AuditCategory',
      _i13.AuditLog => 'AuditLog',
      _i14.AuthResponse => 'AuthResponse',
      _i15.OtpSendResult => 'OtpSendResult',
      _i16.PhoneOtp => 'PhoneOtp',
      _i17.Complaint => 'Complaint',
      _i18.ComplaintStatus => 'ComplaintStatus',
      _i19.Notice => 'Notice',
      _i20.Building => 'Building',
      _i21.Complex => 'Complex',
      _i22.Flat => 'Flat',
      _i23.Society => 'Society',
      _i24.SocietyInvitation => 'SocietyInvitation',
      _i25.SocietyUser => 'SocietyUser',
      _i26.UserRole => 'UserRole',
      _i27.DocumentCategory => 'DocumentCategory',
      _i28.MeetingMinutes => 'MeetingMinutes',
      _i29.SocietyDocument => 'SocietyDocument',
      _i30.UploadDescriptionResponse => 'UploadDescriptionResponse',
      _i31.EmergencyType => 'EmergencyType',
      _i32.SosAlert => 'SosAlert',
      _i33.SosStatus => 'SosStatus',
      _i34.Greeting => 'Greeting',
      _i35.BillStatus => 'BillStatus',
      _i36.MaintenanceBill => 'MaintenanceBill',
      _i37.MaintenanceHead => 'MaintenanceHead',
      _i38.PaymentRecord => 'PaymentRecord',
      _i39.DeviceToken => 'DeviceToken',
      _i40.PushNotificationPayload => 'PushNotificationPayload',
      _i41.RazorpayOrderResponse => 'RazorpayOrderResponse',
      _i42.PaymentTransaction => 'PaymentTransaction',
      _i43.PaymentTransactionStatus => 'PaymentTransactionStatus',
      _i44.PaymentVerificationResult => 'PaymentVerificationResult',
      _i45.WebhookResult => 'WebhookResult',
      _i46.PollOption => 'PollOption',
      _i47.PollStatus => 'PollStatus',
      _i48.PollVote => 'PollVote',
      _i49.SocietyPoll => 'SocietyPoll',
      _i50.GateBellEvent => 'GateBellEvent',
      _i51.SosAlertEvent => 'SosAlertEvent',
      _i52.SaasMetricSummary => 'SaasMetricSummary',
      _i53.SocietySubscription => 'SocietySubscription',
      _i54.SubscriptionTier => 'SubscriptionTier',
      _i55.NocStatus => 'NocStatus',
      _i56.TenantNoc => 'TenantNoc',
      _i57.VisitorEntry => 'VisitorEntry',
      _i58.VisitorStatus => 'VisitorStatus',
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
      case _i9.Amenity():
        return 'Amenity';
      case _i10.AmenityBooking():
        return 'AmenityBooking';
      case _i11.BookingStatus():
        return 'BookingStatus';
      case _i12.AuditCategory():
        return 'AuditCategory';
      case _i13.AuditLog():
        return 'AuditLog';
      case _i14.AuthResponse():
        return 'AuthResponse';
      case _i15.OtpSendResult():
        return 'OtpSendResult';
      case _i16.PhoneOtp():
        return 'PhoneOtp';
      case _i17.Complaint():
        return 'Complaint';
      case _i18.ComplaintStatus():
        return 'ComplaintStatus';
      case _i19.Notice():
        return 'Notice';
      case _i20.Building():
        return 'Building';
      case _i21.Complex():
        return 'Complex';
      case _i22.Flat():
        return 'Flat';
      case _i23.Society():
        return 'Society';
      case _i24.SocietyInvitation():
        return 'SocietyInvitation';
      case _i25.SocietyUser():
        return 'SocietyUser';
      case _i26.UserRole():
        return 'UserRole';
      case _i27.DocumentCategory():
        return 'DocumentCategory';
      case _i28.MeetingMinutes():
        return 'MeetingMinutes';
      case _i29.SocietyDocument():
        return 'SocietyDocument';
      case _i30.UploadDescriptionResponse():
        return 'UploadDescriptionResponse';
      case _i31.EmergencyType():
        return 'EmergencyType';
      case _i32.SosAlert():
        return 'SosAlert';
      case _i33.SosStatus():
        return 'SosStatus';
      case _i34.Greeting():
        return 'Greeting';
      case _i35.BillStatus():
        return 'BillStatus';
      case _i36.MaintenanceBill():
        return 'MaintenanceBill';
      case _i37.MaintenanceHead():
        return 'MaintenanceHead';
      case _i38.PaymentRecord():
        return 'PaymentRecord';
      case _i39.DeviceToken():
        return 'DeviceToken';
      case _i40.PushNotificationPayload():
        return 'PushNotificationPayload';
      case _i41.RazorpayOrderResponse():
        return 'RazorpayOrderResponse';
      case _i42.PaymentTransaction():
        return 'PaymentTransaction';
      case _i43.PaymentTransactionStatus():
        return 'PaymentTransactionStatus';
      case _i44.PaymentVerificationResult():
        return 'PaymentVerificationResult';
      case _i45.WebhookResult():
        return 'WebhookResult';
      case _i46.PollOption():
        return 'PollOption';
      case _i47.PollStatus():
        return 'PollStatus';
      case _i48.PollVote():
        return 'PollVote';
      case _i49.SocietyPoll():
        return 'SocietyPoll';
      case _i50.GateBellEvent():
        return 'GateBellEvent';
      case _i51.SosAlertEvent():
        return 'SosAlertEvent';
      case _i52.SaasMetricSummary():
        return 'SaasMetricSummary';
      case _i53.SocietySubscription():
        return 'SocietySubscription';
      case _i54.SubscriptionTier():
        return 'SubscriptionTier';
      case _i55.NocStatus():
        return 'NocStatus';
      case _i56.TenantNoc():
        return 'TenantNoc';
      case _i57.VisitorEntry():
        return 'VisitorEntry';
      case _i58.VisitorStatus():
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
    if (dataClassName == 'Amenity') {
      return deserialize<_i9.Amenity>(data['data']);
    }
    if (dataClassName == 'AmenityBooking') {
      return deserialize<_i10.AmenityBooking>(data['data']);
    }
    if (dataClassName == 'BookingStatus') {
      return deserialize<_i11.BookingStatus>(data['data']);
    }
    if (dataClassName == 'AuditCategory') {
      return deserialize<_i12.AuditCategory>(data['data']);
    }
    if (dataClassName == 'AuditLog') {
      return deserialize<_i13.AuditLog>(data['data']);
    }
    if (dataClassName == 'AuthResponse') {
      return deserialize<_i14.AuthResponse>(data['data']);
    }
    if (dataClassName == 'OtpSendResult') {
      return deserialize<_i15.OtpSendResult>(data['data']);
    }
    if (dataClassName == 'PhoneOtp') {
      return deserialize<_i16.PhoneOtp>(data['data']);
    }
    if (dataClassName == 'Complaint') {
      return deserialize<_i17.Complaint>(data['data']);
    }
    if (dataClassName == 'ComplaintStatus') {
      return deserialize<_i18.ComplaintStatus>(data['data']);
    }
    if (dataClassName == 'Notice') {
      return deserialize<_i19.Notice>(data['data']);
    }
    if (dataClassName == 'Building') {
      return deserialize<_i20.Building>(data['data']);
    }
    if (dataClassName == 'Complex') {
      return deserialize<_i21.Complex>(data['data']);
    }
    if (dataClassName == 'Flat') {
      return deserialize<_i22.Flat>(data['data']);
    }
    if (dataClassName == 'Society') {
      return deserialize<_i23.Society>(data['data']);
    }
    if (dataClassName == 'SocietyInvitation') {
      return deserialize<_i24.SocietyInvitation>(data['data']);
    }
    if (dataClassName == 'SocietyUser') {
      return deserialize<_i25.SocietyUser>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_i26.UserRole>(data['data']);
    }
    if (dataClassName == 'DocumentCategory') {
      return deserialize<_i27.DocumentCategory>(data['data']);
    }
    if (dataClassName == 'MeetingMinutes') {
      return deserialize<_i28.MeetingMinutes>(data['data']);
    }
    if (dataClassName == 'SocietyDocument') {
      return deserialize<_i29.SocietyDocument>(data['data']);
    }
    if (dataClassName == 'UploadDescriptionResponse') {
      return deserialize<_i30.UploadDescriptionResponse>(data['data']);
    }
    if (dataClassName == 'EmergencyType') {
      return deserialize<_i31.EmergencyType>(data['data']);
    }
    if (dataClassName == 'SosAlert') {
      return deserialize<_i32.SosAlert>(data['data']);
    }
    if (dataClassName == 'SosStatus') {
      return deserialize<_i33.SosStatus>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i34.Greeting>(data['data']);
    }
    if (dataClassName == 'BillStatus') {
      return deserialize<_i35.BillStatus>(data['data']);
    }
    if (dataClassName == 'MaintenanceBill') {
      return deserialize<_i36.MaintenanceBill>(data['data']);
    }
    if (dataClassName == 'MaintenanceHead') {
      return deserialize<_i37.MaintenanceHead>(data['data']);
    }
    if (dataClassName == 'PaymentRecord') {
      return deserialize<_i38.PaymentRecord>(data['data']);
    }
    if (dataClassName == 'DeviceToken') {
      return deserialize<_i39.DeviceToken>(data['data']);
    }
    if (dataClassName == 'PushNotificationPayload') {
      return deserialize<_i40.PushNotificationPayload>(data['data']);
    }
    if (dataClassName == 'RazorpayOrderResponse') {
      return deserialize<_i41.RazorpayOrderResponse>(data['data']);
    }
    if (dataClassName == 'PaymentTransaction') {
      return deserialize<_i42.PaymentTransaction>(data['data']);
    }
    if (dataClassName == 'PaymentTransactionStatus') {
      return deserialize<_i43.PaymentTransactionStatus>(data['data']);
    }
    if (dataClassName == 'PaymentVerificationResult') {
      return deserialize<_i44.PaymentVerificationResult>(data['data']);
    }
    if (dataClassName == 'WebhookResult') {
      return deserialize<_i45.WebhookResult>(data['data']);
    }
    if (dataClassName == 'PollOption') {
      return deserialize<_i46.PollOption>(data['data']);
    }
    if (dataClassName == 'PollStatus') {
      return deserialize<_i47.PollStatus>(data['data']);
    }
    if (dataClassName == 'PollVote') {
      return deserialize<_i48.PollVote>(data['data']);
    }
    if (dataClassName == 'SocietyPoll') {
      return deserialize<_i49.SocietyPoll>(data['data']);
    }
    if (dataClassName == 'GateBellEvent') {
      return deserialize<_i50.GateBellEvent>(data['data']);
    }
    if (dataClassName == 'SosAlertEvent') {
      return deserialize<_i51.SosAlertEvent>(data['data']);
    }
    if (dataClassName == 'SaasMetricSummary') {
      return deserialize<_i52.SaasMetricSummary>(data['data']);
    }
    if (dataClassName == 'SocietySubscription') {
      return deserialize<_i53.SocietySubscription>(data['data']);
    }
    if (dataClassName == 'SubscriptionTier') {
      return deserialize<_i54.SubscriptionTier>(data['data']);
    }
    if (dataClassName == 'NocStatus') {
      return deserialize<_i55.NocStatus>(data['data']);
    }
    if (dataClassName == 'TenantNoc') {
      return deserialize<_i56.TenantNoc>(data['data']);
    }
    if (dataClassName == 'VisitorEntry') {
      return deserialize<_i57.VisitorEntry>(data['data']);
    }
    if (dataClassName == 'VisitorStatus') {
      return deserialize<_i58.VisitorStatus>(data['data']);
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
      case _i9.Amenity:
        return _i9.Amenity.t;
      case _i10.AmenityBooking:
        return _i10.AmenityBooking.t;
      case _i13.AuditLog:
        return _i13.AuditLog.t;
      case _i16.PhoneOtp:
        return _i16.PhoneOtp.t;
      case _i17.Complaint:
        return _i17.Complaint.t;
      case _i19.Notice:
        return _i19.Notice.t;
      case _i20.Building:
        return _i20.Building.t;
      case _i21.Complex:
        return _i21.Complex.t;
      case _i22.Flat:
        return _i22.Flat.t;
      case _i23.Society:
        return _i23.Society.t;
      case _i24.SocietyInvitation:
        return _i24.SocietyInvitation.t;
      case _i25.SocietyUser:
        return _i25.SocietyUser.t;
      case _i28.MeetingMinutes:
        return _i28.MeetingMinutes.t;
      case _i29.SocietyDocument:
        return _i29.SocietyDocument.t;
      case _i32.SosAlert:
        return _i32.SosAlert.t;
      case _i36.MaintenanceBill:
        return _i36.MaintenanceBill.t;
      case _i37.MaintenanceHead:
        return _i37.MaintenanceHead.t;
      case _i38.PaymentRecord:
        return _i38.PaymentRecord.t;
      case _i39.DeviceToken:
        return _i39.DeviceToken.t;
      case _i42.PaymentTransaction:
        return _i42.PaymentTransaction.t;
      case _i46.PollOption:
        return _i46.PollOption.t;
      case _i48.PollVote:
        return _i48.PollVote.t;
      case _i49.SocietyPoll:
        return _i49.SocietyPoll.t;
      case _i53.SocietySubscription:
        return _i53.SocietySubscription.t;
      case _i56.TenantNoc:
        return _i56.TenantNoc.t;
      case _i57.VisitorEntry:
        return _i57.VisitorEntry.t;
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
