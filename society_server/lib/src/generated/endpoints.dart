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
import '../accounting/accounting_endpoint.dart' as _i2;
import '../amenity/amenity_endpoint.dart' as _i3;
import '../audit/audit_endpoint.dart' as _i4;
import '../auth/auth_endpoint.dart' as _i5;
import '../auth/email_idp_endpoint.dart' as _i6;
import '../auth/jwt_refresh_endpoint.dart' as _i7;
import '../communication/communication_endpoint.dart' as _i8;
import '../core/society_endpoint.dart' as _i9;
import '../documents/document_endpoint.dart' as _i10;
import '../emergency/sos_endpoint.dart' as _i11;
import '../greetings/greeting_endpoint.dart' as _i12;
import '../maintenance/maintenance_endpoint.dart' as _i13;
import '../notifications/notification_endpoint.dart' as _i14;
import '../payment/payment_endpoint.dart' as _i15;
import '../polling/poll_endpoint.dart' as _i16;
import '../realtime/realtime_endpoint.dart' as _i17;
import '../saas_admin/saas_admin_endpoint.dart' as _i18;
import '../tenancy/tenancy_endpoint.dart' as _i19;
import '../visitor/visitor_endpoint.dart' as _i20;
import 'package:society_server/src/generated/accounting/models/voucher_status.dart'
    as _i21;
import 'package:society_server/src/generated/accounting/models/voucher_request.dart'
    as _i22;
import 'package:society_server/src/generated/audit/models/audit_category.dart'
    as _i23;
import 'package:society_server/src/generated/communication/models/notice.dart'
    as _i24;
import 'package:society_server/src/generated/communication/models/complaint.dart'
    as _i25;
import 'package:society_server/src/generated/communication/models/complaint_status.dart'
    as _i26;
import 'package:society_server/src/generated/core/models/society.dart' as _i27;
import 'package:society_server/src/generated/core/models/building.dart' as _i28;
import 'package:society_server/src/generated/core/models/flat.dart' as _i29;
import 'package:society_server/src/generated/core/models/society_user.dart'
    as _i30;
import 'package:society_server/src/generated/core/models/society_invitation.dart'
    as _i31;
import 'package:society_server/src/generated/documents/models/document_category.dart'
    as _i32;
import 'package:society_server/src/generated/documents/models/meeting_minutes.dart'
    as _i33;
import 'package:society_server/src/generated/emergency/models/sos_alert.dart'
    as _i34;
import 'package:society_server/src/generated/maintenance/models/maintenance_bill.dart'
    as _i35;
import 'package:society_server/src/generated/maintenance/models/payment_record.dart'
    as _i36;
import 'package:society_server/src/generated/polling/models/poll_status.dart'
    as _i37;
import 'package:society_server/src/generated/polling/models/society_poll.dart'
    as _i38;
import 'package:society_server/src/generated/saas_admin/models/society_subscription.dart'
    as _i39;
import 'package:society_server/src/generated/tenancy/models/noc_status.dart'
    as _i40;
import 'package:society_server/src/generated/visitor/models/visitor_status.dart'
    as _i41;
import 'package:society_server/src/generated/visitor/models/visitor_entry.dart'
    as _i42;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i43;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i44;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'accounting': _i2.AccountingEndpoint()
        ..initialize(
          server,
          'accounting',
          null,
        ),
      'amenity': _i3.AmenityEndpoint()
        ..initialize(
          server,
          'amenity',
          null,
        ),
      'audit': _i4.AuditEndpoint()
        ..initialize(
          server,
          'audit',
          null,
        ),
      'auth': _i5.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'emailIdp': _i6.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _i7.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'communication': _i8.CommunicationEndpoint()
        ..initialize(
          server,
          'communication',
          null,
        ),
      'society': _i9.SocietyEndpoint()
        ..initialize(
          server,
          'society',
          null,
        ),
      'document': _i10.DocumentEndpoint()
        ..initialize(
          server,
          'document',
          null,
        ),
      'sos': _i11.SosEndpoint()
        ..initialize(
          server,
          'sos',
          null,
        ),
      'greeting': _i12.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
      'maintenance': _i13.MaintenanceEndpoint()
        ..initialize(
          server,
          'maintenance',
          null,
        ),
      'notification': _i14.NotificationEndpoint()
        ..initialize(
          server,
          'notification',
          null,
        ),
      'payment': _i15.PaymentEndpoint()
        ..initialize(
          server,
          'payment',
          null,
        ),
      'poll': _i16.PollEndpoint()
        ..initialize(
          server,
          'poll',
          null,
        ),
      'realtime': _i17.RealtimeEndpoint()
        ..initialize(
          server,
          'realtime',
          null,
        ),
      'saasAdmin': _i18.SaasAdminEndpoint()
        ..initialize(
          server,
          'saasAdmin',
          null,
        ),
      'tenancy': _i19.TenancyEndpoint()
        ..initialize(
          server,
          'tenancy',
          null,
        ),
      'visitor': _i20.VisitorEndpoint()
        ..initialize(
          server,
          'visitor',
          null,
        ),
    };
    connectors['accounting'] = _i1.EndpointConnector(
      name: 'accounting',
      endpoint: endpoints['accounting']!,
      methodConnectors: {
        'getVouchers': _i1.MethodConnector(
          name: 'getVouchers',
          params: {
            'societyId': _i1.ParameterDescription(
              name: 'societyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i21.VoucherStatus?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['accounting'] as _i2.AccountingEndpoint)
                  .getVouchers(
                    session,
                    params['societyId'],
                    status: params['status'],
                  ),
        ),
        'createVoucherRequest': _i1.MethodConnector(
          name: 'createVoucherRequest',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i22.VoucherRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['accounting'] as _i2.AccountingEndpoint)
                  .createVoucherRequest(
                    session,
                    params['request'],
                  ),
        ),
        'approveVoucher': _i1.MethodConnector(
          name: 'approveVoucher',
          params: {
            'voucherId': _i1.ParameterDescription(
              name: 'voucherId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'approvedByName': _i1.ParameterDescription(
              name: 'approvedByName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['accounting'] as _i2.AccountingEndpoint)
                  .approveVoucher(
                    session,
                    params['voucherId'],
                    params['approvedByName'],
                  ),
        ),
        'rejectVoucher': _i1.MethodConnector(
          name: 'rejectVoucher',
          params: {
            'voucherId': _i1.ParameterDescription(
              name: 'voucherId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'reason': _i1.ParameterDescription(
              name: 'reason',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['accounting'] as _i2.AccountingEndpoint)
                  .rejectVoucher(
                    session,
                    params['voucherId'],
                    params['reason'],
                  ),
        ),
        'postVoucherToLedger': _i1.MethodConnector(
          name: 'postVoucherToLedger',
          params: {
            'voucherId': _i1.ParameterDescription(
              name: 'voucherId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'postedByName': _i1.ParameterDescription(
              name: 'postedByName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'debit': _i1.ParameterDescription(
              name: 'debit',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'credit': _i1.ParameterDescription(
              name: 'credit',
              type: _i1.getType<double>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['accounting'] as _i2.AccountingEndpoint)
                  .postVoucherToLedger(
                    session,
                    params['voucherId'],
                    params['postedByName'],
                    params['description'],
                    params['debit'],
                    params['credit'],
                  ),
        ),
        'getLedgerEntries': _i1.MethodConnector(
          name: 'getLedgerEntries',
          params: {
            'societyId': _i1.ParameterDescription(
              name: 'societyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['accounting'] as _i2.AccountingEndpoint)
                  .getLedgerEntries(
                    session,
                    params['societyId'],
                  ),
        ),
        'getLedgerAccounts': _i1.MethodConnector(
          name: 'getLedgerAccounts',
          params: {
            'societyId': _i1.ParameterDescription(
              name: 'societyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['accounting'] as _i2.AccountingEndpoint)
                  .getLedgerAccounts(
                    session,
                    params['societyId'],
                  ),
        ),
      },
    );
    connectors['amenity'] = _i1.EndpointConnector(
      name: 'amenity',
      endpoint: endpoints['amenity']!,
      methodConnectors: {
        'getAmenities': _i1.MethodConnector(
          name: 'getAmenities',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['amenity'] as _i3.AmenityEndpoint).getAmenities(
                    session,
                    limit: params['limit'],
                    offset: params['offset'],
                  ),
        ),
        'getBookings': _i1.MethodConnector(
          name: 'getBookings',
          params: {
            'date': _i1.ParameterDescription(
              name: 'date',
              type: _i1.getType<DateTime?>(),
              nullable: true,
            ),
            'amenityId': _i1.ParameterDescription(
              name: 'amenityId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['amenity'] as _i3.AmenityEndpoint).getBookings(
                    session,
                    date: params['date'],
                    amenityId: params['amenityId'],
                    limit: params['limit'],
                    offset: params['offset'],
                  ),
        ),
        'bookSlot': _i1.MethodConnector(
          name: 'bookSlot',
          params: {
            'amenityId': _i1.ParameterDescription(
              name: 'amenityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'date': _i1.ParameterDescription(
              name: 'date',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'slot': _i1.ParameterDescription(
              name: 'slot',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['amenity'] as _i3.AmenityEndpoint).bookSlot(
                session,
                amenityId: params['amenityId'],
                date: params['date'],
                slot: params['slot'],
              ),
        ),
        'cancelBooking': _i1.MethodConnector(
          name: 'cancelBooking',
          params: {
            'bookingId': _i1.ParameterDescription(
              name: 'bookingId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['amenity'] as _i3.AmenityEndpoint).cancelBooking(
                    session,
                    bookingId: params['bookingId'],
                  ),
        ),
      },
    );
    connectors['audit'] = _i1.EndpointConnector(
      name: 'audit',
      endpoint: endpoints['audit']!,
      methodConnectors: {
        'getAuditLogs': _i1.MethodConnector(
          name: 'getAuditLogs',
          params: {
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<_i23.AuditCategory?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['audit'] as _i4.AuditEndpoint).getAuditLogs(
                session,
                category: params['category'],
                limit: params['limit'],
                offset: params['offset'],
              ),
        ),
        'logEvent': _i1.MethodConnector(
          name: 'logEvent',
          params: {
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<_i23.AuditCategory>(),
              nullable: false,
            ),
            'action': _i1.ParameterDescription(
              name: 'action',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'target': _i1.ParameterDescription(
              name: 'target',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['audit'] as _i4.AuditEndpoint).logEvent(
                session,
                category: params['category'],
                action: params['action'],
                target: params['target'],
                description: params['description'],
              ),
        ),
      },
    );
    connectors['auth'] = _i1.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {
        'sendOtp': _i1.MethodConnector(
          name: 'sendOtp',
          params: {
            'phone': _i1.ParameterDescription(
              name: 'phone',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i5.AuthEndpoint).sendOtp(
                session,
                params['phone'],
              ),
        ),
        'verifyOtp': _i1.MethodConnector(
          name: 'verifyOtp',
          params: {
            'phone': _i1.ParameterDescription(
              name: 'phone',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'otp': _i1.ParameterDescription(
              name: 'otp',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i5.AuthEndpoint).verifyOtp(
                session,
                params['phone'],
                params['otp'],
              ),
        ),
        'signOut': _i1.MethodConnector(
          name: 'signOut',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['auth'] as _i5.AuthEndpoint).signOut(session),
        ),
      },
    );
    connectors['emailIdp'] = _i1.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i6.EmailIdpEndpoint).login(
                session,
                email: params['email'],
                password: params['password'],
              ),
        ),
        'startRegistration': _i1.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i6.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _i1.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _i1.ParameterDescription(
              name: 'accountRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i6.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _i1.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _i1.ParameterDescription(
              name: 'registrationToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i6.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _i1.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i6.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _i1.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _i1.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i6.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _i1.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _i1.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPassword': _i1.ParameterDescription(
              name: 'newPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i6.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _i1.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i6.EmailIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['jwtRefresh'] = _i1.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _i1.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _i1.ParameterDescription(
              name: 'refreshToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['jwtRefresh'] as _i7.JwtRefreshEndpoint)
                  .refreshAccessToken(
                    session,
                    refreshToken: params['refreshToken'],
                  ),
        ),
      },
    );
    connectors['communication'] = _i1.EndpointConnector(
      name: 'communication',
      endpoint: endpoints['communication']!,
      methodConnectors: {
        'getNotices': _i1.MethodConnector(
          name: 'getNotices',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['communication'] as _i8.CommunicationEndpoint)
                      .getNotices(session),
        ),
        'createNotice': _i1.MethodConnector(
          name: 'createNotice',
          params: {
            'notice': _i1.ParameterDescription(
              name: 'notice',
              type: _i1.getType<_i24.Notice>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['communication'] as _i8.CommunicationEndpoint)
                      .createNotice(
                        session,
                        params['notice'],
                      ),
        ),
        'getComplaints': _i1.MethodConnector(
          name: 'getComplaints',
          params: {
            'flatNumber': _i1.ParameterDescription(
              name: 'flatNumber',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['communication'] as _i8.CommunicationEndpoint)
                      .getComplaints(
                        session,
                        flatNumber: params['flatNumber'],
                      ),
        ),
        'createComplaint': _i1.MethodConnector(
          name: 'createComplaint',
          params: {
            'complaint': _i1.ParameterDescription(
              name: 'complaint',
              type: _i1.getType<_i25.Complaint>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['communication'] as _i8.CommunicationEndpoint)
                      .createComplaint(
                        session,
                        params['complaint'],
                      ),
        ),
        'updateComplaintStatus': _i1.MethodConnector(
          name: 'updateComplaintStatus',
          params: {
            'complaintId': _i1.ParameterDescription(
              name: 'complaintId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i26.ComplaintStatus>(),
              nullable: false,
            ),
            'resolutionNotes': _i1.ParameterDescription(
              name: 'resolutionNotes',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['communication'] as _i8.CommunicationEndpoint)
                      .updateComplaintStatus(
                        session,
                        params['complaintId'],
                        params['status'],
                        params['resolutionNotes'],
                      ),
        ),
      },
    );
    connectors['society'] = _i1.EndpointConnector(
      name: 'society',
      endpoint: endpoints['society']!,
      methodConnectors: {
        'createSociety': _i1.MethodConnector(
          name: 'createSociety',
          params: {
            'society': _i1.ParameterDescription(
              name: 'society',
              type: _i1.getType<_i27.Society>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['society'] as _i9.SocietyEndpoint).createSociety(
                    session,
                    params['society'],
                  ),
        ),
        'getSocieties': _i1.MethodConnector(
          name: 'getSocieties',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['society'] as _i9.SocietyEndpoint)
                  .getSocieties(session),
        ),
        'getSocietyById': _i1.MethodConnector(
          name: 'getSocietyById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['society'] as _i9.SocietyEndpoint).getSocietyById(
                    session,
                    params['id'],
                  ),
        ),
        'onboardNewSocietyWithAdmin': _i1.MethodConnector(
          name: 'onboardNewSocietyWithAdmin',
          params: {
            'society': _i1.ParameterDescription(
              name: 'society',
              type: _i1.getType<_i27.Society>(),
              nullable: false,
            ),
            'adminName': _i1.ParameterDescription(
              name: 'adminName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'adminPhone': _i1.ParameterDescription(
              name: 'adminPhone',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'adminEmail': _i1.ParameterDescription(
              name: 'adminEmail',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'planName': _i1.ParameterDescription(
              name: 'planName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['society'] as _i9.SocietyEndpoint)
                  .onboardNewSocietyWithAdmin(
                    session,
                    params['society'],
                    params['adminName'],
                    params['adminPhone'],
                    params['adminEmail'],
                    params['planName'],
                  ),
        ),
        'getBuildings': _i1.MethodConnector(
          name: 'getBuildings',
          params: {
            'societyId': _i1.ParameterDescription(
              name: 'societyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['society'] as _i9.SocietyEndpoint).getBuildings(
                    session,
                    params['societyId'],
                  ),
        ),
        'createBuilding': _i1.MethodConnector(
          name: 'createBuilding',
          params: {
            'building': _i1.ParameterDescription(
              name: 'building',
              type: _i1.getType<_i28.Building>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['society'] as _i9.SocietyEndpoint).createBuilding(
                    session,
                    params['building'],
                  ),
        ),
        'getFlats': _i1.MethodConnector(
          name: 'getFlats',
          params: {
            'societyId': _i1.ParameterDescription(
              name: 'societyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['society'] as _i9.SocietyEndpoint).getFlats(
                session,
                params['societyId'],
              ),
        ),
        'createFlat': _i1.MethodConnector(
          name: 'createFlat',
          params: {
            'flat': _i1.ParameterDescription(
              name: 'flat',
              type: _i1.getType<_i29.Flat>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['society'] as _i9.SocietyEndpoint).createFlat(
                    session,
                    params['flat'],
                  ),
        ),
        'bulkCreateFlats': _i1.MethodConnector(
          name: 'bulkCreateFlats',
          params: {
            'flats': _i1.ParameterDescription(
              name: 'flats',
              type: _i1.getType<List<_i29.Flat>>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['society'] as _i9.SocietyEndpoint).bulkCreateFlats(
                    session,
                    params['flats'],
                  ),
        ),
        'getSocietyUsers': _i1.MethodConnector(
          name: 'getSocietyUsers',
          params: {
            'societyId': _i1.ParameterDescription(
              name: 'societyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['society'] as _i9.SocietyEndpoint).getSocietyUsers(
                    session,
                    params['societyId'],
                  ),
        ),
        'createSocietyUser': _i1.MethodConnector(
          name: 'createSocietyUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i30.SocietyUser>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['society'] as _i9.SocietyEndpoint)
                  .createSocietyUser(
                    session,
                    params['user'],
                  ),
        ),
        'createInvitation': _i1.MethodConnector(
          name: 'createInvitation',
          params: {
            'invitation': _i1.ParameterDescription(
              name: 'invitation',
              type: _i1.getType<_i31.SocietyInvitation>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['society'] as _i9.SocietyEndpoint)
                  .createInvitation(
                    session,
                    params['invitation'],
                  ),
        ),
        'bulkCreateInvitations': _i1.MethodConnector(
          name: 'bulkCreateInvitations',
          params: {
            'invitations': _i1.ParameterDescription(
              name: 'invitations',
              type: _i1.getType<List<_i31.SocietyInvitation>>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['society'] as _i9.SocietyEndpoint)
                  .bulkCreateInvitations(
                    session,
                    params['invitations'],
                  ),
        ),
        'getInvitations': _i1.MethodConnector(
          name: 'getInvitations',
          params: {
            'societyId': _i1.ParameterDescription(
              name: 'societyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['society'] as _i9.SocietyEndpoint).getInvitations(
                    session,
                    params['societyId'],
                  ),
        ),
        'verifyAndAcceptInvitation': _i1.MethodConnector(
          name: 'verifyAndAcceptInvitation',
          params: {
            'inviteCode': _i1.ParameterDescription(
              name: 'inviteCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'phone': _i1.ParameterDescription(
              name: 'phone',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['society'] as _i9.SocietyEndpoint)
                  .verifyAndAcceptInvitation(
                    session,
                    params['inviteCode'],
                    params['phone'],
                  ),
        ),
        'loginWithPhone': _i1.MethodConnector(
          name: 'loginWithPhone',
          params: {
            'phone': _i1.ParameterDescription(
              name: 'phone',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['society'] as _i9.SocietyEndpoint).loginWithPhone(
                    session,
                    params['phone'],
                  ),
        ),
      },
    );
    connectors['document'] = _i1.EndpointConnector(
      name: 'document',
      endpoint: endpoints['document']!,
      methodConnectors: {
        'getDocuments': _i1.MethodConnector(
          name: 'getDocuments',
          params: {
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<_i32.DocumentCategory?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['document'] as _i10.DocumentEndpoint).getDocuments(
                    session,
                    category: params['category'],
                    limit: params['limit'],
                    offset: params['offset'],
                  ),
        ),
        'getUploadDescription': _i1.MethodConnector(
          name: 'getUploadDescription',
          params: {
            'fileName': _i1.ParameterDescription(
              name: 'fileName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'fileSizeBytes': _i1.ParameterDescription(
              name: 'fileSizeBytes',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['document'] as _i10.DocumentEndpoint)
                  .getUploadDescription(
                    session,
                    fileName: params['fileName'],
                    fileSizeBytes: params['fileSizeBytes'],
                    category: params['category'],
                  ),
        ),
        'saveDocument': _i1.MethodConnector(
          name: 'saveDocument',
          params: {
            'title': _i1.ParameterDescription(
              name: 'title',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'description': _i1.ParameterDescription(
              name: 'description',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<_i32.DocumentCategory>(),
              nullable: false,
            ),
            'storagePath': _i1.ParameterDescription(
              name: 'storagePath',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'fileSize': _i1.ParameterDescription(
              name: 'fileSize',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'isCommitteeOnly': _i1.ParameterDescription(
              name: 'isCommitteeOnly',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['document'] as _i10.DocumentEndpoint).saveDocument(
                    session,
                    title: params['title'],
                    description: params['description'],
                    category: params['category'],
                    storagePath: params['storagePath'],
                    fileSize: params['fileSize'],
                    isCommitteeOnly: params['isCommitteeOnly'],
                  ),
        ),
        'getDownloadUrl': _i1.MethodConnector(
          name: 'getDownloadUrl',
          params: {
            'documentId': _i1.ParameterDescription(
              name: 'documentId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'storagePath': _i1.ParameterDescription(
              name: 'storagePath',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['document'] as _i10.DocumentEndpoint)
                  .getDownloadUrl(
                    session,
                    documentId: params['documentId'],
                    storagePath: params['storagePath'],
                  ),
        ),
        'getMeetingMinutes': _i1.MethodConnector(
          name: 'getMeetingMinutes',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['document'] as _i10.DocumentEndpoint)
                  .getMeetingMinutes(
                    session,
                    limit: params['limit'],
                    offset: params['offset'],
                  ),
        ),
        'recordMeetingMinutes': _i1.MethodConnector(
          name: 'recordMeetingMinutes',
          params: {
            'minutes': _i1.ParameterDescription(
              name: 'minutes',
              type: _i1.getType<_i33.MeetingMinutes>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['document'] as _i10.DocumentEndpoint)
                  .recordMeetingMinutes(
                    session,
                    params['minutes'],
                  ),
        ),
      },
    );
    connectors['sos'] = _i1.EndpointConnector(
      name: 'sos',
      endpoint: endpoints['sos']!,
      methodConnectors: {
        'raiseSosAlert': _i1.MethodConnector(
          name: 'raiseSosAlert',
          params: {
            'alert': _i1.ParameterDescription(
              name: 'alert',
              type: _i1.getType<_i34.SosAlert>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['sos'] as _i11.SosEndpoint).raiseSosAlert(
                session,
                params['alert'],
              ),
        ),
        'getActiveSosAlerts': _i1.MethodConnector(
          name: 'getActiveSosAlerts',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['sos'] as _i11.SosEndpoint)
                  .getActiveSosAlerts(session),
        ),
        'acknowledgeSos': _i1.MethodConnector(
          name: 'acknowledgeSos',
          params: {
            'alertId': _i1.ParameterDescription(
              name: 'alertId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'acknowledgedByName': _i1.ParameterDescription(
              name: 'acknowledgedByName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['sos'] as _i11.SosEndpoint).acknowledgeSos(
                session,
                params['alertId'],
                params['acknowledgedByName'],
              ),
        ),
        'resolveSos': _i1.MethodConnector(
          name: 'resolveSos',
          params: {
            'alertId': _i1.ParameterDescription(
              name: 'alertId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'resolvedByName': _i1.ParameterDescription(
              name: 'resolvedByName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'resolutionNotes': _i1.ParameterDescription(
              name: 'resolutionNotes',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['sos'] as _i11.SosEndpoint).resolveSos(
                session,
                params['alertId'],
                params['resolvedByName'],
                params['resolutionNotes'],
              ),
        ),
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['greeting'] as _i12.GreetingEndpoint).hello(
                session,
                params['name'],
              ),
        ),
      },
    );
    connectors['maintenance'] = _i1.EndpointConnector(
      name: 'maintenance',
      endpoint: endpoints['maintenance']!,
      methodConnectors: {
        'getBills': _i1.MethodConnector(
          name: 'getBills',
          params: {
            'societyId': _i1.ParameterDescription(
              name: 'societyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'flatNumber': _i1.ParameterDescription(
              name: 'flatNumber',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['maintenance'] as _i13.MaintenanceEndpoint)
                  .getBills(
                    session,
                    params['societyId'],
                    flatNumber: params['flatNumber'],
                  ),
        ),
        'createBill': _i1.MethodConnector(
          name: 'createBill',
          params: {
            'bill': _i1.ParameterDescription(
              name: 'bill',
              type: _i1.getType<_i35.MaintenanceBill>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['maintenance'] as _i13.MaintenanceEndpoint)
                  .createBill(
                    session,
                    params['bill'],
                  ),
        ),
        'recordPayment': _i1.MethodConnector(
          name: 'recordPayment',
          params: {
            'payment': _i1.ParameterDescription(
              name: 'payment',
              type: _i1.getType<_i36.PaymentRecord>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['maintenance'] as _i13.MaintenanceEndpoint)
                  .recordPayment(
                    session,
                    params['payment'],
                  ),
        ),
        'getPayments': _i1.MethodConnector(
          name: 'getPayments',
          params: {
            'societyId': _i1.ParameterDescription(
              name: 'societyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['maintenance'] as _i13.MaintenanceEndpoint)
                  .getPayments(
                    session,
                    params['societyId'],
                  ),
        ),
      },
    );
    connectors['notification'] = _i1.EndpointConnector(
      name: 'notification',
      endpoint: endpoints['notification']!,
      methodConnectors: {
        'registerDeviceToken': _i1.MethodConnector(
          name: 'registerDeviceToken',
          params: {
            'deviceToken': _i1.ParameterDescription(
              name: 'deviceToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'platform': _i1.ParameterDescription(
              name: 'platform',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['notification'] as _i14.NotificationEndpoint)
                      .registerDeviceToken(
                        session,
                        deviceToken: params['deviceToken'],
                        platform: params['platform'],
                      ),
        ),
        'unregisterDeviceToken': _i1.MethodConnector(
          name: 'unregisterDeviceToken',
          params: {
            'deviceToken': _i1.ParameterDescription(
              name: 'deviceToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['notification'] as _i14.NotificationEndpoint)
                      .unregisterDeviceToken(
                        session,
                        deviceToken: params['deviceToken'],
                      ),
        ),
        'cleanupStaleTokens': _i1.MethodConnector(
          name: 'cleanupStaleTokens',
          params: {
            'olderThanDays': _i1.ParameterDescription(
              name: 'olderThanDays',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['notification'] as _i14.NotificationEndpoint)
                      .cleanupStaleTokens(
                        session,
                        olderThanDays: params['olderThanDays'],
                      ),
        ),
      },
    );
    connectors['payment'] = _i1.EndpointConnector(
      name: 'payment',
      endpoint: endpoints['payment']!,
      methodConnectors: {
        'createPaymentOrder': _i1.MethodConnector(
          name: 'createPaymentOrder',
          params: {
            'billId': _i1.ParameterDescription(
              name: 'billId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['payment'] as _i15.PaymentEndpoint)
                  .createPaymentOrder(
                    session,
                    params['billId'],
                  ),
        ),
        'verifyPayment': _i1.MethodConnector(
          name: 'verifyPayment',
          params: {
            'orderId': _i1.ParameterDescription(
              name: 'orderId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'paymentId': _i1.ParameterDescription(
              name: 'paymentId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'signature': _i1.ParameterDescription(
              name: 'signature',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['payment'] as _i15.PaymentEndpoint).verifyPayment(
                    session,
                    params['orderId'],
                    params['paymentId'],
                    params['signature'],
                  ),
        ),
        'handleWebhook': _i1.MethodConnector(
          name: 'handleWebhook',
          params: {
            'payload': _i1.ParameterDescription(
              name: 'payload',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'signature': _i1.ParameterDescription(
              name: 'signature',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['payment'] as _i15.PaymentEndpoint).handleWebhook(
                    session,
                    params['payload'],
                    params['signature'],
                  ),
        ),
      },
    );
    connectors['poll'] = _i1.EndpointConnector(
      name: 'poll',
      endpoint: endpoints['poll']!,
      methodConnectors: {
        'getPolls': _i1.MethodConnector(
          name: 'getPolls',
          params: {
            'societyId': _i1.ParameterDescription(
              name: 'societyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i37.PollStatus?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['poll'] as _i16.PollEndpoint).getPolls(
                session,
                params['societyId'],
                status: params['status'],
              ),
        ),
        'getPollOptions': _i1.MethodConnector(
          name: 'getPollOptions',
          params: {
            'pollId': _i1.ParameterDescription(
              name: 'pollId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['poll'] as _i16.PollEndpoint).getPollOptions(
                    session,
                    params['pollId'],
                  ),
        ),
        'createPoll': _i1.MethodConnector(
          name: 'createPoll',
          params: {
            'poll': _i1.ParameterDescription(
              name: 'poll',
              type: _i1.getType<_i38.SocietyPoll>(),
              nullable: false,
            ),
            'options': _i1.ParameterDescription(
              name: 'options',
              type: _i1.getType<List<String>>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['poll'] as _i16.PollEndpoint).createPoll(
                session,
                params['poll'],
                params['options'],
              ),
        ),
        'castVote': _i1.MethodConnector(
          name: 'castVote',
          params: {
            'pollId': _i1.ParameterDescription(
              name: 'pollId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'flatNumber': _i1.ParameterDescription(
              name: 'flatNumber',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'voterName': _i1.ParameterDescription(
              name: 'voterName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'optionId': _i1.ParameterDescription(
              name: 'optionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['poll'] as _i16.PollEndpoint).castVote(
                session,
                params['pollId'],
                params['flatNumber'],
                params['voterName'],
                params['optionId'],
              ),
        ),
      },
    );
    connectors['realtime'] = _i1.EndpointConnector(
      name: 'realtime',
      endpoint: endpoints['realtime']!,
      methodConnectors: {
        'streamGateBell': _i1.MethodStreamConnector(
          name: 'streamGateBell',
          params: {
            'requestedFlat': _i1.ParameterDescription(
              name: 'requestedFlat',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
                Map<String, Stream> streamParams,
              ) => (endpoints['realtime'] as _i17.RealtimeEndpoint)
                  .streamGateBell(
                    session,
                    requestedFlat: params['requestedFlat'],
                  ),
        ),
        'streamSosAlerts': _i1.MethodStreamConnector(
          name: 'streamSosAlerts',
          params: {
            'requestedSocietyId': _i1.ParameterDescription(
              name: 'requestedSocietyId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
                Map<String, Stream> streamParams,
              ) => (endpoints['realtime'] as _i17.RealtimeEndpoint)
                  .streamSosAlerts(
                    session,
                    requestedSocietyId: params['requestedSocietyId'],
                  ),
        ),
      },
    );
    connectors['saasAdmin'] = _i1.EndpointConnector(
      name: 'saasAdmin',
      endpoint: endpoints['saasAdmin']!,
      methodConnectors: {
        'getMetricSummary': _i1.MethodConnector(
          name: 'getMetricSummary',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['saasAdmin'] as _i18.SaasAdminEndpoint)
                  .getMetricSummary(session),
        ),
        'getAllSubscriptions': _i1.MethodConnector(
          name: 'getAllSubscriptions',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['saasAdmin'] as _i18.SaasAdminEndpoint)
                  .getAllSubscriptions(session),
        ),
        'createSubscription': _i1.MethodConnector(
          name: 'createSubscription',
          params: {
            'sub': _i1.ParameterDescription(
              name: 'sub',
              type: _i1.getType<_i39.SocietySubscription>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['saasAdmin'] as _i18.SaasAdminEndpoint)
                  .createSubscription(
                    session,
                    params['sub'],
                  ),
        ),
        'updateSubscriptionStatus': _i1.MethodConnector(
          name: 'updateSubscriptionStatus',
          params: {
            'subscriptionId': _i1.ParameterDescription(
              name: 'subscriptionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['saasAdmin'] as _i18.SaasAdminEndpoint)
                  .updateSubscriptionStatus(
                    session,
                    params['subscriptionId'],
                    params['status'],
                  ),
        ),
      },
    );
    connectors['tenancy'] = _i1.EndpointConnector(
      name: 'tenancy',
      endpoint: endpoints['tenancy']!,
      methodConnectors: {
        'getTenantNocs': _i1.MethodConnector(
          name: 'getTenantNocs',
          params: {
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i40.NocStatus?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['tenancy'] as _i19.TenancyEndpoint).getTenantNocs(
                    session,
                    status: params['status'],
                    limit: params['limit'],
                    offset: params['offset'],
                  ),
        ),
        'submitNoc': _i1.MethodConnector(
          name: 'submitNoc',
          params: {
            'flatNumber': _i1.ParameterDescription(
              name: 'flatNumber',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'ownerName': _i1.ParameterDescription(
              name: 'ownerName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'ownerPhone': _i1.ParameterDescription(
              name: 'ownerPhone',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'tenantName': _i1.ParameterDescription(
              name: 'tenantName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'tenantPhone': _i1.ParameterDescription(
              name: 'tenantPhone',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'leaseStart': _i1.ParameterDescription(
              name: 'leaseStart',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'leaseEnd': _i1.ParameterDescription(
              name: 'leaseEnd',
              type: _i1.getType<DateTime>(),
              nullable: false,
            ),
            'monthlyRent': _i1.ParameterDescription(
              name: 'monthlyRent',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'documentPath': _i1.ParameterDescription(
              name: 'documentPath',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'documentUrl': _i1.ParameterDescription(
              name: 'documentUrl',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['tenancy'] as _i19.TenancyEndpoint).submitNoc(
                    session,
                    flatNumber: params['flatNumber'],
                    ownerName: params['ownerName'],
                    ownerPhone: params['ownerPhone'],
                    tenantName: params['tenantName'],
                    tenantPhone: params['tenantPhone'],
                    leaseStart: params['leaseStart'],
                    leaseEnd: params['leaseEnd'],
                    monthlyRent: params['monthlyRent'],
                    documentPath: params['documentPath'],
                    documentUrl: params['documentUrl'],
                  ),
        ),
        'resolveNoc': _i1.MethodConnector(
          name: 'resolveNoc',
          params: {
            'nocId': _i1.ParameterDescription(
              name: 'nocId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i40.NocStatus>(),
              nullable: false,
            ),
            'notes': _i1.ParameterDescription(
              name: 'notes',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['tenancy'] as _i19.TenancyEndpoint).resolveNoc(
                    session,
                    nocId: params['nocId'],
                    status: params['status'],
                    notes: params['notes'],
                  ),
        ),
      },
    );
    connectors['visitor'] = _i1.EndpointConnector(
      name: 'visitor',
      endpoint: endpoints['visitor']!,
      methodConnectors: {
        'getVisitors': _i1.MethodConnector(
          name: 'getVisitors',
          params: {
            'flatNumber': _i1.ParameterDescription(
              name: 'flatNumber',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i41.VisitorStatus?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['visitor'] as _i20.VisitorEndpoint).getVisitors(
                    session,
                    flatNumber: params['flatNumber'],
                    status: params['status'],
                  ),
        ),
        'createVisitorEntry': _i1.MethodConnector(
          name: 'createVisitorEntry',
          params: {
            'entry': _i1.ParameterDescription(
              name: 'entry',
              type: _i1.getType<_i42.VisitorEntry>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['visitor'] as _i20.VisitorEndpoint)
                  .createVisitorEntry(
                    session,
                    params['entry'],
                  ),
        ),
        'updateVisitorStatus': _i1.MethodConnector(
          name: 'updateVisitorStatus',
          params: {
            'visitorId': _i1.ParameterDescription(
              name: 'visitorId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i41.VisitorStatus>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['visitor'] as _i20.VisitorEndpoint)
                  .updateVisitorStatus(
                    session,
                    params['visitorId'],
                    params['status'],
                  ),
        ),
        'verifyVisitorPasscode': _i1.MethodConnector(
          name: 'verifyVisitorPasscode',
          params: {
            'passcode': _i1.ParameterDescription(
              name: 'passcode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['visitor'] as _i20.VisitorEndpoint)
                  .verifyVisitorPasscode(
                    session,
                    params['passcode'],
                  ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _i43.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _i44.Endpoints()
      ..initializeEndpoints(server);
  }
}
