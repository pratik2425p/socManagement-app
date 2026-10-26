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
import 'amenity/models/amenity.dart' as _i6;
import 'amenity/models/amenity_booking.dart' as _i7;
import 'amenity/models/booking_status.dart' as _i8;
import 'audit/models/audit_category.dart' as _i9;
import 'audit/models/audit_log.dart' as _i10;
import 'auth/models/auth_response.dart' as _i11;
import 'auth/models/otp_send_result.dart' as _i12;
import 'auth/models/phone_otp.dart' as _i13;
import 'communication/models/complaint.dart' as _i14;
import 'communication/models/complaint_status.dart' as _i15;
import 'communication/models/notice.dart' as _i16;
import 'core/models/building.dart' as _i17;
import 'core/models/complex.dart' as _i18;
import 'core/models/flat.dart' as _i19;
import 'core/models/society.dart' as _i20;
import 'core/models/society_invitation.dart' as _i21;
import 'core/models/society_user.dart' as _i22;
import 'core/models/user_role.dart' as _i23;
import 'documents/models/document_category.dart' as _i24;
import 'documents/models/meeting_minutes.dart' as _i25;
import 'documents/models/society_document.dart' as _i26;
import 'documents/models/upload_description_response.dart' as _i27;
import 'emergency/models/emergency_type.dart' as _i28;
import 'emergency/models/sos_alert.dart' as _i29;
import 'emergency/models/sos_status.dart' as _i30;
import 'greetings/greeting.dart' as _i31;
import 'maintenance/models/bill_status.dart' as _i32;
import 'maintenance/models/maintenance_bill.dart' as _i33;
import 'maintenance/models/maintenance_head.dart' as _i34;
import 'maintenance/models/payment_record.dart' as _i35;
import 'notifications/models/device_token.dart' as _i36;
import 'notifications/models/push_notification_payload.dart' as _i37;
import 'payment/models/payment_order.dart' as _i38;
import 'payment/models/payment_transaction.dart' as _i39;
import 'payment/models/payment_transaction_status.dart' as _i40;
import 'payment/models/payment_verification_result.dart' as _i41;
import 'payment/models/webhook_result.dart' as _i42;
import 'polling/models/poll_option.dart' as _i43;
import 'polling/models/poll_status.dart' as _i44;
import 'polling/models/poll_vote.dart' as _i45;
import 'polling/models/society_poll.dart' as _i46;
import 'realtime/models/gate_bell_event.dart' as _i47;
import 'realtime/models/sos_alert_event.dart' as _i48;
import 'saas_admin/models/saas_metric_summary.dart' as _i49;
import 'saas_admin/models/society_subscription.dart' as _i50;
import 'saas_admin/models/subscription_tier.dart' as _i51;
import 'tenancy/models/noc_status.dart' as _i52;
import 'tenancy/models/tenant_noc.dart' as _i53;
import 'visitor/models/visitor_entry.dart' as _i54;
import 'visitor/models/visitor_status.dart' as _i55;
import 'package:society_client/src/protocol/accounting/models/voucher_request.dart'
    as _i56;
import 'package:society_client/src/protocol/accounting/models/ledger_entry.dart'
    as _i57;
import 'package:society_client/src/protocol/accounting/models/ledger_account.dart'
    as _i58;
import 'package:society_client/src/protocol/amenity/models/amenity.dart'
    as _i59;
import 'package:society_client/src/protocol/amenity/models/amenity_booking.dart'
    as _i60;
import 'package:society_client/src/protocol/audit/models/audit_log.dart'
    as _i61;
import 'package:society_client/src/protocol/communication/models/notice.dart'
    as _i62;
import 'package:society_client/src/protocol/communication/models/complaint.dart'
    as _i63;
import 'package:society_client/src/protocol/core/models/society.dart' as _i64;
import 'package:society_client/src/protocol/core/models/building.dart' as _i65;
import 'package:society_client/src/protocol/core/models/flat.dart' as _i66;
import 'package:society_client/src/protocol/core/models/society_user.dart'
    as _i67;
import 'package:society_client/src/protocol/core/models/society_invitation.dart'
    as _i68;
import 'package:society_client/src/protocol/documents/models/society_document.dart'
    as _i69;
import 'package:society_client/src/protocol/documents/models/meeting_minutes.dart'
    as _i70;
import 'package:society_client/src/protocol/emergency/models/sos_alert.dart'
    as _i71;
import 'package:society_client/src/protocol/maintenance/models/maintenance_bill.dart'
    as _i72;
import 'package:society_client/src/protocol/maintenance/models/payment_record.dart'
    as _i73;
import 'package:society_client/src/protocol/polling/models/society_poll.dart'
    as _i74;
import 'package:society_client/src/protocol/polling/models/poll_option.dart'
    as _i75;
import 'package:society_client/src/protocol/saas_admin/models/society_subscription.dart'
    as _i76;
import 'package:society_client/src/protocol/tenancy/models/tenant_noc.dart'
    as _i77;
import 'package:society_client/src/protocol/visitor/models/visitor_entry.dart'
    as _i78;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i79;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i80;
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
    if (t == _i6.Amenity) {
      return _i6.Amenity.fromJson(data) as T;
    }
    if (t == _i7.AmenityBooking) {
      return _i7.AmenityBooking.fromJson(data) as T;
    }
    if (t == _i8.BookingStatus) {
      return _i8.BookingStatus.fromJson(data) as T;
    }
    if (t == _i9.AuditCategory) {
      return _i9.AuditCategory.fromJson(data) as T;
    }
    if (t == _i10.AuditLog) {
      return _i10.AuditLog.fromJson(data) as T;
    }
    if (t == _i11.AuthResponse) {
      return _i11.AuthResponse.fromJson(data) as T;
    }
    if (t == _i12.OtpSendResult) {
      return _i12.OtpSendResult.fromJson(data) as T;
    }
    if (t == _i13.PhoneOtp) {
      return _i13.PhoneOtp.fromJson(data) as T;
    }
    if (t == _i14.Complaint) {
      return _i14.Complaint.fromJson(data) as T;
    }
    if (t == _i15.ComplaintStatus) {
      return _i15.ComplaintStatus.fromJson(data) as T;
    }
    if (t == _i16.Notice) {
      return _i16.Notice.fromJson(data) as T;
    }
    if (t == _i17.Building) {
      return _i17.Building.fromJson(data) as T;
    }
    if (t == _i18.Complex) {
      return _i18.Complex.fromJson(data) as T;
    }
    if (t == _i19.Flat) {
      return _i19.Flat.fromJson(data) as T;
    }
    if (t == _i20.Society) {
      return _i20.Society.fromJson(data) as T;
    }
    if (t == _i21.SocietyInvitation) {
      return _i21.SocietyInvitation.fromJson(data) as T;
    }
    if (t == _i22.SocietyUser) {
      return _i22.SocietyUser.fromJson(data) as T;
    }
    if (t == _i23.UserRole) {
      return _i23.UserRole.fromJson(data) as T;
    }
    if (t == _i24.DocumentCategory) {
      return _i24.DocumentCategory.fromJson(data) as T;
    }
    if (t == _i25.MeetingMinutes) {
      return _i25.MeetingMinutes.fromJson(data) as T;
    }
    if (t == _i26.SocietyDocument) {
      return _i26.SocietyDocument.fromJson(data) as T;
    }
    if (t == _i27.UploadDescriptionResponse) {
      return _i27.UploadDescriptionResponse.fromJson(data) as T;
    }
    if (t == _i28.EmergencyType) {
      return _i28.EmergencyType.fromJson(data) as T;
    }
    if (t == _i29.SosAlert) {
      return _i29.SosAlert.fromJson(data) as T;
    }
    if (t == _i30.SosStatus) {
      return _i30.SosStatus.fromJson(data) as T;
    }
    if (t == _i31.Greeting) {
      return _i31.Greeting.fromJson(data) as T;
    }
    if (t == _i32.BillStatus) {
      return _i32.BillStatus.fromJson(data) as T;
    }
    if (t == _i33.MaintenanceBill) {
      return _i33.MaintenanceBill.fromJson(data) as T;
    }
    if (t == _i34.MaintenanceHead) {
      return _i34.MaintenanceHead.fromJson(data) as T;
    }
    if (t == _i35.PaymentRecord) {
      return _i35.PaymentRecord.fromJson(data) as T;
    }
    if (t == _i36.DeviceToken) {
      return _i36.DeviceToken.fromJson(data) as T;
    }
    if (t == _i37.PushNotificationPayload) {
      return _i37.PushNotificationPayload.fromJson(data) as T;
    }
    if (t == _i38.RazorpayOrderResponse) {
      return _i38.RazorpayOrderResponse.fromJson(data) as T;
    }
    if (t == _i39.PaymentTransaction) {
      return _i39.PaymentTransaction.fromJson(data) as T;
    }
    if (t == _i40.PaymentTransactionStatus) {
      return _i40.PaymentTransactionStatus.fromJson(data) as T;
    }
    if (t == _i41.PaymentVerificationResult) {
      return _i41.PaymentVerificationResult.fromJson(data) as T;
    }
    if (t == _i42.WebhookResult) {
      return _i42.WebhookResult.fromJson(data) as T;
    }
    if (t == _i43.PollOption) {
      return _i43.PollOption.fromJson(data) as T;
    }
    if (t == _i44.PollStatus) {
      return _i44.PollStatus.fromJson(data) as T;
    }
    if (t == _i45.PollVote) {
      return _i45.PollVote.fromJson(data) as T;
    }
    if (t == _i46.SocietyPoll) {
      return _i46.SocietyPoll.fromJson(data) as T;
    }
    if (t == _i47.GateBellEvent) {
      return _i47.GateBellEvent.fromJson(data) as T;
    }
    if (t == _i48.SosAlertEvent) {
      return _i48.SosAlertEvent.fromJson(data) as T;
    }
    if (t == _i49.SaasMetricSummary) {
      return _i49.SaasMetricSummary.fromJson(data) as T;
    }
    if (t == _i50.SocietySubscription) {
      return _i50.SocietySubscription.fromJson(data) as T;
    }
    if (t == _i51.SubscriptionTier) {
      return _i51.SubscriptionTier.fromJson(data) as T;
    }
    if (t == _i52.NocStatus) {
      return _i52.NocStatus.fromJson(data) as T;
    }
    if (t == _i53.TenantNoc) {
      return _i53.TenantNoc.fromJson(data) as T;
    }
    if (t == _i54.VisitorEntry) {
      return _i54.VisitorEntry.fromJson(data) as T;
    }
    if (t == _i55.VisitorStatus) {
      return _i55.VisitorStatus.fromJson(data) as T;
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
    if (t == _i1.getType<_i6.Amenity?>()) {
      return (data != null ? _i6.Amenity.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.AmenityBooking?>()) {
      return (data != null ? _i7.AmenityBooking.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.BookingStatus?>()) {
      return (data != null ? _i8.BookingStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.AuditCategory?>()) {
      return (data != null ? _i9.AuditCategory.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.AuditLog?>()) {
      return (data != null ? _i10.AuditLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.AuthResponse?>()) {
      return (data != null ? _i11.AuthResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.OtpSendResult?>()) {
      return (data != null ? _i12.OtpSendResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.PhoneOtp?>()) {
      return (data != null ? _i13.PhoneOtp.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Complaint?>()) {
      return (data != null ? _i14.Complaint.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.ComplaintStatus?>()) {
      return (data != null ? _i15.ComplaintStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.Notice?>()) {
      return (data != null ? _i16.Notice.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.Building?>()) {
      return (data != null ? _i17.Building.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Complex?>()) {
      return (data != null ? _i18.Complex.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.Flat?>()) {
      return (data != null ? _i19.Flat.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.Society?>()) {
      return (data != null ? _i20.Society.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.SocietyInvitation?>()) {
      return (data != null ? _i21.SocietyInvitation.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.SocietyUser?>()) {
      return (data != null ? _i22.SocietyUser.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.UserRole?>()) {
      return (data != null ? _i23.UserRole.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.DocumentCategory?>()) {
      return (data != null ? _i24.DocumentCategory.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.MeetingMinutes?>()) {
      return (data != null ? _i25.MeetingMinutes.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.SocietyDocument?>()) {
      return (data != null ? _i26.SocietyDocument.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.UploadDescriptionResponse?>()) {
      return (data != null
              ? _i27.UploadDescriptionResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i28.EmergencyType?>()) {
      return (data != null ? _i28.EmergencyType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.SosAlert?>()) {
      return (data != null ? _i29.SosAlert.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.SosStatus?>()) {
      return (data != null ? _i30.SosStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.Greeting?>()) {
      return (data != null ? _i31.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.BillStatus?>()) {
      return (data != null ? _i32.BillStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.MaintenanceBill?>()) {
      return (data != null ? _i33.MaintenanceBill.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.MaintenanceHead?>()) {
      return (data != null ? _i34.MaintenanceHead.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.PaymentRecord?>()) {
      return (data != null ? _i35.PaymentRecord.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.DeviceToken?>()) {
      return (data != null ? _i36.DeviceToken.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.PushNotificationPayload?>()) {
      return (data != null ? _i37.PushNotificationPayload.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i38.RazorpayOrderResponse?>()) {
      return (data != null ? _i38.RazorpayOrderResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i39.PaymentTransaction?>()) {
      return (data != null ? _i39.PaymentTransaction.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i40.PaymentTransactionStatus?>()) {
      return (data != null
              ? _i40.PaymentTransactionStatus.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i41.PaymentVerificationResult?>()) {
      return (data != null
              ? _i41.PaymentVerificationResult.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i42.WebhookResult?>()) {
      return (data != null ? _i42.WebhookResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i43.PollOption?>()) {
      return (data != null ? _i43.PollOption.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i44.PollStatus?>()) {
      return (data != null ? _i44.PollStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i45.PollVote?>()) {
      return (data != null ? _i45.PollVote.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i46.SocietyPoll?>()) {
      return (data != null ? _i46.SocietyPoll.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i47.GateBellEvent?>()) {
      return (data != null ? _i47.GateBellEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i48.SosAlertEvent?>()) {
      return (data != null ? _i48.SosAlertEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i49.SaasMetricSummary?>()) {
      return (data != null ? _i49.SaasMetricSummary.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i50.SocietySubscription?>()) {
      return (data != null ? _i50.SocietySubscription.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i51.SubscriptionTier?>()) {
      return (data != null ? _i51.SubscriptionTier.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i52.NocStatus?>()) {
      return (data != null ? _i52.NocStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i53.TenantNoc?>()) {
      return (data != null ? _i53.TenantNoc.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i54.VisitorEntry?>()) {
      return (data != null ? _i54.VisitorEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i55.VisitorStatus?>()) {
      return (data != null ? _i55.VisitorStatus.fromJson(data) : null) as T;
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
    if (t == List<_i56.VoucherRequest>) {
      return (data as List)
              .map((e) => deserialize<_i56.VoucherRequest>(e))
              .toList()
          as T;
    }
    if (t == List<_i57.LedgerEntry>) {
      return (data as List)
              .map((e) => deserialize<_i57.LedgerEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i58.LedgerAccount>) {
      return (data as List)
              .map((e) => deserialize<_i58.LedgerAccount>(e))
              .toList()
          as T;
    }
    if (t == List<_i59.Amenity>) {
      return (data as List).map((e) => deserialize<_i59.Amenity>(e)).toList()
          as T;
    }
    if (t == List<_i60.AmenityBooking>) {
      return (data as List)
              .map((e) => deserialize<_i60.AmenityBooking>(e))
              .toList()
          as T;
    }
    if (t == List<_i61.AuditLog>) {
      return (data as List).map((e) => deserialize<_i61.AuditLog>(e)).toList()
          as T;
    }
    if (t == List<_i62.Notice>) {
      return (data as List).map((e) => deserialize<_i62.Notice>(e)).toList()
          as T;
    }
    if (t == List<_i63.Complaint>) {
      return (data as List).map((e) => deserialize<_i63.Complaint>(e)).toList()
          as T;
    }
    if (t == List<_i64.Society>) {
      return (data as List).map((e) => deserialize<_i64.Society>(e)).toList()
          as T;
    }
    if (t == List<_i65.Building>) {
      return (data as List).map((e) => deserialize<_i65.Building>(e)).toList()
          as T;
    }
    if (t == List<_i66.Flat>) {
      return (data as List).map((e) => deserialize<_i66.Flat>(e)).toList() as T;
    }
    if (t == List<_i67.SocietyUser>) {
      return (data as List)
              .map((e) => deserialize<_i67.SocietyUser>(e))
              .toList()
          as T;
    }
    if (t == List<_i68.SocietyInvitation>) {
      return (data as List)
              .map((e) => deserialize<_i68.SocietyInvitation>(e))
              .toList()
          as T;
    }
    if (t == List<_i69.SocietyDocument>) {
      return (data as List)
              .map((e) => deserialize<_i69.SocietyDocument>(e))
              .toList()
          as T;
    }
    if (t == List<_i70.MeetingMinutes>) {
      return (data as List)
              .map((e) => deserialize<_i70.MeetingMinutes>(e))
              .toList()
          as T;
    }
    if (t == List<_i71.SosAlert>) {
      return (data as List).map((e) => deserialize<_i71.SosAlert>(e)).toList()
          as T;
    }
    if (t == List<_i72.MaintenanceBill>) {
      return (data as List)
              .map((e) => deserialize<_i72.MaintenanceBill>(e))
              .toList()
          as T;
    }
    if (t == List<_i73.PaymentRecord>) {
      return (data as List)
              .map((e) => deserialize<_i73.PaymentRecord>(e))
              .toList()
          as T;
    }
    if (t == List<_i74.SocietyPoll>) {
      return (data as List)
              .map((e) => deserialize<_i74.SocietyPoll>(e))
              .toList()
          as T;
    }
    if (t == List<_i75.PollOption>) {
      return (data as List).map((e) => deserialize<_i75.PollOption>(e)).toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i76.SocietySubscription>) {
      return (data as List)
              .map((e) => deserialize<_i76.SocietySubscription>(e))
              .toList()
          as T;
    }
    if (t == List<_i77.TenantNoc>) {
      return (data as List).map((e) => deserialize<_i77.TenantNoc>(e)).toList()
          as T;
    }
    if (t == List<_i78.VisitorEntry>) {
      return (data as List)
              .map((e) => deserialize<_i78.VisitorEntry>(e))
              .toList()
          as T;
    }
    try {
      return _i79.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i80.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.LedgerAccount => 'LedgerAccount',
      _i3.LedgerEntry => 'LedgerEntry',
      _i4.VoucherRequest => 'VoucherRequest',
      _i5.VoucherStatus => 'VoucherStatus',
      _i6.Amenity => 'Amenity',
      _i7.AmenityBooking => 'AmenityBooking',
      _i8.BookingStatus => 'BookingStatus',
      _i9.AuditCategory => 'AuditCategory',
      _i10.AuditLog => 'AuditLog',
      _i11.AuthResponse => 'AuthResponse',
      _i12.OtpSendResult => 'OtpSendResult',
      _i13.PhoneOtp => 'PhoneOtp',
      _i14.Complaint => 'Complaint',
      _i15.ComplaintStatus => 'ComplaintStatus',
      _i16.Notice => 'Notice',
      _i17.Building => 'Building',
      _i18.Complex => 'Complex',
      _i19.Flat => 'Flat',
      _i20.Society => 'Society',
      _i21.SocietyInvitation => 'SocietyInvitation',
      _i22.SocietyUser => 'SocietyUser',
      _i23.UserRole => 'UserRole',
      _i24.DocumentCategory => 'DocumentCategory',
      _i25.MeetingMinutes => 'MeetingMinutes',
      _i26.SocietyDocument => 'SocietyDocument',
      _i27.UploadDescriptionResponse => 'UploadDescriptionResponse',
      _i28.EmergencyType => 'EmergencyType',
      _i29.SosAlert => 'SosAlert',
      _i30.SosStatus => 'SosStatus',
      _i31.Greeting => 'Greeting',
      _i32.BillStatus => 'BillStatus',
      _i33.MaintenanceBill => 'MaintenanceBill',
      _i34.MaintenanceHead => 'MaintenanceHead',
      _i35.PaymentRecord => 'PaymentRecord',
      _i36.DeviceToken => 'DeviceToken',
      _i37.PushNotificationPayload => 'PushNotificationPayload',
      _i38.RazorpayOrderResponse => 'RazorpayOrderResponse',
      _i39.PaymentTransaction => 'PaymentTransaction',
      _i40.PaymentTransactionStatus => 'PaymentTransactionStatus',
      _i41.PaymentVerificationResult => 'PaymentVerificationResult',
      _i42.WebhookResult => 'WebhookResult',
      _i43.PollOption => 'PollOption',
      _i44.PollStatus => 'PollStatus',
      _i45.PollVote => 'PollVote',
      _i46.SocietyPoll => 'SocietyPoll',
      _i47.GateBellEvent => 'GateBellEvent',
      _i48.SosAlertEvent => 'SosAlertEvent',
      _i49.SaasMetricSummary => 'SaasMetricSummary',
      _i50.SocietySubscription => 'SocietySubscription',
      _i51.SubscriptionTier => 'SubscriptionTier',
      _i52.NocStatus => 'NocStatus',
      _i53.TenantNoc => 'TenantNoc',
      _i54.VisitorEntry => 'VisitorEntry',
      _i55.VisitorStatus => 'VisitorStatus',
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
      case _i6.Amenity():
        return 'Amenity';
      case _i7.AmenityBooking():
        return 'AmenityBooking';
      case _i8.BookingStatus():
        return 'BookingStatus';
      case _i9.AuditCategory():
        return 'AuditCategory';
      case _i10.AuditLog():
        return 'AuditLog';
      case _i11.AuthResponse():
        return 'AuthResponse';
      case _i12.OtpSendResult():
        return 'OtpSendResult';
      case _i13.PhoneOtp():
        return 'PhoneOtp';
      case _i14.Complaint():
        return 'Complaint';
      case _i15.ComplaintStatus():
        return 'ComplaintStatus';
      case _i16.Notice():
        return 'Notice';
      case _i17.Building():
        return 'Building';
      case _i18.Complex():
        return 'Complex';
      case _i19.Flat():
        return 'Flat';
      case _i20.Society():
        return 'Society';
      case _i21.SocietyInvitation():
        return 'SocietyInvitation';
      case _i22.SocietyUser():
        return 'SocietyUser';
      case _i23.UserRole():
        return 'UserRole';
      case _i24.DocumentCategory():
        return 'DocumentCategory';
      case _i25.MeetingMinutes():
        return 'MeetingMinutes';
      case _i26.SocietyDocument():
        return 'SocietyDocument';
      case _i27.UploadDescriptionResponse():
        return 'UploadDescriptionResponse';
      case _i28.EmergencyType():
        return 'EmergencyType';
      case _i29.SosAlert():
        return 'SosAlert';
      case _i30.SosStatus():
        return 'SosStatus';
      case _i31.Greeting():
        return 'Greeting';
      case _i32.BillStatus():
        return 'BillStatus';
      case _i33.MaintenanceBill():
        return 'MaintenanceBill';
      case _i34.MaintenanceHead():
        return 'MaintenanceHead';
      case _i35.PaymentRecord():
        return 'PaymentRecord';
      case _i36.DeviceToken():
        return 'DeviceToken';
      case _i37.PushNotificationPayload():
        return 'PushNotificationPayload';
      case _i38.RazorpayOrderResponse():
        return 'RazorpayOrderResponse';
      case _i39.PaymentTransaction():
        return 'PaymentTransaction';
      case _i40.PaymentTransactionStatus():
        return 'PaymentTransactionStatus';
      case _i41.PaymentVerificationResult():
        return 'PaymentVerificationResult';
      case _i42.WebhookResult():
        return 'WebhookResult';
      case _i43.PollOption():
        return 'PollOption';
      case _i44.PollStatus():
        return 'PollStatus';
      case _i45.PollVote():
        return 'PollVote';
      case _i46.SocietyPoll():
        return 'SocietyPoll';
      case _i47.GateBellEvent():
        return 'GateBellEvent';
      case _i48.SosAlertEvent():
        return 'SosAlertEvent';
      case _i49.SaasMetricSummary():
        return 'SaasMetricSummary';
      case _i50.SocietySubscription():
        return 'SocietySubscription';
      case _i51.SubscriptionTier():
        return 'SubscriptionTier';
      case _i52.NocStatus():
        return 'NocStatus';
      case _i53.TenantNoc():
        return 'TenantNoc';
      case _i54.VisitorEntry():
        return 'VisitorEntry';
      case _i55.VisitorStatus():
        return 'VisitorStatus';
    }
    className = _i79.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i80.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'Amenity') {
      return deserialize<_i6.Amenity>(data['data']);
    }
    if (dataClassName == 'AmenityBooking') {
      return deserialize<_i7.AmenityBooking>(data['data']);
    }
    if (dataClassName == 'BookingStatus') {
      return deserialize<_i8.BookingStatus>(data['data']);
    }
    if (dataClassName == 'AuditCategory') {
      return deserialize<_i9.AuditCategory>(data['data']);
    }
    if (dataClassName == 'AuditLog') {
      return deserialize<_i10.AuditLog>(data['data']);
    }
    if (dataClassName == 'AuthResponse') {
      return deserialize<_i11.AuthResponse>(data['data']);
    }
    if (dataClassName == 'OtpSendResult') {
      return deserialize<_i12.OtpSendResult>(data['data']);
    }
    if (dataClassName == 'PhoneOtp') {
      return deserialize<_i13.PhoneOtp>(data['data']);
    }
    if (dataClassName == 'Complaint') {
      return deserialize<_i14.Complaint>(data['data']);
    }
    if (dataClassName == 'ComplaintStatus') {
      return deserialize<_i15.ComplaintStatus>(data['data']);
    }
    if (dataClassName == 'Notice') {
      return deserialize<_i16.Notice>(data['data']);
    }
    if (dataClassName == 'Building') {
      return deserialize<_i17.Building>(data['data']);
    }
    if (dataClassName == 'Complex') {
      return deserialize<_i18.Complex>(data['data']);
    }
    if (dataClassName == 'Flat') {
      return deserialize<_i19.Flat>(data['data']);
    }
    if (dataClassName == 'Society') {
      return deserialize<_i20.Society>(data['data']);
    }
    if (dataClassName == 'SocietyInvitation') {
      return deserialize<_i21.SocietyInvitation>(data['data']);
    }
    if (dataClassName == 'SocietyUser') {
      return deserialize<_i22.SocietyUser>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_i23.UserRole>(data['data']);
    }
    if (dataClassName == 'DocumentCategory') {
      return deserialize<_i24.DocumentCategory>(data['data']);
    }
    if (dataClassName == 'MeetingMinutes') {
      return deserialize<_i25.MeetingMinutes>(data['data']);
    }
    if (dataClassName == 'SocietyDocument') {
      return deserialize<_i26.SocietyDocument>(data['data']);
    }
    if (dataClassName == 'UploadDescriptionResponse') {
      return deserialize<_i27.UploadDescriptionResponse>(data['data']);
    }
    if (dataClassName == 'EmergencyType') {
      return deserialize<_i28.EmergencyType>(data['data']);
    }
    if (dataClassName == 'SosAlert') {
      return deserialize<_i29.SosAlert>(data['data']);
    }
    if (dataClassName == 'SosStatus') {
      return deserialize<_i30.SosStatus>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i31.Greeting>(data['data']);
    }
    if (dataClassName == 'BillStatus') {
      return deserialize<_i32.BillStatus>(data['data']);
    }
    if (dataClassName == 'MaintenanceBill') {
      return deserialize<_i33.MaintenanceBill>(data['data']);
    }
    if (dataClassName == 'MaintenanceHead') {
      return deserialize<_i34.MaintenanceHead>(data['data']);
    }
    if (dataClassName == 'PaymentRecord') {
      return deserialize<_i35.PaymentRecord>(data['data']);
    }
    if (dataClassName == 'DeviceToken') {
      return deserialize<_i36.DeviceToken>(data['data']);
    }
    if (dataClassName == 'PushNotificationPayload') {
      return deserialize<_i37.PushNotificationPayload>(data['data']);
    }
    if (dataClassName == 'RazorpayOrderResponse') {
      return deserialize<_i38.RazorpayOrderResponse>(data['data']);
    }
    if (dataClassName == 'PaymentTransaction') {
      return deserialize<_i39.PaymentTransaction>(data['data']);
    }
    if (dataClassName == 'PaymentTransactionStatus') {
      return deserialize<_i40.PaymentTransactionStatus>(data['data']);
    }
    if (dataClassName == 'PaymentVerificationResult') {
      return deserialize<_i41.PaymentVerificationResult>(data['data']);
    }
    if (dataClassName == 'WebhookResult') {
      return deserialize<_i42.WebhookResult>(data['data']);
    }
    if (dataClassName == 'PollOption') {
      return deserialize<_i43.PollOption>(data['data']);
    }
    if (dataClassName == 'PollStatus') {
      return deserialize<_i44.PollStatus>(data['data']);
    }
    if (dataClassName == 'PollVote') {
      return deserialize<_i45.PollVote>(data['data']);
    }
    if (dataClassName == 'SocietyPoll') {
      return deserialize<_i46.SocietyPoll>(data['data']);
    }
    if (dataClassName == 'GateBellEvent') {
      return deserialize<_i47.GateBellEvent>(data['data']);
    }
    if (dataClassName == 'SosAlertEvent') {
      return deserialize<_i48.SosAlertEvent>(data['data']);
    }
    if (dataClassName == 'SaasMetricSummary') {
      return deserialize<_i49.SaasMetricSummary>(data['data']);
    }
    if (dataClassName == 'SocietySubscription') {
      return deserialize<_i50.SocietySubscription>(data['data']);
    }
    if (dataClassName == 'SubscriptionTier') {
      return deserialize<_i51.SubscriptionTier>(data['data']);
    }
    if (dataClassName == 'NocStatus') {
      return deserialize<_i52.NocStatus>(data['data']);
    }
    if (dataClassName == 'TenantNoc') {
      return deserialize<_i53.TenantNoc>(data['data']);
    }
    if (dataClassName == 'VisitorEntry') {
      return deserialize<_i54.VisitorEntry>(data['data']);
    }
    if (dataClassName == 'VisitorStatus') {
      return deserialize<_i55.VisitorStatus>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i79.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i80.Protocol().deserializeByClassName(data);
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
      return _i79.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i80.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
