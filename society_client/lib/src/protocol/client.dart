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
import 'dart:async' as _i2;
import 'package:society_client/src/protocol/accounting/models/voucher_request.dart'
    as _i3;
import 'package:society_client/src/protocol/accounting/models/voucher_status.dart'
    as _i4;
import 'package:society_client/src/protocol/accounting/models/ledger_entry.dart'
    as _i5;
import 'package:society_client/src/protocol/accounting/models/ledger_account.dart'
    as _i6;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i7;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i8;
import 'package:society_client/src/protocol/communication/models/notice.dart'
    as _i9;
import 'package:society_client/src/protocol/communication/models/complaint.dart'
    as _i10;
import 'package:society_client/src/protocol/communication/models/complaint_status.dart'
    as _i11;
import 'package:society_client/src/protocol/core/models/society.dart' as _i12;
import 'package:society_client/src/protocol/core/models/building.dart' as _i13;
import 'package:society_client/src/protocol/core/models/flat.dart' as _i14;
import 'package:society_client/src/protocol/core/models/society_user.dart'
    as _i15;
import 'package:society_client/src/protocol/core/models/society_invitation.dart'
    as _i16;
import 'package:society_client/src/protocol/documents/models/society_document.dart'
    as _i17;
import 'package:society_client/src/protocol/documents/models/meeting_minutes.dart'
    as _i18;
import 'package:society_client/src/protocol/emergency/models/sos_alert.dart'
    as _i19;
import 'package:society_client/src/protocol/greetings/greeting.dart' as _i20;
import 'package:society_client/src/protocol/maintenance/models/maintenance_bill.dart'
    as _i21;
import 'package:society_client/src/protocol/maintenance/models/payment_record.dart'
    as _i22;
import 'package:society_client/src/protocol/polling/models/society_poll.dart'
    as _i23;
import 'package:society_client/src/protocol/polling/models/poll_status.dart'
    as _i24;
import 'package:society_client/src/protocol/polling/models/poll_option.dart'
    as _i25;
import 'package:society_client/src/protocol/saas_admin/models/saas_metric_summary.dart'
    as _i26;
import 'package:society_client/src/protocol/saas_admin/models/society_subscription.dart'
    as _i27;
import 'package:society_client/src/protocol/visitor/models/visitor_entry.dart'
    as _i28;
import 'package:society_client/src/protocol/visitor/models/visitor_status.dart'
    as _i29;
import 'protocol.dart' as _i30;

/// {@category Endpoint}
class EndpointAccounting extends _i1.EndpointRef {
  EndpointAccounting(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'accounting';

  /// Get vouchers for a society with optional status filter
  _i2.Future<List<_i3.VoucherRequest>> getVouchers(
    int societyId, {
    _i4.VoucherStatus? status,
  }) => caller.callServerEndpoint<List<_i3.VoucherRequest>>(
    'accounting',
    'getVouchers',
    {
      'societyId': societyId,
      'status': status,
    },
  );

  /// Committee member creates a voucher expense request
  _i2.Future<_i3.VoucherRequest> createVoucherRequest(
    _i3.VoucherRequest request,
  ) => caller.callServerEndpoint<_i3.VoucherRequest>(
    'accounting',
    'createVoucherRequest',
    {'request': request},
  );

  /// Chairman approves voucher request
  _i2.Future<_i3.VoucherRequest?> approveVoucher(
    int voucherId,
    String approvedByName,
  ) => caller.callServerEndpoint<_i3.VoucherRequest?>(
    'accounting',
    'approveVoucher',
    {
      'voucherId': voucherId,
      'approvedByName': approvedByName,
    },
  );

  /// Chairman rejects voucher request
  _i2.Future<_i3.VoucherRequest?> rejectVoucher(
    int voucherId,
    String reason,
  ) => caller.callServerEndpoint<_i3.VoucherRequest?>(
    'accounting',
    'rejectVoucher',
    {
      'voucherId': voucherId,
      'reason': reason,
    },
  );

  /// Accountant-only action: Post approved voucher into the double-entry financial ledger
  _i2.Future<_i5.LedgerEntry> postVoucherToLedger(
    int voucherId,
    String postedByName,
    String description,
    double debit,
    double credit,
  ) => caller.callServerEndpoint<_i5.LedgerEntry>(
    'accounting',
    'postVoucherToLedger',
    {
      'voucherId': voucherId,
      'postedByName': postedByName,
      'description': description,
      'debit': debit,
      'credit': credit,
    },
  );

  /// Fetch financial ledger entries
  _i2.Future<List<_i5.LedgerEntry>> getLedgerEntries(int societyId) =>
      caller.callServerEndpoint<List<_i5.LedgerEntry>>(
        'accounting',
        'getLedgerEntries',
        {'societyId': societyId},
      );

  /// Fetch chart of accounts
  _i2.Future<List<_i6.LedgerAccount>> getLedgerAccounts(int societyId) =>
      caller.callServerEndpoint<List<_i6.LedgerAccount>>(
        'accounting',
        'getLedgerAccounts',
        {'societyId': societyId},
      );
}

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
/// {@category Endpoint}
class EndpointEmailIdp extends _i7.EndpointEmailIdpBase {
  EndpointEmailIdp(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  /// Logs in the user and returns a new session.
  ///
  /// Throws an [EmailAccountLoginException] in case of errors, with reason:
  /// - [EmailAccountLoginExceptionReason.invalidCredentials] if the email or
  ///   password is incorrect.
  /// - [EmailAccountLoginExceptionReason.tooManyAttempts] if there have been
  ///   too many failed login attempts.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i2.Future<_i8.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_i8.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Starts the registration for a new user account with an email-based login
  /// associated to it.
  ///
  /// Upon successful completion of this method, an email will have been
  /// sent to [email] with a verification link, which the user must open to
  /// complete the registration.
  ///
  /// Always returns a account request ID, which can be used to complete the
  /// registration. If the email is already registered, the returned ID will not
  /// be valid.
  @override
  _i2.Future<_i1.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_i1.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  /// Verifies an account request code and returns a token
  /// that can be used to complete the account creation.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists
  ///   for the given [accountRequestId] or [verificationCode] is invalid.
  @override
  _i2.Future<String> verifyRegistrationCode({
    required _i1.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a new account registration, creating a new auth user with a
  /// profile and attaching the given email account to it.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [registrationToken]
  ///   is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  ///
  /// Returns a session for the newly created user.
  @override
  _i2.Future<_i8.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_i8.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _i2.Future<_i1.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_i1.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _i2.Future<String> verifyPasswordResetCode({
    required _i1.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i2.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );

  @override
  _i2.Future<bool> hasAccount() => caller.callServerEndpoint<bool>(
    'emailIdp',
    'hasAccount',
    {},
  );
}

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
/// {@category Endpoint}
class EndpointJwtRefresh extends _i8.EndpointRefreshJwtTokens {
  EndpointJwtRefresh(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jwtRefresh';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _i2.Future<_i8.AuthSuccess> refreshAccessToken({
    required String refreshToken,
  }) => caller.callServerEndpoint<_i8.AuthSuccess>(
    'jwtRefresh',
    'refreshAccessToken',
    {'refreshToken': refreshToken},
    authenticated: false,
  );
}

/// {@category Endpoint}
class EndpointCommunication extends _i1.EndpointRef {
  EndpointCommunication(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'communication';

  /// Get notices for a society
  _i2.Future<List<_i9.Notice>> getNotices(int societyId) =>
      caller.callServerEndpoint<List<_i9.Notice>>(
        'communication',
        'getNotices',
        {'societyId': societyId},
      );

  /// Publish a new notice
  _i2.Future<_i9.Notice> createNotice(_i9.Notice notice) =>
      caller.callServerEndpoint<_i9.Notice>(
        'communication',
        'createNotice',
        {'notice': notice},
      );

  /// Get complaints, optionally filtered by flat
  _i2.Future<List<_i10.Complaint>> getComplaints(
    int societyId, {
    String? flatNumber,
  }) => caller.callServerEndpoint<List<_i10.Complaint>>(
    'communication',
    'getComplaints',
    {
      'societyId': societyId,
      'flatNumber': flatNumber,
    },
  );

  /// Raise a new complaint
  _i2.Future<_i10.Complaint> createComplaint(_i10.Complaint complaint) =>
      caller.callServerEndpoint<_i10.Complaint>(
        'communication',
        'createComplaint',
        {'complaint': complaint},
      );

  /// Update complaint status and resolution notes
  _i2.Future<_i10.Complaint?> updateComplaintStatus(
    int complaintId,
    _i11.ComplaintStatus status,
    String? resolutionNotes,
  ) => caller.callServerEndpoint<_i10.Complaint?>(
    'communication',
    'updateComplaintStatus',
    {
      'complaintId': complaintId,
      'status': status,
      'resolutionNotes': resolutionNotes,
    },
  );
}

/// {@category Endpoint}
class EndpointSociety extends _i1.EndpointRef {
  EndpointSociety(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'society';

  /// Create a new society on the SaaS platform
  _i2.Future<_i12.Society> createSociety(_i12.Society society) =>
      caller.callServerEndpoint<_i12.Society>(
        'society',
        'createSociety',
        {'society': society},
      );

  /// List all societies
  _i2.Future<List<_i12.Society>> getSocieties() =>
      caller.callServerEndpoint<List<_i12.Society>>(
        'society',
        'getSocieties',
        {},
      );

  /// Get a single society by ID
  _i2.Future<_i12.Society?> getSocietyById(int id) =>
      caller.callServerEndpoint<_i12.Society?>(
        'society',
        'getSocietyById',
        {'id': id},
      );

  /// Onboard a new customer society with subscription and primary Society Admin
  _i2.Future<_i12.Society> onboardNewSocietyWithAdmin(
    _i12.Society society,
    String adminName,
    String adminPhone,
    String adminEmail,
    String planName,
  ) => caller.callServerEndpoint<_i12.Society>(
    'society',
    'onboardNewSocietyWithAdmin',
    {
      'society': society,
      'adminName': adminName,
      'adminPhone': adminPhone,
      'adminEmail': adminEmail,
      'planName': planName,
    },
  );

  /// Get buildings for a society
  _i2.Future<List<_i13.Building>> getBuildings(int societyId) =>
      caller.callServerEndpoint<List<_i13.Building>>(
        'society',
        'getBuildings',
        {'societyId': societyId},
      );

  /// Create a building
  _i2.Future<_i13.Building> createBuilding(_i13.Building building) =>
      caller.callServerEndpoint<_i13.Building>(
        'society',
        'createBuilding',
        {'building': building},
      );

  /// Get flats for a given society
  _i2.Future<List<_i14.Flat>> getFlats(int societyId) =>
      caller.callServerEndpoint<List<_i14.Flat>>(
        'society',
        'getFlats',
        {'societyId': societyId},
      );

  /// Add a flat to a society
  _i2.Future<_i14.Flat> createFlat(_i14.Flat flat) =>
      caller.callServerEndpoint<_i14.Flat>(
        'society',
        'createFlat',
        {'flat': flat},
      );

  /// Bulk add flats to a society
  _i2.Future<List<_i14.Flat>> bulkCreateFlats(List<_i14.Flat> flats) =>
      caller.callServerEndpoint<List<_i14.Flat>>(
        'society',
        'bulkCreateFlats',
        {'flats': flats},
      );

  /// Get society users/members
  _i2.Future<List<_i15.SocietyUser>> getSocietyUsers(int societyId) =>
      caller.callServerEndpoint<List<_i15.SocietyUser>>(
        'society',
        'getSocietyUsers',
        {'societyId': societyId},
      );

  /// Register/Add a society user
  _i2.Future<_i15.SocietyUser> createSocietyUser(_i15.SocietyUser user) =>
      caller.callServerEndpoint<_i15.SocietyUser>(
        'society',
        'createSocietyUser',
        {'user': user},
      );

  /// Create a member invitation
  _i2.Future<_i16.SocietyInvitation> createInvitation(
    _i16.SocietyInvitation invitation,
  ) => caller.callServerEndpoint<_i16.SocietyInvitation>(
    'society',
    'createInvitation',
    {'invitation': invitation},
  );

  /// Bulk create invitations (e.g. from Excel/CSV import)
  _i2.Future<List<_i16.SocietyInvitation>> bulkCreateInvitations(
    List<_i16.SocietyInvitation> invitations,
  ) => caller.callServerEndpoint<List<_i16.SocietyInvitation>>(
    'society',
    'bulkCreateInvitations',
    {'invitations': invitations},
  );

  /// List invitations for a society
  _i2.Future<List<_i16.SocietyInvitation>> getInvitations(int societyId) =>
      caller.callServerEndpoint<List<_i16.SocietyInvitation>>(
        'society',
        'getInvitations',
        {'societyId': societyId},
      );

  /// Verify and accept an invitation by invite code
  _i2.Future<_i15.SocietyUser?> verifyAndAcceptInvitation(
    String inviteCode,
    String phone,
  ) => caller.callServerEndpoint<_i15.SocietyUser?>(
    'society',
    'verifyAndAcceptInvitation',
    {
      'inviteCode': inviteCode,
      'phone': phone,
    },
  );

  /// Login with phone number for Society Admin, Staff, or Resident
  _i2.Future<_i15.SocietyUser?> loginWithPhone(String phone) =>
      caller.callServerEndpoint<_i15.SocietyUser?>(
        'society',
        'loginWithPhone',
        {'phone': phone},
      );
}

/// {@category Endpoint}
class EndpointDocument extends _i1.EndpointRef {
  EndpointDocument(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'document';

  /// Fetch all society documents
  _i2.Future<List<_i17.SocietyDocument>> getDocuments(
    int societyId, {
    required bool includeCommitteeOnly,
  }) => caller.callServerEndpoint<List<_i17.SocietyDocument>>(
    'document',
    'getDocuments',
    {
      'societyId': societyId,
      'includeCommitteeOnly': includeCommitteeOnly,
    },
  );

  /// Upload a document (bye-laws, audit reports, insurance, etc.)
  _i2.Future<_i17.SocietyDocument> uploadDocument(_i17.SocietyDocument doc) =>
      caller.callServerEndpoint<_i17.SocietyDocument>(
        'document',
        'uploadDocument',
        {'doc': doc},
      );

  /// Fetch meeting minutes (AGM / EGM / Managing Committee)
  _i2.Future<List<_i18.MeetingMinutes>> getMeetingMinutes(int societyId) =>
      caller.callServerEndpoint<List<_i18.MeetingMinutes>>(
        'document',
        'getMeetingMinutes',
        {'societyId': societyId},
      );

  /// Record new meeting minutes
  _i2.Future<_i18.MeetingMinutes> recordMeetingMinutes(
    _i18.MeetingMinutes minutes,
  ) => caller.callServerEndpoint<_i18.MeetingMinutes>(
    'document',
    'recordMeetingMinutes',
    {'minutes': minutes},
  );
}

/// {@category Endpoint}
class EndpointSos extends _i1.EndpointRef {
  EndpointSos(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'sos';

  /// Trigger an immediate Emergency SOS Alert
  _i2.Future<_i19.SosAlert> raiseSosAlert(_i19.SosAlert alert) =>
      caller.callServerEndpoint<_i19.SosAlert>(
        'sos',
        'raiseSosAlert',
        {'alert': alert},
      );

  /// Get active / un-resolved emergency alerts for guards & chairman
  _i2.Future<List<_i19.SosAlert>> getActiveSosAlerts(int societyId) =>
      caller.callServerEndpoint<List<_i19.SosAlert>>(
        'sos',
        'getActiveSosAlerts',
        {'societyId': societyId},
      );

  /// Guard acknowledges emergency and dispatches help
  _i2.Future<_i19.SosAlert?> acknowledgeSos(
    int alertId,
    String acknowledgedByName,
  ) => caller.callServerEndpoint<_i19.SosAlert?>(
    'sos',
    'acknowledgeSos',
    {
      'alertId': alertId,
      'acknowledgedByName': acknowledgedByName,
    },
  );

  /// Resolve emergency after situation is safe
  _i2.Future<_i19.SosAlert?> resolveSos(
    int alertId,
    String resolvedByName,
    String resolutionNotes,
  ) => caller.callServerEndpoint<_i19.SosAlert?>(
    'sos',
    'resolveSos',
    {
      'alertId': alertId,
      'resolvedByName': resolvedByName,
      'resolutionNotes': resolutionNotes,
    },
  );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i1.EndpointRef {
  EndpointGreeting(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i2.Future<_i20.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i20.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointMaintenance extends _i1.EndpointRef {
  EndpointMaintenance(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'maintenance';

  /// Get all maintenance bills for a society, optionally filtered by flat
  _i2.Future<List<_i21.MaintenanceBill>> getBills(
    int societyId, {
    String? flatNumber,
  }) => caller.callServerEndpoint<List<_i21.MaintenanceBill>>(
    'maintenance',
    'getBills',
    {
      'societyId': societyId,
      'flatNumber': flatNumber,
    },
  );

  /// Generate/Create a maintenance bill
  _i2.Future<_i21.MaintenanceBill> createBill(_i21.MaintenanceBill bill) =>
      caller.callServerEndpoint<_i21.MaintenanceBill>(
        'maintenance',
        'createBill',
        {'bill': bill},
      );

  /// Record a payment against maintenance & auto-reconcile to General Ledger
  _i2.Future<_i22.PaymentRecord> recordPayment(_i22.PaymentRecord payment) =>
      caller.callServerEndpoint<_i22.PaymentRecord>(
        'maintenance',
        'recordPayment',
        {'payment': payment},
      );

  /// Get payment history for a society
  _i2.Future<List<_i22.PaymentRecord>> getPayments(int societyId) =>
      caller.callServerEndpoint<List<_i22.PaymentRecord>>(
        'maintenance',
        'getPayments',
        {'societyId': societyId},
      );
}

/// {@category Endpoint}
class EndpointPoll extends _i1.EndpointRef {
  EndpointPoll(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'poll';

  /// Fetch polls with optional active/closed filter
  _i2.Future<List<_i23.SocietyPoll>> getPolls(
    int societyId, {
    _i24.PollStatus? status,
  }) => caller.callServerEndpoint<List<_i23.SocietyPoll>>(
    'poll',
    'getPolls',
    {
      'societyId': societyId,
      'status': status,
    },
  );

  /// Get options for a specific poll
  _i2.Future<List<_i25.PollOption>> getPollOptions(int pollId) =>
      caller.callServerEndpoint<List<_i25.PollOption>>(
        'poll',
        'getPollOptions',
        {'pollId': pollId},
      );

  /// Chairman / Committee creates a new poll with options
  _i2.Future<_i23.SocietyPoll> createPoll(
    _i23.SocietyPoll poll,
    List<String> options,
  ) => caller.callServerEndpoint<_i23.SocietyPoll>(
    'poll',
    'createPoll',
    {
      'poll': poll,
      'options': options,
    },
  );

  /// Resident casts vote (enforces 1 Flat = 1 Vote rule!)
  _i2.Future<bool> castVote(
    int pollId,
    String flatNumber,
    String voterName,
    int optionId,
  ) => caller.callServerEndpoint<bool>(
    'poll',
    'castVote',
    {
      'pollId': pollId,
      'flatNumber': flatNumber,
      'voterName': voterName,
      'optionId': optionId,
    },
  );
}

/// {@category Endpoint}
class EndpointSaasAdmin extends _i1.EndpointRef {
  EndpointSaasAdmin(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'saasAdmin';

  /// Fetch high-level SaaS platform metrics
  _i2.Future<_i26.SaasMetricSummary> getMetricSummary() =>
      caller.callServerEndpoint<_i26.SaasMetricSummary>(
        'saasAdmin',
        'getMetricSummary',
        {},
      );

  /// List all client society subscriptions
  _i2.Future<List<_i27.SocietySubscription>> getAllSubscriptions() =>
      caller.callServerEndpoint<List<_i27.SocietySubscription>>(
        'saasAdmin',
        'getAllSubscriptions',
        {},
      );

  /// Register new society subscription
  _i2.Future<_i27.SocietySubscription> createSubscription(
    _i27.SocietySubscription sub,
  ) => caller.callServerEndpoint<_i27.SocietySubscription>(
    'saasAdmin',
    'createSubscription',
    {'sub': sub},
  );

  /// Update subscription status (active, past_due, suspended)
  _i2.Future<_i27.SocietySubscription?> updateSubscriptionStatus(
    int subscriptionId,
    String status,
  ) => caller.callServerEndpoint<_i27.SocietySubscription?>(
    'saasAdmin',
    'updateSubscriptionStatus',
    {
      'subscriptionId': subscriptionId,
      'status': status,
    },
  );
}

/// {@category Endpoint}
class EndpointVisitor extends _i1.EndpointRef {
  EndpointVisitor(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'visitor';

  /// Get visitors for a society or complex
  _i2.Future<List<_i28.VisitorEntry>> getVisitors(
    int societyId, {
    int? complexId,
    String? flatNumber,
    _i29.VisitorStatus? status,
  }) => caller.callServerEndpoint<List<_i28.VisitorEntry>>(
    'visitor',
    'getVisitors',
    {
      'societyId': societyId,
      'complexId': complexId,
      'flatNumber': flatNumber,
      'status': status,
    },
  );

  /// Create visitor entry (can be pre-approved by resident or added by guard)
  _i2.Future<_i28.VisitorEntry> createVisitorEntry(_i28.VisitorEntry entry) =>
      caller.callServerEndpoint<_i28.VisitorEntry>(
        'visitor',
        'createVisitorEntry',
        {'entry': entry},
      );

  /// Update visitor status (e.g., approved by resident, marked inside/exited by guard)
  _i2.Future<_i28.VisitorEntry?> updateVisitorStatus(
    int visitorId,
    _i29.VisitorStatus status,
  ) => caller.callServerEndpoint<_i28.VisitorEntry?>(
    'visitor',
    'updateVisitorStatus',
    {
      'visitorId': visitorId,
      'status': status,
    },
  );

  /// Verify visitor passcode at the gate
  _i2.Future<_i28.VisitorEntry?> verifyVisitorPasscode(
    int societyId,
    String passcode,
  ) => caller.callServerEndpoint<_i28.VisitorEntry?>(
    'visitor',
    'verifyVisitorPasscode',
    {
      'societyId': societyId,
      'passcode': passcode,
    },
  );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _i7.Caller(client);
    serverpod_auth_core = _i8.Caller(client);
  }

  late final _i7.Caller serverpod_auth_idp;

  late final _i8.Caller serverpod_auth_core;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    @Deprecated(
      'Use authKeyProvider instead. This will be removed in future releases.',
    )
    super.authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
         host,
         _i30.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    accounting = EndpointAccounting(this);
    emailIdp = EndpointEmailIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    communication = EndpointCommunication(this);
    society = EndpointSociety(this);
    document = EndpointDocument(this);
    sos = EndpointSos(this);
    greeting = EndpointGreeting(this);
    maintenance = EndpointMaintenance(this);
    poll = EndpointPoll(this);
    saasAdmin = EndpointSaasAdmin(this);
    visitor = EndpointVisitor(this);
    modules = Modules(this);
  }

  late final EndpointAccounting accounting;

  late final EndpointEmailIdp emailIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final EndpointCommunication communication;

  late final EndpointSociety society;

  late final EndpointDocument document;

  late final EndpointSos sos;

  late final EndpointGreeting greeting;

  late final EndpointMaintenance maintenance;

  late final EndpointPoll poll;

  late final EndpointSaasAdmin saasAdmin;

  late final EndpointVisitor visitor;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
    'accounting': accounting,
    'emailIdp': emailIdp,
    'jwtRefresh': jwtRefresh,
    'communication': communication,
    'society': society,
    'document': document,
    'sos': sos,
    'greeting': greeting,
    'maintenance': maintenance,
    'poll': poll,
    'saasAdmin': saasAdmin,
    'visitor': visitor,
  };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}
