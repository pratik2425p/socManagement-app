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
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'accounting/models/ledger_account.dart' as _i2;
import 'accounting/models/ledger_entry.dart' as _i3;
import 'accounting/models/voucher_request.dart' as _i4;
import 'accounting/models/voucher_status.dart' as _i5;
import 'communication/models/complaint.dart' as _i6;
import 'communication/models/complaint_status.dart' as _i7;
import 'communication/models/notice.dart' as _i8;
import 'core/models/building.dart' as _i9;
import 'core/models/complex.dart' as _i10;
import 'core/models/flat.dart' as _i11;
import 'core/models/society.dart' as _i12;
import 'core/models/society_user.dart' as _i13;
import 'core/models/user_role.dart' as _i14;
import 'greetings/greeting.dart' as _i15;
import 'maintenance/models/bill_status.dart' as _i16;
import 'maintenance/models/maintenance_bill.dart' as _i17;
import 'maintenance/models/maintenance_head.dart' as _i18;
import 'maintenance/models/payment_record.dart' as _i19;
import 'visitor/models/visitor_entry.dart' as _i20;
import 'visitor/models/visitor_status.dart' as _i21;
import 'package:society_client/src/protocol/accounting/models/voucher_request.dart'
    as _i22;
import 'package:society_client/src/protocol/accounting/models/ledger_entry.dart'
    as _i23;
import 'package:society_client/src/protocol/accounting/models/ledger_account.dart'
    as _i24;
import 'package:society_client/src/protocol/communication/models/notice.dart'
    as _i25;
import 'package:society_client/src/protocol/communication/models/complaint.dart'
    as _i26;
import 'package:society_client/src/protocol/core/models/society.dart' as _i27;
import 'package:society_client/src/protocol/core/models/flat.dart' as _i28;
import 'package:society_client/src/protocol/core/models/society_user.dart'
    as _i29;
import 'package:society_client/src/protocol/maintenance/models/maintenance_bill.dart'
    as _i30;
import 'package:society_client/src/protocol/maintenance/models/payment_record.dart'
    as _i31;
import 'package:society_client/src/protocol/visitor/models/visitor_entry.dart'
    as _i32;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i33;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i34;
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
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

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

    if (t == _i2.LedgerAccount) {
      return _i2.LedgerAccount.fromJson(data) as T;
    }
    if (t == _i3.LedgerEntry) {
      return _i3.LedgerEntry.fromJson(data) as T;
    }
    if (t == _i4.VoucherRequest) {
      return _i4.VoucherRequest.fromJson(data) as T;
    }
    if (t == _i5.VoucherStatus) {
      return _i5.VoucherStatus.fromJson(data) as T;
    }
    if (t == _i6.Complaint) {
      return _i6.Complaint.fromJson(data) as T;
    }
    if (t == _i7.ComplaintStatus) {
      return _i7.ComplaintStatus.fromJson(data) as T;
    }
    if (t == _i8.Notice) {
      return _i8.Notice.fromJson(data) as T;
    }
    if (t == _i9.Building) {
      return _i9.Building.fromJson(data) as T;
    }
    if (t == _i10.Complex) {
      return _i10.Complex.fromJson(data) as T;
    }
    if (t == _i11.Flat) {
      return _i11.Flat.fromJson(data) as T;
    }
    if (t == _i12.Society) {
      return _i12.Society.fromJson(data) as T;
    }
    if (t == _i13.SocietyUser) {
      return _i13.SocietyUser.fromJson(data) as T;
    }
    if (t == _i14.UserRole) {
      return _i14.UserRole.fromJson(data) as T;
    }
    if (t == _i15.Greeting) {
      return _i15.Greeting.fromJson(data) as T;
    }
    if (t == _i16.BillStatus) {
      return _i16.BillStatus.fromJson(data) as T;
    }
    if (t == _i17.MaintenanceBill) {
      return _i17.MaintenanceBill.fromJson(data) as T;
    }
    if (t == _i18.MaintenanceHead) {
      return _i18.MaintenanceHead.fromJson(data) as T;
    }
    if (t == _i19.PaymentRecord) {
      return _i19.PaymentRecord.fromJson(data) as T;
    }
    if (t == _i20.VisitorEntry) {
      return _i20.VisitorEntry.fromJson(data) as T;
    }
    if (t == _i21.VisitorStatus) {
      return _i21.VisitorStatus.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.LedgerAccount?>()) {
      return (data != null ? _i2.LedgerAccount.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.LedgerEntry?>()) {
      return (data != null ? _i3.LedgerEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.VoucherRequest?>()) {
      return (data != null ? _i4.VoucherRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.VoucherStatus?>()) {
      return (data != null ? _i5.VoucherStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Complaint?>()) {
      return (data != null ? _i6.Complaint.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.ComplaintStatus?>()) {
      return (data != null ? _i7.ComplaintStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Notice?>()) {
      return (data != null ? _i8.Notice.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Building?>()) {
      return (data != null ? _i9.Building.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Complex?>()) {
      return (data != null ? _i10.Complex.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Flat?>()) {
      return (data != null ? _i11.Flat.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Society?>()) {
      return (data != null ? _i12.Society.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.SocietyUser?>()) {
      return (data != null ? _i13.SocietyUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.UserRole?>()) {
      return (data != null ? _i14.UserRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Greeting?>()) {
      return (data != null ? _i15.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.BillStatus?>()) {
      return (data != null ? _i16.BillStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.MaintenanceBill?>()) {
      return (data != null ? _i17.MaintenanceBill.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.MaintenanceHead?>()) {
      return (data != null ? _i18.MaintenanceHead.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.PaymentRecord?>()) {
      return (data != null ? _i19.PaymentRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.VisitorEntry?>()) {
      return (data != null ? _i20.VisitorEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.VisitorStatus?>()) {
      return (data != null ? _i21.VisitorStatus.fromJson(data) : null) as T;
    }
    if (t == List<_i22.VoucherRequest>) {
      return (data as List)
              .map((e) => deserialize<_i22.VoucherRequest>(e))
              .toList()
          as T;
    }
    if (t == List<_i23.LedgerEntry>) {
      return (data as List)
              .map((e) => deserialize<_i23.LedgerEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i24.LedgerAccount>) {
      return (data as List)
              .map((e) => deserialize<_i24.LedgerAccount>(e))
              .toList()
          as T;
    }
    if (t == List<_i25.Notice>) {
      return (data as List).map((e) => deserialize<_i25.Notice>(e)).toList()
          as T;
    }
    if (t == List<_i26.Complaint>) {
      return (data as List).map((e) => deserialize<_i26.Complaint>(e)).toList()
          as T;
    }
    if (t == List<_i27.Society>) {
      return (data as List).map((e) => deserialize<_i27.Society>(e)).toList()
          as T;
    }
    if (t == List<_i28.Flat>) {
      return (data as List).map((e) => deserialize<_i28.Flat>(e)).toList() as T;
    }
    if (t == List<_i29.SocietyUser>) {
      return (data as List)
              .map((e) => deserialize<_i29.SocietyUser>(e))
              .toList()
          as T;
    }
    if (t == List<_i30.MaintenanceBill>) {
      return (data as List)
              .map((e) => deserialize<_i30.MaintenanceBill>(e))
              .toList()
          as T;
    }
    if (t == List<_i31.PaymentRecord>) {
      return (data as List)
              .map((e) => deserialize<_i31.PaymentRecord>(e))
              .toList()
          as T;
    }
    if (t == List<_i32.VisitorEntry>) {
      return (data as List)
              .map((e) => deserialize<_i32.VisitorEntry>(e))
              .toList()
          as T;
    }
    try {
      return _i33.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i34.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.LedgerAccount => 'LedgerAccount',
      _i3.LedgerEntry => 'LedgerEntry',
      _i4.VoucherRequest => 'VoucherRequest',
      _i5.VoucherStatus => 'VoucherStatus',
      _i6.Complaint => 'Complaint',
      _i7.ComplaintStatus => 'ComplaintStatus',
      _i8.Notice => 'Notice',
      _i9.Building => 'Building',
      _i10.Complex => 'Complex',
      _i11.Flat => 'Flat',
      _i12.Society => 'Society',
      _i13.SocietyUser => 'SocietyUser',
      _i14.UserRole => 'UserRole',
      _i15.Greeting => 'Greeting',
      _i16.BillStatus => 'BillStatus',
      _i17.MaintenanceBill => 'MaintenanceBill',
      _i18.MaintenanceHead => 'MaintenanceHead',
      _i19.PaymentRecord => 'PaymentRecord',
      _i20.VisitorEntry => 'VisitorEntry',
      _i21.VisitorStatus => 'VisitorStatus',
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
      case _i2.LedgerAccount():
        return 'LedgerAccount';
      case _i3.LedgerEntry():
        return 'LedgerEntry';
      case _i4.VoucherRequest():
        return 'VoucherRequest';
      case _i5.VoucherStatus():
        return 'VoucherStatus';
      case _i6.Complaint():
        return 'Complaint';
      case _i7.ComplaintStatus():
        return 'ComplaintStatus';
      case _i8.Notice():
        return 'Notice';
      case _i9.Building():
        return 'Building';
      case _i10.Complex():
        return 'Complex';
      case _i11.Flat():
        return 'Flat';
      case _i12.Society():
        return 'Society';
      case _i13.SocietyUser():
        return 'SocietyUser';
      case _i14.UserRole():
        return 'UserRole';
      case _i15.Greeting():
        return 'Greeting';
      case _i16.BillStatus():
        return 'BillStatus';
      case _i17.MaintenanceBill():
        return 'MaintenanceBill';
      case _i18.MaintenanceHead():
        return 'MaintenanceHead';
      case _i19.PaymentRecord():
        return 'PaymentRecord';
      case _i20.VisitorEntry():
        return 'VisitorEntry';
      case _i21.VisitorStatus():
        return 'VisitorStatus';
    }
    className = _i33.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i34.Protocol().getClassNameForObject(data);
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
      return deserialize<_i2.LedgerAccount>(data['data']);
    }
    if (dataClassName == 'LedgerEntry') {
      return deserialize<_i3.LedgerEntry>(data['data']);
    }
    if (dataClassName == 'VoucherRequest') {
      return deserialize<_i4.VoucherRequest>(data['data']);
    }
    if (dataClassName == 'VoucherStatus') {
      return deserialize<_i5.VoucherStatus>(data['data']);
    }
    if (dataClassName == 'Complaint') {
      return deserialize<_i6.Complaint>(data['data']);
    }
    if (dataClassName == 'ComplaintStatus') {
      return deserialize<_i7.ComplaintStatus>(data['data']);
    }
    if (dataClassName == 'Notice') {
      return deserialize<_i8.Notice>(data['data']);
    }
    if (dataClassName == 'Building') {
      return deserialize<_i9.Building>(data['data']);
    }
    if (dataClassName == 'Complex') {
      return deserialize<_i10.Complex>(data['data']);
    }
    if (dataClassName == 'Flat') {
      return deserialize<_i11.Flat>(data['data']);
    }
    if (dataClassName == 'Society') {
      return deserialize<_i12.Society>(data['data']);
    }
    if (dataClassName == 'SocietyUser') {
      return deserialize<_i13.SocietyUser>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_i14.UserRole>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i15.Greeting>(data['data']);
    }
    if (dataClassName == 'BillStatus') {
      return deserialize<_i16.BillStatus>(data['data']);
    }
    if (dataClassName == 'MaintenanceBill') {
      return deserialize<_i17.MaintenanceBill>(data['data']);
    }
    if (dataClassName == 'MaintenanceHead') {
      return deserialize<_i18.MaintenanceHead>(data['data']);
    }
    if (dataClassName == 'PaymentRecord') {
      return deserialize<_i19.PaymentRecord>(data['data']);
    }
    if (dataClassName == 'VisitorEntry') {
      return deserialize<_i20.VisitorEntry>(data['data']);
    }
    if (dataClassName == 'VisitorStatus') {
      return deserialize<_i21.VisitorStatus>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i33.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i34.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

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
      return _i33.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i34.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
