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
import 'package:society_client/src/protocol/amenity/models/amenity.dart' as _i7;
import 'package:society_client/src/protocol/amenity/models/amenity_booking.dart'
    as _i8;
import 'package:society_client/src/protocol/audit/models/audit_log.dart' as _i9;
import 'package:society_client/src/protocol/audit/models/audit_category.dart'
    as _i10;
import 'package:society_client/src/protocol/auth/models/otp_send_result.dart'
    as _i11;
import 'package:society_client/src/protocol/auth/models/auth_response.dart'
    as _i12;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i13;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i14;
import 'package:society_client/src/protocol/communication/models/notice.dart'
    as _i15;
import 'package:society_client/src/protocol/communication/models/complaint.dart'
    as _i16;
import 'package:society_client/src/protocol/communication/models/complaint_status.dart'
    as _i17;
import 'package:society_client/src/protocol/core/models/society.dart' as _i18;
import 'package:society_client/src/protocol/core/models/building.dart' as _i19;
import 'package:society_client/src/protocol/core/models/flat.dart' as _i20;
import 'package:society_client/src/protocol/core/models/society_user.dart'
    as _i21;
import 'package:society_client/src/protocol/core/models/society_invitation.dart'
    as _i22;
import 'package:society_client/src/protocol/documents/models/society_document.dart'
    as _i23;
import 'package:society_client/src/protocol/documents/models/document_category.dart'
    as _i24;
import 'package:society_client/src/protocol/documents/models/upload_description_response.dart'
    as _i25;
import 'package:society_client/src/protocol/documents/models/meeting_minutes.dart'
    as _i26;
import 'package:society_client/src/protocol/emergency/models/sos_alert.dart'
    as _i27;
import 'package:society_client/src/protocol/greetings/greeting.dart' as _i28;
import 'package:society_client/src/protocol/maintenance/models/maintenance_bill.dart'
    as _i29;
import 'package:society_client/src/protocol/maintenance/models/payment_record.dart'
    as _i30;
import 'package:society_client/src/protocol/payment/models/payment_order.dart'
    as _i31;
import 'package:society_client/src/protocol/payment/models/payment_verification_result.dart'
    as _i32;
import 'package:society_client/src/protocol/payment/models/webhook_result.dart'
    as _i33;
import 'package:society_client/src/protocol/polling/models/society_poll.dart'
    as _i34;
import 'package:society_client/src/protocol/polling/models/poll_status.dart'
    as _i35;
import 'package:society_client/src/protocol/polling/models/poll_option.dart'
    as _i36;
import 'package:society_client/src/protocol/realtime/models/gate_bell_event.dart'
    as _i37;
import 'package:society_client/src/protocol/realtime/models/sos_alert_event.dart'
    as _i38;
import 'package:society_client/src/protocol/saas_admin/models/saas_metric_summary.dart'
    as _i39;
import 'package:society_client/src/protocol/saas_admin/models/society_subscription.dart'
    as _i40;
import 'package:society_client/src/protocol/tenancy/models/tenant_noc.dart'
    as _i41;
import 'package:society_client/src/protocol/tenancy/models/noc_status.dart'
    as _i42;
import 'package:society_client/src/protocol/visitor/models/visitor_entry.dart'
    as _i43;
import 'package:society_client/src/protocol/visitor/models/visitor_status.dart'
    as _i44;
import 'protocol.dart' as _i45;

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

/// {@category Endpoint}
class EndpointAmenity extends _i1.EndpointRef {
  EndpointAmenity(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'amenity';

  /// List all active amenities for the authenticated user's society (paginated).
  _i2.Future<List<_i7.Amenity>> getAmenities({
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_i7.Amenity>>(
    'amenity',
    'getAmenities',
    {
      'limit': limit,
      'offset': offset,
    },
  );

  /// List amenity bookings for the authenticated user's society (paginated).
  _i2.Future<List<_i8.AmenityBooking>> getBookings({
    DateTime? date,
    int? amenityId,
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_i8.AmenityBooking>>(
    'amenity',
    'getBookings',
    {
      'date': date,
      'amenityId': amenityId,
      'limit': limit,
      'offset': offset,
    },
  );

  /// Book an amenity slot. Wrapped in a transaction to prevent double-booking.
  /// Generates a server-side audit log entry automatically.
  _i2.Future<_i8.AmenityBooking> bookSlot({
    required int amenityId,
    required DateTime date,
    required String slot,
  }) => caller.callServerEndpoint<_i8.AmenityBooking>(
    'amenity',
    'bookSlot',
    {
      'amenityId': amenityId,
      'date': date,
      'slot': slot,
    },
  );

  /// Cancel an existing booking. Checks ownership/permissions and writes audit log.
  _i2.Future<_i8.AmenityBooking> cancelBooking({required int bookingId}) =>
      caller.callServerEndpoint<_i8.AmenityBooking>(
        'amenity',
        'cancelBooking',
        {'bookingId': bookingId},
      );
}

/// {@category Endpoint}
class EndpointAudit extends _i1.EndpointRef {
  EndpointAudit(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'audit';

  /// Fetch immutable audit logs for the authenticated society (paginated).
  _i2.Future<List<_i9.AuditLog>> getAuditLogs({
    _i10.AuditCategory? category,
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_i9.AuditLog>>(
    'audit',
    'getAuditLogs',
    {
      'category': category,
      'limit': limit,
      'offset': offset,
    },
  );

  /// Explicit event logging by authorized users. Actor details and societyId are
  /// verified and enforced from the authenticated session.
  _i2.Future<_i9.AuditLog> logEvent({
    required _i10.AuditCategory category,
    required String action,
    required String target,
    required String description,
  }) => caller.callServerEndpoint<_i9.AuditLog>(
    'audit',
    'logEvent',
    {
      'category': category,
      'action': action,
      'target': target,
      'description': description,
    },
  );
}

/// Secure SMS OTP Authentication Endpoint
/// {@category Endpoint}
class EndpointAuth extends _i1.EndpointRef {
  EndpointAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  /// Request a 6-digit SMS OTP verification code.
  /// Enforces:
  /// - 5-minute expiry
  /// - 60-second resend cooldown per phone
  /// - Max 10 requests per phone per 24 hours
  /// - Max 20 requests per IP per hour
  /// - Salted SHA-256 hash stored in PostgreSQL (never plaintext OTP)
  _i2.Future<_i11.OtpSendResult> sendOtp(String phone) =>
      caller.callServerEndpoint<_i11.OtpSendResult>(
        'auth',
        'sendOtp',
        {'phone': phone},
      );

  /// Verify OTP and return authenticated session tokens.
  /// Enforces:
  /// - 5-minute expiry
  /// - Max 5 attempts before permanent lockout
  /// - Constant-time comparison of salted hash
  /// - Issue Serverpod auth JWT session token
  _i2.Future<_i12.AuthResponse> verifyOtp(
    String phone,
    String otp,
  ) => caller.callServerEndpoint<_i12.AuthResponse>(
    'auth',
    'verifyOtp',
    {
      'phone': phone,
      'otp': otp,
    },
  );

  /// Sign out current device and revoke session tokens.
  _i2.Future<bool> signOut() => caller.callServerEndpoint<bool>(
    'auth',
    'signOut',
    {},
  );
}

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
/// {@category Endpoint}
class EndpointEmailIdp extends _i13.EndpointEmailIdpBase {
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
  _i2.Future<_i14.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_i14.AuthSuccess>(
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
  _i2.Future<_i14.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_i14.AuthSuccess>(
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
class EndpointJwtRefresh extends _i14.EndpointRefreshJwtTokens {
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
  _i2.Future<_i14.AuthSuccess> refreshAccessToken({
    required String refreshToken,
  }) => caller.callServerEndpoint<_i14.AuthSuccess>(
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

  /// Get notices for the authenticated user's society
  _i2.Future<List<_i15.Notice>> getNotices() =>
      caller.callServerEndpoint<List<_i15.Notice>>(
        'communication',
        'getNotices',
        {},
      );

  /// Publish a new notice and send normal-priority push notifications to residents
  _i2.Future<_i15.Notice> createNotice(_i15.Notice notice) =>
      caller.callServerEndpoint<_i15.Notice>(
        'communication',
        'createNotice',
        {'notice': notice},
      );

  /// Get complaints, optionally filtered by flat
  _i2.Future<List<_i16.Complaint>> getComplaints({String? flatNumber}) =>
      caller.callServerEndpoint<List<_i16.Complaint>>(
        'communication',
        'getComplaints',
        {'flatNumber': flatNumber},
      );

  /// Raise a new complaint
  _i2.Future<_i16.Complaint> createComplaint(_i16.Complaint complaint) =>
      caller.callServerEndpoint<_i16.Complaint>(
        'communication',
        'createComplaint',
        {'complaint': complaint},
      );

  /// Update complaint status and resolution notes
  _i2.Future<_i16.Complaint?> updateComplaintStatus(
    int complaintId,
    _i17.ComplaintStatus status,
    String? resolutionNotes,
  ) => caller.callServerEndpoint<_i16.Complaint?>(
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
  _i2.Future<_i18.Society> createSociety(_i18.Society society) =>
      caller.callServerEndpoint<_i18.Society>(
        'society',
        'createSociety',
        {'society': society},
      );

  /// List all societies
  _i2.Future<List<_i18.Society>> getSocieties() =>
      caller.callServerEndpoint<List<_i18.Society>>(
        'society',
        'getSocieties',
        {},
      );

  /// Get a single society by ID
  _i2.Future<_i18.Society?> getSocietyById(int id) =>
      caller.callServerEndpoint<_i18.Society?>(
        'society',
        'getSocietyById',
        {'id': id},
      );

  /// Onboard a new customer society with subscription and primary Society Admin
  _i2.Future<_i18.Society> onboardNewSocietyWithAdmin(
    _i18.Society society,
    String adminName,
    String adminPhone,
    String adminEmail,
    String planName,
  ) => caller.callServerEndpoint<_i18.Society>(
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
  _i2.Future<List<_i19.Building>> getBuildings(int societyId) =>
      caller.callServerEndpoint<List<_i19.Building>>(
        'society',
        'getBuildings',
        {'societyId': societyId},
      );

  /// Create a building
  _i2.Future<_i19.Building> createBuilding(_i19.Building building) =>
      caller.callServerEndpoint<_i19.Building>(
        'society',
        'createBuilding',
        {'building': building},
      );

  /// Get flats for a given society
  _i2.Future<List<_i20.Flat>> getFlats(int societyId) =>
      caller.callServerEndpoint<List<_i20.Flat>>(
        'society',
        'getFlats',
        {'societyId': societyId},
      );

  /// Add a flat to a society
  _i2.Future<_i20.Flat> createFlat(_i20.Flat flat) =>
      caller.callServerEndpoint<_i20.Flat>(
        'society',
        'createFlat',
        {'flat': flat},
      );

  /// Bulk add flats to a society
  _i2.Future<List<_i20.Flat>> bulkCreateFlats(List<_i20.Flat> flats) =>
      caller.callServerEndpoint<List<_i20.Flat>>(
        'society',
        'bulkCreateFlats',
        {'flats': flats},
      );

  /// Get society users/members
  _i2.Future<List<_i21.SocietyUser>> getSocietyUsers(int societyId) =>
      caller.callServerEndpoint<List<_i21.SocietyUser>>(
        'society',
        'getSocietyUsers',
        {'societyId': societyId},
      );

  /// Register/Add a society user
  _i2.Future<_i21.SocietyUser> createSocietyUser(_i21.SocietyUser user) =>
      caller.callServerEndpoint<_i21.SocietyUser>(
        'society',
        'createSocietyUser',
        {'user': user},
      );

  /// Create a member invitation
  _i2.Future<_i22.SocietyInvitation> createInvitation(
    _i22.SocietyInvitation invitation,
  ) => caller.callServerEndpoint<_i22.SocietyInvitation>(
    'society',
    'createInvitation',
    {'invitation': invitation},
  );

  /// Bulk create invitations (e.g. from Excel/CSV import)
  _i2.Future<List<_i22.SocietyInvitation>> bulkCreateInvitations(
    List<_i22.SocietyInvitation> invitations,
  ) => caller.callServerEndpoint<List<_i22.SocietyInvitation>>(
    'society',
    'bulkCreateInvitations',
    {'invitations': invitations},
  );

  /// List invitations for a society
  _i2.Future<List<_i22.SocietyInvitation>> getInvitations(int societyId) =>
      caller.callServerEndpoint<List<_i22.SocietyInvitation>>(
        'society',
        'getInvitations',
        {'societyId': societyId},
      );

  /// Verify and accept an invitation by invite code
  _i2.Future<_i21.SocietyUser?> verifyAndAcceptInvitation(
    String inviteCode,
    String phone,
  ) => caller.callServerEndpoint<_i21.SocietyUser?>(
    'society',
    'verifyAndAcceptInvitation',
    {
      'inviteCode': inviteCode,
      'phone': phone,
    },
  );

  /// Dev-only direct phone login. Disabled in production.
  _i2.Future<_i21.SocietyUser?> loginWithPhone(String phone) =>
      caller.callServerEndpoint<_i21.SocietyUser?>(
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

  /// Fetch all society documents for the authenticated user's society.
  /// Regular residents can only view non-confidential documents.
  _i2.Future<List<_i23.SocietyDocument>> getDocuments({
    _i24.DocumentCategory? category,
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_i23.SocietyDocument>>(
    'document',
    'getDocuments',
    {
      'category': category,
      'limit': limit,
      'offset': offset,
    },
  );

  /// Generates a signed direct upload description for cloud storage.
  /// Enforces file type allowlist (PDF, JPG, PNG), size limit (10MB), and per-society paths.
  _i2.Future<_i25.UploadDescriptionResponse> getUploadDescription({
    required String fileName,
    required int fileSizeBytes,
    required String category,
  }) => caller.callServerEndpoint<_i25.UploadDescriptionResponse>(
    'document',
    'getUploadDescription',
    {
      'fileName': fileName,
      'fileSizeBytes': fileSizeBytes,
      'category': category,
    },
  );

  /// Verifies the upload and registers the document in the Society Document Vault.
  /// Emits an append-only audit trail event on the server.
  _i2.Future<_i23.SocietyDocument> saveDocument({
    required String title,
    required String description,
    required _i24.DocumentCategory category,
    required String storagePath,
    required String fileSize,
    required bool isCommitteeOnly,
  }) => caller.callServerEndpoint<_i23.SocietyDocument>(
    'document',
    'saveDocument',
    {
      'title': title,
      'description': description,
      'category': category,
      'storagePath': storagePath,
      'fileSize': fileSize,
      'isCommitteeOnly': isCommitteeOnly,
    },
  );

  /// Obtains a secure download URL with access check.
  /// Denies access if the caller belongs to a different society or lacks committee rights.
  _i2.Future<String> getDownloadUrl({
    int? documentId,
    String? storagePath,
  }) => caller.callServerEndpoint<String>(
    'document',
    'getDownloadUrl',
    {
      'documentId': documentId,
      'storagePath': storagePath,
    },
  );

  /// Fetch meeting minutes (AGM / EGM / Managing Committee)
  _i2.Future<List<_i26.MeetingMinutes>> getMeetingMinutes({
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_i26.MeetingMinutes>>(
    'document',
    'getMeetingMinutes',
    {
      'limit': limit,
      'offset': offset,
    },
  );

  /// Record new meeting minutes (Committee / Admin only)
  _i2.Future<_i26.MeetingMinutes> recordMeetingMinutes(
    _i26.MeetingMinutes minutes,
  ) => caller.callServerEndpoint<_i26.MeetingMinutes>(
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

  /// Trigger an immediate Emergency SOS Alert.
  /// Broadcasts an [SosAlertEvent] across the society emergency channel and
  /// dispatches high-priority push notifications to all society members.
  _i2.Future<_i27.SosAlert> raiseSosAlert(_i27.SosAlert alert) =>
      caller.callServerEndpoint<_i27.SosAlert>(
        'sos',
        'raiseSosAlert',
        {'alert': alert},
      );

  /// Get active / un-resolved emergency alerts for guards & chairman.
  _i2.Future<List<_i27.SosAlert>> getActiveSosAlerts() =>
      caller.callServerEndpoint<List<_i27.SosAlert>>(
        'sos',
        'getActiveSosAlerts',
        {},
      );

  /// Guard acknowledges emergency and dispatches help.
  _i2.Future<_i27.SosAlert?> acknowledgeSos(
    int alertId,
    String acknowledgedByName,
  ) => caller.callServerEndpoint<_i27.SosAlert?>(
    'sos',
    'acknowledgeSos',
    {
      'alertId': alertId,
      'acknowledgedByName': acknowledgedByName,
    },
  );

  /// Resolve emergency after situation is safe.
  _i2.Future<_i27.SosAlert?> resolveSos(
    int alertId,
    String resolvedByName,
    String resolutionNotes,
  ) => caller.callServerEndpoint<_i27.SosAlert?>(
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
  _i2.Future<_i28.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i28.Greeting>(
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
  _i2.Future<List<_i29.MaintenanceBill>> getBills(
    int societyId, {
    String? flatNumber,
  }) => caller.callServerEndpoint<List<_i29.MaintenanceBill>>(
    'maintenance',
    'getBills',
    {
      'societyId': societyId,
      'flatNumber': flatNumber,
    },
  );

  /// Generate/Create a maintenance bill
  _i2.Future<_i29.MaintenanceBill> createBill(_i29.MaintenanceBill bill) =>
      caller.callServerEndpoint<_i29.MaintenanceBill>(
        'maintenance',
        'createBill',
        {'bill': bill},
      );

  /// Record a payment against maintenance & auto-reconcile to General Ledger
  _i2.Future<_i30.PaymentRecord> recordPayment(_i30.PaymentRecord payment) =>
      caller.callServerEndpoint<_i30.PaymentRecord>(
        'maintenance',
        'recordPayment',
        {'payment': payment},
      );

  /// Get payment history for a society
  _i2.Future<List<_i30.PaymentRecord>> getPayments(int societyId) =>
      caller.callServerEndpoint<List<_i30.PaymentRecord>>(
        'maintenance',
        'getPayments',
        {'societyId': societyId},
      );
}

/// {@category Endpoint}
class EndpointNotification extends _i1.EndpointRef {
  EndpointNotification(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'notification';

  /// Registers or refreshes a device FCM push token for the authenticated user.
  _i2.Future<bool> registerDeviceToken({
    required String deviceToken,
    required String platform,
  }) => caller.callServerEndpoint<bool>(
    'notification',
    'registerDeviceToken',
    {
      'deviceToken': deviceToken,
      'platform': platform,
    },
  );

  /// Unregisters an active FCM device token (e.g. on user logout).
  _i2.Future<bool> unregisterDeviceToken({required String deviceToken}) =>
      caller.callServerEndpoint<bool>(
        'notification',
        'unregisterDeviceToken',
        {'deviceToken': deviceToken},
      );

  /// Purges stale device tokens that haven't been updated in over [olderThanDays] days.
  _i2.Future<int> cleanupStaleTokens({required int olderThanDays}) =>
      caller.callServerEndpoint<int>(
        'notification',
        'cleanupStaleTokens',
        {'olderThanDays': olderThanDays},
      );
}

/// Secure Serverpod Endpoint for Payment Order Creation, Checkout Verification & Webhooks
/// {@category Endpoint}
class EndpointPayment extends _i1.EndpointRef {
  EndpointPayment(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'payment';

  /// Creates a Razorpay payment order.
  /// The amount is strictly computed server-side from the bill record.
  _i2.Future<_i31.RazorpayOrderResponse> createPaymentOrder(int billId) =>
      caller.callServerEndpoint<_i31.RazorpayOrderResponse>(
        'payment',
        'createPaymentOrder',
        {'billId': billId},
      );

  /// Verifies checkout payment signature and atomically fulfills the payment.
  _i2.Future<_i32.PaymentVerificationResult> verifyPayment(
    String orderId,
    String paymentId,
    String signature,
  ) => caller.callServerEndpoint<_i32.PaymentVerificationResult>(
    'payment',
    'verifyPayment',
    {
      'orderId': orderId,
      'paymentId': paymentId,
      'signature': signature,
    },
  );

  /// Handles incoming Razorpay webhook with signature verification and idempotency.
  _i2.Future<_i33.WebhookResult> handleWebhook(
    String payload,
    String signature,
  ) => caller.callServerEndpoint<_i33.WebhookResult>(
    'payment',
    'handleWebhook',
    {
      'payload': payload,
      'signature': signature,
    },
  );
}

/// {@category Endpoint}
class EndpointPoll extends _i1.EndpointRef {
  EndpointPoll(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'poll';

  /// Fetch polls with optional active/closed filter
  _i2.Future<List<_i34.SocietyPoll>> getPolls(
    int societyId, {
    _i35.PollStatus? status,
  }) => caller.callServerEndpoint<List<_i34.SocietyPoll>>(
    'poll',
    'getPolls',
    {
      'societyId': societyId,
      'status': status,
    },
  );

  /// Get options for a specific poll
  _i2.Future<List<_i36.PollOption>> getPollOptions(int pollId) =>
      caller.callServerEndpoint<List<_i36.PollOption>>(
        'poll',
        'getPollOptions',
        {'pollId': pollId},
      );

  /// Chairman / Committee creates a new poll with options
  _i2.Future<_i34.SocietyPoll> createPoll(
    _i34.SocietyPoll poll,
    List<String> options,
  ) => caller.callServerEndpoint<_i34.SocietyPoll>(
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

/// Real-time streaming endpoint for gate bell visitor requests and SOS emergency sirens.
/// Enforces strict server-side authorization so users can only subscribe to their own flat and society.
/// {@category Endpoint}
class EndpointRealtime extends _i1.EndpointRef {
  EndpointRealtime(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'realtime';

  /// Stream gate-bell visitor requests for the caller's flat.
  /// Enforces that residents can only subscribe to their own assigned flat.
  _i2.Stream<_i37.GateBellEvent> streamGateBell({String? requestedFlat}) =>
      caller.callStreamingServerEndpoint<
        _i2.Stream<_i37.GateBellEvent>,
        _i37.GateBellEvent
      >(
        'realtime',
        'streamGateBell',
        {'requestedFlat': requestedFlat},
        {},
      );

  /// Stream emergency SOS alerts for the caller's society.
  /// Enforces that users can only subscribe to their own society's emergency channel.
  _i2.Stream<_i38.SosAlertEvent> streamSosAlerts({int? requestedSocietyId}) =>
      caller.callStreamingServerEndpoint<
        _i2.Stream<_i38.SosAlertEvent>,
        _i38.SosAlertEvent
      >(
        'realtime',
        'streamSosAlerts',
        {'requestedSocietyId': requestedSocietyId},
        {},
      );
}

/// {@category Endpoint}
class EndpointSaasAdmin extends _i1.EndpointRef {
  EndpointSaasAdmin(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'saasAdmin';

  /// Fetch high-level SaaS platform metrics (Platform Super Admin only)
  _i2.Future<_i39.SaasMetricSummary> getMetricSummary() =>
      caller.callServerEndpoint<_i39.SaasMetricSummary>(
        'saasAdmin',
        'getMetricSummary',
        {},
      );

  /// List all client society subscriptions (Platform Super Admin only)
  _i2.Future<List<_i40.SocietySubscription>> getAllSubscriptions() =>
      caller.callServerEndpoint<List<_i40.SocietySubscription>>(
        'saasAdmin',
        'getAllSubscriptions',
        {},
      );

  /// Register new society subscription (Platform Super Admin only)
  _i2.Future<_i40.SocietySubscription> createSubscription(
    _i40.SocietySubscription sub,
  ) => caller.callServerEndpoint<_i40.SocietySubscription>(
    'saasAdmin',
    'createSubscription',
    {'sub': sub},
  );

  /// Update subscription status (Platform Super Admin only)
  _i2.Future<_i40.SocietySubscription?> updateSubscriptionStatus(
    int subscriptionId,
    String status,
  ) => caller.callServerEndpoint<_i40.SocietySubscription?>(
    'saasAdmin',
    'updateSubscriptionStatus',
    {
      'subscriptionId': subscriptionId,
      'status': status,
    },
  );
}

/// {@category Endpoint}
class EndpointTenancy extends _i1.EndpointRef {
  EndpointTenancy(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'tenancy';

  /// List tenant NOC records for the authenticated user's society (paginated).
  _i2.Future<List<_i41.TenantNoc>> getTenantNocs({
    _i42.NocStatus? status,
    required int limit,
    required int offset,
  }) => caller.callServerEndpoint<List<_i41.TenantNoc>>(
    'tenancy',
    'getTenantNocs',
    {
      'status': status,
      'limit': limit,
      'offset': offset,
    },
  );

  /// Submit a new Tenancy Agreement & NOC Request.
  /// Generates a server-side audit event inside the database transaction.
  _i2.Future<_i41.TenantNoc> submitNoc({
    required String flatNumber,
    required String ownerName,
    required String ownerPhone,
    required String tenantName,
    required String tenantPhone,
    required DateTime leaseStart,
    required DateTime leaseEnd,
    required double monthlyRent,
    String? documentPath,
    String? documentUrl,
  }) => caller.callServerEndpoint<_i41.TenantNoc>(
    'tenancy',
    'submitNoc',
    {
      'flatNumber': flatNumber,
      'ownerName': ownerName,
      'ownerPhone': ownerPhone,
      'tenantName': tenantName,
      'tenantPhone': tenantPhone,
      'leaseStart': leaseStart,
      'leaseEnd': leaseEnd,
      'monthlyRent': monthlyRent,
      'documentPath': documentPath,
      'documentUrl': documentUrl,
    },
  );

  /// Approve, reject, or mark NOC as expired.
  /// Requires Committee or Admin role permissions.
  _i2.Future<_i41.TenantNoc> resolveNoc({
    required int nocId,
    required _i42.NocStatus status,
    String? notes,
  }) => caller.callServerEndpoint<_i41.TenantNoc>(
    'tenancy',
    'resolveNoc',
    {
      'nocId': nocId,
      'status': status,
      'notes': notes,
    },
  );
}

/// {@category Endpoint}
class EndpointVisitor extends _i1.EndpointRef {
  EndpointVisitor(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'visitor';

  /// Get visitors for the authenticated caller's society.
  /// Residents only receive visitor records for their own flat.
  _i2.Future<List<_i43.VisitorEntry>> getVisitors({
    String? flatNumber,
    _i44.VisitorStatus? status,
  }) => caller.callServerEndpoint<List<_i43.VisitorEntry>>(
    'visitor',
    'getVisitors',
    {
      'flatNumber': flatNumber,
      'status': status,
    },
  );

  /// Create visitor entry (pre-approved by resident or recorded by gate guard).
  /// If status is [VisitorStatus.waitingApproval], dispatches a real-time GateBellEvent
  /// to the specific flat's channel and delivers a high-priority FCM push notification.
  _i2.Future<_i43.VisitorEntry> createVisitorEntry(_i43.VisitorEntry entry) =>
      caller.callServerEndpoint<_i43.VisitorEntry>(
        'visitor',
        'createVisitorEntry',
        {'entry': entry},
      );

  /// Update visitor status (e.g., approved/rejected by resident, checked-in/out by guard).
  _i2.Future<_i43.VisitorEntry?> updateVisitorStatus(
    int visitorId,
    _i44.VisitorStatus status,
  ) => caller.callServerEndpoint<_i43.VisitorEntry?>(
    'visitor',
    'updateVisitorStatus',
    {
      'visitorId': visitorId,
      'status': status,
    },
  );

  /// Verify visitor passcode at the gate terminal.
  _i2.Future<_i43.VisitorEntry?> verifyVisitorPasscode(String passcode) =>
      caller.callServerEndpoint<_i43.VisitorEntry?>(
        'visitor',
        'verifyVisitorPasscode',
        {'passcode': passcode},
      );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _i13.Caller(client);
    serverpod_auth_core = _i14.Caller(client);
  }

  late final _i13.Caller serverpod_auth_idp;

  late final _i14.Caller serverpod_auth_core;
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
         _i45.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    accounting = EndpointAccounting(this);
    amenity = EndpointAmenity(this);
    audit = EndpointAudit(this);
    auth = EndpointAuth(this);
    emailIdp = EndpointEmailIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    communication = EndpointCommunication(this);
    society = EndpointSociety(this);
    document = EndpointDocument(this);
    sos = EndpointSos(this);
    greeting = EndpointGreeting(this);
    maintenance = EndpointMaintenance(this);
    notification = EndpointNotification(this);
    payment = EndpointPayment(this);
    poll = EndpointPoll(this);
    realtime = EndpointRealtime(this);
    saasAdmin = EndpointSaasAdmin(this);
    tenancy = EndpointTenancy(this);
    visitor = EndpointVisitor(this);
    modules = Modules(this);
  }

  late final EndpointAccounting accounting;

  late final EndpointAmenity amenity;

  late final EndpointAudit audit;

  late final EndpointAuth auth;

  late final EndpointEmailIdp emailIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final EndpointCommunication communication;

  late final EndpointSociety society;

  late final EndpointDocument document;

  late final EndpointSos sos;

  late final EndpointGreeting greeting;

  late final EndpointMaintenance maintenance;

  late final EndpointNotification notification;

  late final EndpointPayment payment;

  late final EndpointPoll poll;

  late final EndpointRealtime realtime;

  late final EndpointSaasAdmin saasAdmin;

  late final EndpointTenancy tenancy;

  late final EndpointVisitor visitor;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
    'accounting': accounting,
    'amenity': amenity,
    'audit': audit,
    'auth': auth,
    'emailIdp': emailIdp,
    'jwtRefresh': jwtRefresh,
    'communication': communication,
    'society': society,
    'document': document,
    'sos': sos,
    'greeting': greeting,
    'maintenance': maintenance,
    'notification': notification,
    'payment': payment,
    'poll': poll,
    'realtime': realtime,
    'saasAdmin': saasAdmin,
    'tenancy': tenancy,
    'visitor': visitor,
  };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}
