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
import 'core/models/society_invitation.dart' as _i13;
import 'core/models/society_user.dart' as _i14;
import 'core/models/user_role.dart' as _i15;
import 'documents/models/document_category.dart' as _i16;
import 'documents/models/meeting_minutes.dart' as _i17;
import 'documents/models/society_document.dart' as _i18;
import 'emergency/models/emergency_type.dart' as _i19;
import 'emergency/models/sos_alert.dart' as _i20;
import 'emergency/models/sos_status.dart' as _i21;
import 'greetings/greeting.dart' as _i22;
import 'maintenance/models/bill_status.dart' as _i23;
import 'maintenance/models/maintenance_bill.dart' as _i24;
import 'maintenance/models/maintenance_head.dart' as _i25;
import 'maintenance/models/payment_record.dart' as _i26;
import 'polling/models/poll_option.dart' as _i27;
import 'polling/models/poll_status.dart' as _i28;
import 'polling/models/poll_vote.dart' as _i29;
import 'polling/models/society_poll.dart' as _i30;
import 'saas_admin/models/saas_metric_summary.dart' as _i31;
import 'saas_admin/models/society_subscription.dart' as _i32;
import 'saas_admin/models/subscription_tier.dart' as _i33;
import 'visitor/models/visitor_entry.dart' as _i34;
import 'visitor/models/visitor_status.dart' as _i35;
import 'package:society_client/src/protocol/accounting/models/voucher_request.dart'
    as _i36;
import 'package:society_client/src/protocol/accounting/models/ledger_entry.dart'
    as _i37;
import 'package:society_client/src/protocol/accounting/models/ledger_account.dart'
    as _i38;
import 'package:society_client/src/protocol/communication/models/notice.dart'
    as _i39;
import 'package:society_client/src/protocol/communication/models/complaint.dart'
    as _i40;
import 'package:society_client/src/protocol/core/models/society.dart' as _i41;
import 'package:society_client/src/protocol/core/models/building.dart' as _i42;
import 'package:society_client/src/protocol/core/models/flat.dart' as _i43;
import 'package:society_client/src/protocol/core/models/society_user.dart'
    as _i44;
import 'package:society_client/src/protocol/core/models/society_invitation.dart'
    as _i45;
import 'package:society_client/src/protocol/documents/models/society_document.dart'
    as _i46;
import 'package:society_client/src/protocol/documents/models/meeting_minutes.dart'
    as _i47;
import 'package:society_client/src/protocol/emergency/models/sos_alert.dart'
    as _i48;
import 'package:society_client/src/protocol/maintenance/models/maintenance_bill.dart'
    as _i49;
import 'package:society_client/src/protocol/maintenance/models/payment_record.dart'
    as _i50;
import 'package:society_client/src/protocol/polling/models/society_poll.dart'
    as _i51;
import 'package:society_client/src/protocol/polling/models/poll_option.dart'
    as _i52;
import 'package:society_client/src/protocol/saas_admin/models/society_subscription.dart'
    as _i53;
import 'package:society_client/src/protocol/visitor/models/visitor_entry.dart'
    as _i54;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i55;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i56;
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
    if (t == _i13.SocietyInvitation) {
      return _i13.SocietyInvitation.fromJson(data) as T;
    }
    if (t == _i14.SocietyUser) {
      return _i14.SocietyUser.fromJson(data) as T;
    }
    if (t == _i15.UserRole) {
      return _i15.UserRole.fromJson(data) as T;
    }
    if (t == _i16.DocumentCategory) {
      return _i16.DocumentCategory.fromJson(data) as T;
    }
    if (t == _i17.MeetingMinutes) {
      return _i17.MeetingMinutes.fromJson(data) as T;
    }
    if (t == _i18.SocietyDocument) {
      return _i18.SocietyDocument.fromJson(data) as T;
    }
    if (t == _i19.EmergencyType) {
      return _i19.EmergencyType.fromJson(data) as T;
    }
    if (t == _i20.SosAlert) {
      return _i20.SosAlert.fromJson(data) as T;
    }
    if (t == _i21.SosStatus) {
      return _i21.SosStatus.fromJson(data) as T;
    }
    if (t == _i22.Greeting) {
      return _i22.Greeting.fromJson(data) as T;
    }
    if (t == _i23.BillStatus) {
      return _i23.BillStatus.fromJson(data) as T;
    }
    if (t == _i24.MaintenanceBill) {
      return _i24.MaintenanceBill.fromJson(data) as T;
    }
    if (t == _i25.MaintenanceHead) {
      return _i25.MaintenanceHead.fromJson(data) as T;
    }
    if (t == _i26.PaymentRecord) {
      return _i26.PaymentRecord.fromJson(data) as T;
    }
    if (t == _i27.PollOption) {
      return _i27.PollOption.fromJson(data) as T;
    }
    if (t == _i28.PollStatus) {
      return _i28.PollStatus.fromJson(data) as T;
    }
    if (t == _i29.PollVote) {
      return _i29.PollVote.fromJson(data) as T;
    }
    if (t == _i30.SocietyPoll) {
      return _i30.SocietyPoll.fromJson(data) as T;
    }
    if (t == _i31.SaasMetricSummary) {
      return _i31.SaasMetricSummary.fromJson(data) as T;
    }
    if (t == _i32.SocietySubscription) {
      return _i32.SocietySubscription.fromJson(data) as T;
    }
    if (t == _i33.SubscriptionTier) {
      return _i33.SubscriptionTier.fromJson(data) as T;
    }
    if (t == _i34.VisitorEntry) {
      return _i34.VisitorEntry.fromJson(data) as T;
    }
    if (t == _i35.VisitorStatus) {
      return _i35.VisitorStatus.fromJson(data) as T;
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
    if (t == _i1.getType<_i13.SocietyInvitation?>()) {
      return (data != null ? _i13.SocietyInvitation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.SocietyUser?>()) {
      return (data != null ? _i14.SocietyUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.UserRole?>()) {
      return (data != null ? _i15.UserRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.DocumentCategory?>()) {
      return (data != null ? _i16.DocumentCategory.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.MeetingMinutes?>()) {
      return (data != null ? _i17.MeetingMinutes.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.SocietyDocument?>()) {
      return (data != null ? _i18.SocietyDocument.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.EmergencyType?>()) {
      return (data != null ? _i19.EmergencyType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.SosAlert?>()) {
      return (data != null ? _i20.SosAlert.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.SosStatus?>()) {
      return (data != null ? _i21.SosStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.Greeting?>()) {
      return (data != null ? _i22.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.BillStatus?>()) {
      return (data != null ? _i23.BillStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.MaintenanceBill?>()) {
      return (data != null ? _i24.MaintenanceBill.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.MaintenanceHead?>()) {
      return (data != null ? _i25.MaintenanceHead.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.PaymentRecord?>()) {
      return (data != null ? _i26.PaymentRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.PollOption?>()) {
      return (data != null ? _i27.PollOption.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.PollStatus?>()) {
      return (data != null ? _i28.PollStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.PollVote?>()) {
      return (data != null ? _i29.PollVote.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.SocietyPoll?>()) {
      return (data != null ? _i30.SocietyPoll.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.SaasMetricSummary?>()) {
      return (data != null ? _i31.SaasMetricSummary.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.SocietySubscription?>()) {
      return (data != null ? _i32.SocietySubscription.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i33.SubscriptionTier?>()) {
      return (data != null ? _i33.SubscriptionTier.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.VisitorEntry?>()) {
      return (data != null ? _i34.VisitorEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.VisitorStatus?>()) {
      return (data != null ? _i35.VisitorStatus.fromJson(data) : null) as T;
    }
    if (t == List<_i36.VoucherRequest>) {
      return (data as List)
              .map((e) => deserialize<_i36.VoucherRequest>(e))
              .toList()
          as T;
    }
    if (t == List<_i37.LedgerEntry>) {
      return (data as List)
              .map((e) => deserialize<_i37.LedgerEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i38.LedgerAccount>) {
      return (data as List)
              .map((e) => deserialize<_i38.LedgerAccount>(e))
              .toList()
          as T;
    }
    if (t == List<_i39.Notice>) {
      return (data as List).map((e) => deserialize<_i39.Notice>(e)).toList()
          as T;
    }
    if (t == List<_i40.Complaint>) {
      return (data as List).map((e) => deserialize<_i40.Complaint>(e)).toList()
          as T;
    }
    if (t == List<_i41.Society>) {
      return (data as List).map((e) => deserialize<_i41.Society>(e)).toList()
          as T;
    }
    if (t == List<_i42.Building>) {
      return (data as List).map((e) => deserialize<_i42.Building>(e)).toList()
          as T;
    }
    if (t == List<_i43.Flat>) {
      return (data as List).map((e) => deserialize<_i43.Flat>(e)).toList() as T;
    }
    if (t == List<_i44.SocietyUser>) {
      return (data as List)
              .map((e) => deserialize<_i44.SocietyUser>(e))
              .toList()
          as T;
    }
    if (t == List<_i45.SocietyInvitation>) {
      return (data as List)
              .map((e) => deserialize<_i45.SocietyInvitation>(e))
              .toList()
          as T;
    }
    if (t == List<_i46.SocietyDocument>) {
      return (data as List)
              .map((e) => deserialize<_i46.SocietyDocument>(e))
              .toList()
          as T;
    }
    if (t == List<_i47.MeetingMinutes>) {
      return (data as List)
              .map((e) => deserialize<_i47.MeetingMinutes>(e))
              .toList()
          as T;
    }
    if (t == List<_i48.SosAlert>) {
      return (data as List).map((e) => deserialize<_i48.SosAlert>(e)).toList()
          as T;
    }
    if (t == List<_i49.MaintenanceBill>) {
      return (data as List)
              .map((e) => deserialize<_i49.MaintenanceBill>(e))
              .toList()
          as T;
    }
    if (t == List<_i50.PaymentRecord>) {
      return (data as List)
              .map((e) => deserialize<_i50.PaymentRecord>(e))
              .toList()
          as T;
    }
    if (t == List<_i51.SocietyPoll>) {
      return (data as List)
              .map((e) => deserialize<_i51.SocietyPoll>(e))
              .toList()
          as T;
    }
    if (t == List<_i52.PollOption>) {
      return (data as List).map((e) => deserialize<_i52.PollOption>(e)).toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i53.SocietySubscription>) {
      return (data as List)
              .map((e) => deserialize<_i53.SocietySubscription>(e))
              .toList()
          as T;
    }
    if (t == List<_i54.VisitorEntry>) {
      return (data as List)
              .map((e) => deserialize<_i54.VisitorEntry>(e))
              .toList()
          as T;
    }
    try {
      return _i55.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i56.Protocol().deserialize<T>(data, t);
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
      _i13.SocietyInvitation => 'SocietyInvitation',
      _i14.SocietyUser => 'SocietyUser',
      _i15.UserRole => 'UserRole',
      _i16.DocumentCategory => 'DocumentCategory',
      _i17.MeetingMinutes => 'MeetingMinutes',
      _i18.SocietyDocument => 'SocietyDocument',
      _i19.EmergencyType => 'EmergencyType',
      _i20.SosAlert => 'SosAlert',
      _i21.SosStatus => 'SosStatus',
      _i22.Greeting => 'Greeting',
      _i23.BillStatus => 'BillStatus',
      _i24.MaintenanceBill => 'MaintenanceBill',
      _i25.MaintenanceHead => 'MaintenanceHead',
      _i26.PaymentRecord => 'PaymentRecord',
      _i27.PollOption => 'PollOption',
      _i28.PollStatus => 'PollStatus',
      _i29.PollVote => 'PollVote',
      _i30.SocietyPoll => 'SocietyPoll',
      _i31.SaasMetricSummary => 'SaasMetricSummary',
      _i32.SocietySubscription => 'SocietySubscription',
      _i33.SubscriptionTier => 'SubscriptionTier',
      _i34.VisitorEntry => 'VisitorEntry',
      _i35.VisitorStatus => 'VisitorStatus',
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
      case _i13.SocietyInvitation():
        return 'SocietyInvitation';
      case _i14.SocietyUser():
        return 'SocietyUser';
      case _i15.UserRole():
        return 'UserRole';
      case _i16.DocumentCategory():
        return 'DocumentCategory';
      case _i17.MeetingMinutes():
        return 'MeetingMinutes';
      case _i18.SocietyDocument():
        return 'SocietyDocument';
      case _i19.EmergencyType():
        return 'EmergencyType';
      case _i20.SosAlert():
        return 'SosAlert';
      case _i21.SosStatus():
        return 'SosStatus';
      case _i22.Greeting():
        return 'Greeting';
      case _i23.BillStatus():
        return 'BillStatus';
      case _i24.MaintenanceBill():
        return 'MaintenanceBill';
      case _i25.MaintenanceHead():
        return 'MaintenanceHead';
      case _i26.PaymentRecord():
        return 'PaymentRecord';
      case _i27.PollOption():
        return 'PollOption';
      case _i28.PollStatus():
        return 'PollStatus';
      case _i29.PollVote():
        return 'PollVote';
      case _i30.SocietyPoll():
        return 'SocietyPoll';
      case _i31.SaasMetricSummary():
        return 'SaasMetricSummary';
      case _i32.SocietySubscription():
        return 'SocietySubscription';
      case _i33.SubscriptionTier():
        return 'SubscriptionTier';
      case _i34.VisitorEntry():
        return 'VisitorEntry';
      case _i35.VisitorStatus():
        return 'VisitorStatus';
    }
    className = _i55.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i56.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'SocietyInvitation') {
      return deserialize<_i13.SocietyInvitation>(data['data']);
    }
    if (dataClassName == 'SocietyUser') {
      return deserialize<_i14.SocietyUser>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_i15.UserRole>(data['data']);
    }
    if (dataClassName == 'DocumentCategory') {
      return deserialize<_i16.DocumentCategory>(data['data']);
    }
    if (dataClassName == 'MeetingMinutes') {
      return deserialize<_i17.MeetingMinutes>(data['data']);
    }
    if (dataClassName == 'SocietyDocument') {
      return deserialize<_i18.SocietyDocument>(data['data']);
    }
    if (dataClassName == 'EmergencyType') {
      return deserialize<_i19.EmergencyType>(data['data']);
    }
    if (dataClassName == 'SosAlert') {
      return deserialize<_i20.SosAlert>(data['data']);
    }
    if (dataClassName == 'SosStatus') {
      return deserialize<_i21.SosStatus>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i22.Greeting>(data['data']);
    }
    if (dataClassName == 'BillStatus') {
      return deserialize<_i23.BillStatus>(data['data']);
    }
    if (dataClassName == 'MaintenanceBill') {
      return deserialize<_i24.MaintenanceBill>(data['data']);
    }
    if (dataClassName == 'MaintenanceHead') {
      return deserialize<_i25.MaintenanceHead>(data['data']);
    }
    if (dataClassName == 'PaymentRecord') {
      return deserialize<_i26.PaymentRecord>(data['data']);
    }
    if (dataClassName == 'PollOption') {
      return deserialize<_i27.PollOption>(data['data']);
    }
    if (dataClassName == 'PollStatus') {
      return deserialize<_i28.PollStatus>(data['data']);
    }
    if (dataClassName == 'PollVote') {
      return deserialize<_i29.PollVote>(data['data']);
    }
    if (dataClassName == 'SocietyPoll') {
      return deserialize<_i30.SocietyPoll>(data['data']);
    }
    if (dataClassName == 'SaasMetricSummary') {
      return deserialize<_i31.SaasMetricSummary>(data['data']);
    }
    if (dataClassName == 'SocietySubscription') {
      return deserialize<_i32.SocietySubscription>(data['data']);
    }
    if (dataClassName == 'SubscriptionTier') {
      return deserialize<_i33.SubscriptionTier>(data['data']);
    }
    if (dataClassName == 'VisitorEntry') {
      return deserialize<_i34.VisitorEntry>(data['data']);
    }
    if (dataClassName == 'VisitorStatus') {
      return deserialize<_i35.VisitorStatus>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i55.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i56.Protocol().deserializeByClassName(data);
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
      return _i55.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i56.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
