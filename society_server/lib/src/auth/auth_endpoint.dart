import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import '../audit/audit_service.dart';
import '../core/auth_context.dart';
import '../generated/protocol.dart';
import 'sms/sms_provider_factory.dart';

/// Secure SMS OTP Authentication Endpoint
class AuthEndpoint extends Endpoint {
  /// Request a 6-digit SMS OTP verification code.
  Future<OtpSendResult> sendOtp(Session session, String phone) async {
    final cleanPhone = phone.trim().replaceAll(RegExp(r'[^0-9]'), '');
    if (cleanPhone.length < 10) {
      throw ArgumentError('Invalid phone number. Must be at least 10 digits.');
    }
    final normalizedPhone = cleanPhone.length > 10
        ? cleanPhone.substring(cleanPhone.length - 10)
        : cleanPhone;

    // 1. IP rate limiting (max 20 / hr)
    String? ipAddress;
    try {
      final req = session.request;
      if (req != null) {
        final f = req.headers['x-forwarded-for'];
        ipAddress = (f != null && f.isNotEmpty) ? f.first.split(',').first.trim() : req.remoteInfo;
      }
    } catch (_) {}

    if (ipAddress != null && ipAddress.isNotEmpty) {
      final hourAgo = DateTime.now().subtract(const Duration(hours: 1));
      final ipCount = await PhoneOtp.db.count(
        session,
        where: (t) => t.ipAddress.equals(ipAddress) & (t.lastSentAt > hourAgo),
      );
      if (ipCount >= 20) throw StateError('Rate limit exceeded for IP. Please try again later.');
    }

    // 2. Phone rate limiting (max 10 requests per 24h)
    final dayAgo = DateTime.now().subtract(const Duration(days: 1));
    final phoneCount = await PhoneOtp.db.count(
      session,
      where: (t) => t.phone.equals(normalizedPhone) & (t.lastSentAt > dayAgo),
    );
    if (phoneCount >= 10) throw StateError('Maximum daily OTP request limit reached for this phone number.');

    // 3. Resend cooldown (60 seconds)
    final latestOtps = await PhoneOtp.db.find(
      session,
      where: (t) => t.phone.equals(normalizedPhone),
      orderBy: (t) => t.id,
      orderDescending: true,
      limit: 1,
    );
    if (latestOtps.isNotEmpty) {
      final elapsed = DateTime.now().difference(latestOtps.first.lastSentAt).inSeconds;
      if (elapsed < 60) {
        final remaining = 60 - elapsed;
        return OtpSendResult(
          success: false,
          message: 'Please wait $remaining seconds before requesting another OTP.',
          cooldownSeconds: remaining,
          expiresInSeconds: 300,
        );
      }
    }

    // 4. Invalidate older unused OTPs for this phone
    final activeOtps = await PhoneOtp.db.find(
      session,
      where: (t) => t.phone.equals(normalizedPhone) & t.isUsed.equals(false),
    );
    for (final old in activeOtps) {
      old.isUsed = true;
      await PhoneOtp.db.updateRow(session, old);
    }

    // 5. Generate 6-digit OTP (standard '123456' for all accounts in dev/staging)
    final otp = session.serverpod.runMode == 'production'
        ? (100000 + Random.secure().nextInt(900000)).toString()
        : '123456';
    final salt = Uuid().v4().replaceAll('-', '');
    final otpHash = sha256.convert(utf8.encode('$otp:$salt')).toString();

    // 6. Store only salted hash in PostgreSQL
    final otpRecord = PhoneOtp(
      phone: normalizedPhone,
      salt: salt,
      otpHash: otpHash,
      attempts: 0,
      maxAttempts: 5,
      expiresAt: DateTime.now().add(const Duration(minutes: 5)),
      lastSentAt: DateTime.now(),
      ipAddress: ipAddress,
      isUsed: false,
    );
    await PhoneOtp.db.insertRow(session, otpRecord);

    // 7. Dispatch via configured SmsProvider
    final provider = SmsProviderFactory.getProvider(session);
    await provider.sendOtp(
      phoneNumber: normalizedPhone,
      otp: otp,
      expiry: const Duration(minutes: 5),
    );
    session.log('[SMS OTP] Dispatched code: $otp to +91 $normalizedPhone');

    return OtpSendResult(
      success: true,
      message: session.serverpod.runMode == 'production'
          ? 'OTP sent successfully to +91 $normalizedPhone'
          : 'OTP sent! Use code 123456 to sign in.',
      cooldownSeconds: 60,
      expiresInSeconds: 300,
    );
  }

  /// Verify OTP and return authenticated session tokens.
  Future<AuthResponse> verifyOtp(Session session, String phone, String otp) async {
    final cleanPhone = phone.trim().replaceAll(RegExp(r'[^0-9]'), '');
    final normalizedPhone = cleanPhone.length > 10
        ? cleanPhone.substring(cleanPhone.length - 10)
        : cleanPhone;

    final cleanOtp = otp.trim().replaceAll(RegExp(r'[^0-9]'), '');
    if (cleanOtp.length != 6) {
      return AuthResponse(
        success: false,
        message: 'Please enter a valid 6-digit OTP code.',
      );
    }

    // 1. Fetch latest active OTP record
    final otps = await PhoneOtp.db.find(
      session,
      where: (t) => t.phone.equals(normalizedPhone) & t.isUsed.equals(false),
      orderBy: (t) => t.id,
      orderDescending: true,
      limit: 1,
    );

    if (otps.isEmpty) {
      if (session.serverpod.runMode == 'production' || cleanOtp != '123456') {
        return AuthResponse(
          success: false,
          message: 'No active OTP found. Please request a new OTP code.',
        );
      }
    } else {
      final record = otps.first;

      // 2. Check 5-minute expiry
      if (DateTime.now().isAfter(record.expiresAt)) {
        record.isUsed = true;
        await PhoneOtp.db.updateRow(session, record);
        return AuthResponse(
          success: false,
          message: 'OTP has expired. Verification codes are valid for 5 minutes.',
        );
      }

      // 3. Check attempt limit & lockout
      if (record.attempts >= record.maxAttempts) {
        return AuthResponse(
          success: false,
          message: 'Maximum verification attempts exceeded. This OTP is locked. Please request a new code.',
          isLockedOut: true,
          attemptsRemaining: 0,
        );
      }

      // 4. Verify salted hash (or master OTP 123456 in dev)
      final candidateHash = sha256.convert(utf8.encode('$cleanOtp:${record.salt}')).toString();
      final isMasterDevOtp = session.serverpod.runMode != 'production' && cleanOtp == '123456';
      if (!isMasterDevOtp && candidateHash != record.otpHash) {
        record.attempts += 1;
        await PhoneOtp.db.updateRow(session, record);

        final remaining = record.maxAttempts - record.attempts;
        final isLocked = remaining <= 0;
        return AuthResponse(
          success: false,
          message: isLocked
              ? 'Maximum verification attempts exceeded. This OTP is now locked.'
              : 'Incorrect verification code. $remaining attempts remaining.',
          attemptsRemaining: remaining,
          isLockedOut: isLocked,
        );
      }

      // 5. Success: Mark OTP as used
      record.isUsed = true;
      await PhoneOtp.db.updateRow(session, record);
    }

    // 6. Resolve registered SocietyUser
    var user = await SocietyUser.db.findFirstRow(
      session,
      where: (t) => t.phone.equals(normalizedPhone) | t.phone.equals(cleanPhone),
    );

    if (user == null && session.serverpod.runMode != 'production') {
      final firstSociety = await Society.db.findFirstRow(session);
      if (firstSociety != null) {
        user = await SocietyUser.db.insertRow(
          session,
          SocietyUser(
            societyId: firstSociety.id!,
            fullName: 'Resident ($normalizedPhone)',
            phone: normalizedPhone,
            email: 'user_$normalizedPhone@samarth.in',
            role: UserRole.resident,
            flatNumber: 'A-101',
            status: 'active',
            createdAt: DateTime.now(),
          ),
        );
      }
    }

    if (user == null) {
      return AuthResponse(
        success: false,
        message: 'Phone number +91 $normalizedPhone is not registered with any society community.',
      );
    }

    // 7. Ensure Serverpod AuthUser exists and link to SocietyUser
    AuthUser? authUser;
    if (user.authUserId != null) {
      try {
        authUser = await AuthUser.db.findById(session, UuidValue.fromString(user.authUserId!));
      } catch (_) {}
    }

    if (authUser == null) {
      final newAuthId = UuidValue.fromString(Uuid().v4());
      authUser = await AuthUser.db.insertRow(
        session,
        AuthUser(id: newAuthId, scopeNames: {'user', user.role.name}, blocked: false),
      );
      user.authUserId = authUser.id.toString();
      await SocietyUser.db.updateRow(session, user);
    }

    // 8. Issue Serverpod Auth Token
    final authSuccess = await AuthServices.instance.tokenManager.issueToken(
      session,
      authUserId: authUser.id!,
      method: 'sms',
    );
    final society = await Society.db.findById(session, user.societyId);

    // 9. Append-only server audit trail
    await AuditService.record(
      session,
      societyId: user.societyId,
      category: AuditCategory.gateSecurity,
      action: 'USER_LOGIN_SMS_OTP',
      actorId: user.id,
      actorName: user.fullName,
      actorRole: user.role,
      target: user.phone,
      description: 'User ${user.fullName} successfully authenticated via SMS OTP.',
    );

    return AuthResponse(success: true, token: authSuccess.token, user: user, society: society);
  }

  /// Sign out current device and revoke session tokens.
  Future<bool> signOut(Session session) async {
    final auth = await AuthContext.require(session);
    if (auth.user.authUserId != null) {
      try {
        await AuthServices.instance.tokenManager.revokeAllTokens(
          session,
          authUserId: UuidValue.fromString(auth.user.authUserId!),
        );
      } catch (_) {}
    }

    await AuditService.record(
      session,
      societyId: auth.societyId,
      category: AuditCategory.gateSecurity,
      action: 'USER_LOGOUT',
      actorId: auth.userId,
      actorName: auth.userName,
      actorRole: auth.role,
      target: auth.user.phone,
      description: 'User ${auth.userName} logged out and revoked all active session tokens.',
    );

    return true;
  }
}
