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
import '../auth/email_idp_endpoint.dart' as _i3;
import '../auth/jwt_refresh_endpoint.dart' as _i4;
import '../communication/communication_endpoint.dart' as _i5;
import '../core/society_endpoint.dart' as _i6;
import '../greetings/greeting_endpoint.dart' as _i7;
import '../maintenance/maintenance_endpoint.dart' as _i8;
import '../visitor/visitor_endpoint.dart' as _i9;
import 'package:society_server/src/generated/accounting/models/voucher_status.dart'
    as _i10;
import 'package:society_server/src/generated/accounting/models/voucher_request.dart'
    as _i11;
import 'package:society_server/src/generated/communication/models/notice.dart'
    as _i12;
import 'package:society_server/src/generated/communication/models/complaint.dart'
    as _i13;
import 'package:society_server/src/generated/communication/models/complaint_status.dart'
    as _i14;
import 'package:society_server/src/generated/core/models/society.dart' as _i15;
import 'package:society_server/src/generated/core/models/flat.dart' as _i16;
import 'package:society_server/src/generated/core/models/society_user.dart'
    as _i17;
import 'package:society_server/src/generated/maintenance/models/maintenance_bill.dart'
    as _i18;
import 'package:society_server/src/generated/maintenance/models/payment_record.dart'
    as _i19;
import 'package:society_server/src/generated/visitor/models/visitor_status.dart'
    as _i20;
import 'package:society_server/src/generated/visitor/models/visitor_entry.dart'
    as _i21;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i22;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i23;

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
      'emailIdp': _i3.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _i4.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'communication': _i5.CommunicationEndpoint()
        ..initialize(
          server,
          'communication',
          null,
        ),
      'society': _i6.SocietyEndpoint()
        ..initialize(
          server,
          'society',
          null,
        ),
      'greeting': _i7.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
      'maintenance': _i8.MaintenanceEndpoint()
        ..initialize(
          server,
          'maintenance',
          null,
        ),
      'visitor': _i9.VisitorEndpoint()
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
              type: _i1.getType<_i10.VoucherStatus?>(),
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
              type: _i1.getType<_i11.VoucherRequest>(),
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
              ) async => (endpoints['emailIdp'] as _i3.EmailIdpEndpoint).login(
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
              ) async => (endpoints['emailIdp'] as _i3.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i3.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i3.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i3.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i3.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i3.EmailIdpEndpoint)
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
              ) async => (endpoints['emailIdp'] as _i3.EmailIdpEndpoint)
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
              ) async => (endpoints['jwtRefresh'] as _i4.JwtRefreshEndpoint)
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
                  (endpoints['communication'] as _i5.CommunicationEndpoint)
                      .getNotices(
                        session,
                        params['societyId'],
                      ),
        ),
        'createNotice': _i1.MethodConnector(
          name: 'createNotice',
          params: {
            'notice': _i1.ParameterDescription(
              name: 'notice',
              type: _i1.getType<_i12.Notice>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['communication'] as _i5.CommunicationEndpoint)
                      .createNotice(
                        session,
                        params['notice'],
                      ),
        ),
        'getComplaints': _i1.MethodConnector(
          name: 'getComplaints',
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
              ) async =>
                  (endpoints['communication'] as _i5.CommunicationEndpoint)
                      .getComplaints(
                        session,
                        params['societyId'],
                        flatNumber: params['flatNumber'],
                      ),
        ),
        'createComplaint': _i1.MethodConnector(
          name: 'createComplaint',
          params: {
            'complaint': _i1.ParameterDescription(
              name: 'complaint',
              type: _i1.getType<_i13.Complaint>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['communication'] as _i5.CommunicationEndpoint)
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
              type: _i1.getType<_i14.ComplaintStatus>(),
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
                  (endpoints['communication'] as _i5.CommunicationEndpoint)
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
              type: _i1.getType<_i15.Society>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['society'] as _i6.SocietyEndpoint).createSociety(
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
              ) async => (endpoints['society'] as _i6.SocietyEndpoint)
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
                  (endpoints['society'] as _i6.SocietyEndpoint).getSocietyById(
                    session,
                    params['id'],
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
              ) async => (endpoints['society'] as _i6.SocietyEndpoint).getFlats(
                session,
                params['societyId'],
              ),
        ),
        'createFlat': _i1.MethodConnector(
          name: 'createFlat',
          params: {
            'flat': _i1.ParameterDescription(
              name: 'flat',
              type: _i1.getType<_i16.Flat>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['society'] as _i6.SocietyEndpoint).createFlat(
                    session,
                    params['flat'],
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
                  (endpoints['society'] as _i6.SocietyEndpoint).getSocietyUsers(
                    session,
                    params['societyId'],
                  ),
        ),
        'createSocietyUser': _i1.MethodConnector(
          name: 'createSocietyUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i17.SocietyUser>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['society'] as _i6.SocietyEndpoint)
                  .createSocietyUser(
                    session,
                    params['user'],
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
              ) async => (endpoints['greeting'] as _i7.GreetingEndpoint).hello(
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
              ) async => (endpoints['maintenance'] as _i8.MaintenanceEndpoint)
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
              type: _i1.getType<_i18.MaintenanceBill>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['maintenance'] as _i8.MaintenanceEndpoint)
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
              type: _i1.getType<_i19.PaymentRecord>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['maintenance'] as _i8.MaintenanceEndpoint)
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
              ) async => (endpoints['maintenance'] as _i8.MaintenanceEndpoint)
                  .getPayments(
                    session,
                    params['societyId'],
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
            'societyId': _i1.ParameterDescription(
              name: 'societyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'complexId': _i1.ParameterDescription(
              name: 'complexId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'flatNumber': _i1.ParameterDescription(
              name: 'flatNumber',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i20.VisitorStatus?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['visitor'] as _i9.VisitorEndpoint).getVisitors(
                    session,
                    params['societyId'],
                    complexId: params['complexId'],
                    flatNumber: params['flatNumber'],
                    status: params['status'],
                  ),
        ),
        'createVisitorEntry': _i1.MethodConnector(
          name: 'createVisitorEntry',
          params: {
            'entry': _i1.ParameterDescription(
              name: 'entry',
              type: _i1.getType<_i21.VisitorEntry>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['visitor'] as _i9.VisitorEndpoint)
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
              type: _i1.getType<_i20.VisitorStatus>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['visitor'] as _i9.VisitorEndpoint)
                  .updateVisitorStatus(
                    session,
                    params['visitorId'],
                    params['status'],
                  ),
        ),
        'verifyVisitorPasscode': _i1.MethodConnector(
          name: 'verifyVisitorPasscode',
          params: {
            'societyId': _i1.ParameterDescription(
              name: 'societyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
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
              ) async => (endpoints['visitor'] as _i9.VisitorEndpoint)
                  .verifyVisitorPasscode(
                    session,
                    params['societyId'],
                    params['passcode'],
                  ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _i22.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _i23.Endpoints()
      ..initializeEndpoints(server);
  }
}
