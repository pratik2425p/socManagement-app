import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:society_server/src/auth/sms/console_sms_provider.dart';
import 'package:society_server/src/generated/protocol.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Given SMS OTP Authentication and Role Enforcement', (
    sessionBuilder,
    endpoints,
  ) {
    late Society testSociety;
    late SocietyUser residentUser;
    const testPhone = '9822011223';

    setUpAll(() async {
      AuthServices.set(
        tokenManagerBuilders: [
          JwtConfigFromPasswords(),
        ],
      );
    });

    setUp(() async {
      final session = sessionBuilder.build();

      // Clean test tables
      await PhoneOtp.db.deleteWhere(session, where: (_) => Constant.bool(true));
      await AuditLog.db.deleteWhere(session, where: (_) => Constant.bool(true));
      await SocietyUser.db.deleteWhere(session, where: (_) => Constant.bool(true));
      await Society.db.deleteWhere(session, where: (_) => Constant.bool(true));

      testSociety = await Society.db.insertRow(
        session,
        Society(
          name: 'Shree Samarth Residency',
          code: 'SSR01',
          address: 'Pune West',
          city: 'Pune',
          state: 'Maharashtra',
          pincode: '411001',
          totalFlats: 100,
          subscriptionPlan: 'pro',
          subscriptionStatus: 'active',
          createdAt: DateTime.now(),
        ),
      );

      residentUser = await SocietyUser.db.insertRow(
        session,
        SocietyUser(
          societyId: testSociety.id!,
          fullName: 'Pooja Deshmukh',
          phone: testPhone,
          email: 'pooja@samarth.in',
          role: UserRole.resident,
          flatNumber: 'B-204',
          status: 'active',
          createdAt: DateTime.now(),
        ),
      );
    });

    test('when sendOtp is called, salted hash is saved and plaintext OTP is never stored', () async {
      final sendResult = await endpoints.auth.sendOtp(
        sessionBuilder,
        testPhone,
      );

      expect(sendResult.success, isTrue);
      expect(sendResult.cooldownSeconds, 60);

      // Verify DB record
      final session = sessionBuilder.build();
      final otps = await PhoneOtp.db.find(session, where: (t) => t.phone.equals(testPhone));
      expect(otps, hasLength(1));

      final otpRecord = otps.first;
      expect(otpRecord.otpHash, isNotEmpty);
      expect(otpRecord.salt, isNotEmpty);
      // Ensure plaintext OTP is NOT in the database
      final sentOtp = ConsoleSmsProvider.lastSentOtp!;
      expect(sentOtp, hasLength(6));
      expect(otpRecord.otpHash, isNot(contains(sentOtp)));
    });

    test('when sendOtp is called before cooldown expires, request is rejected with cooldown', () async {
      await endpoints.auth.sendOtp(sessionBuilder, testPhone);

      // Attempt immediate resend
      final secondAttempt = await endpoints.auth.sendOtp(sessionBuilder, testPhone);
      expect(secondAttempt.success, isFalse);
      expect(secondAttempt.message, contains('Please wait'));
      expect(secondAttempt.cooldownSeconds, greaterThan(0));
    });

    test('when verifyOtp is called with correct OTP, JWT auth token is returned and user is resolved', () async {
      await endpoints.auth.sendOtp(sessionBuilder, testPhone);
      final generatedOtp = ConsoleSmsProvider.lastSentOtp!;

      final authResponse = await endpoints.auth.verifyOtp(
        sessionBuilder,
        testPhone,
        generatedOtp,
      );

      expect(authResponse.success, isTrue);
      expect(authResponse.token, isNotNull);
      expect(authResponse.user, isNotNull);
      expect(authResponse.user!.fullName, 'Pooja Deshmukh');
      expect(authResponse.society, isNotNull);
      expect(authResponse.society!.name, 'Shree Samarth Residency');

      // Verify OTP is marked as used
      final session = sessionBuilder.build();
      final otps = await PhoneOtp.db.find(session, where: (t) => t.phone.equals(testPhone));
      expect(otps.first.isUsed, isTrue);
    });

    test('when verifyOtp is called with incorrect OTP, attempts decrement and remaining count is returned', () async {
      await endpoints.auth.sendOtp(sessionBuilder, testPhone);

      final authResponse = await endpoints.auth.verifyOtp(
        sessionBuilder,
        testPhone,
        '000000', // Deliberate wrong OTP
      );

      expect(authResponse.success, isFalse);
      expect(authResponse.attemptsRemaining, 4);
      expect(authResponse.isLockedOut, isFalse);

      final session = sessionBuilder.build();
      final otps = await PhoneOtp.db.find(session, where: (t) => t.phone.equals(testPhone));
      expect(otps.first.attempts, 1);
    });

    test('when max verification attempts are exceeded, OTP is permanently locked out', () async {
      await endpoints.auth.sendOtp(sessionBuilder, testPhone);

      // 5 failed attempts
      for (var i = 0; i < 4; i++) {
        await endpoints.auth.verifyOtp(sessionBuilder, testPhone, '111111');
      }

      final fifthAttempt = await endpoints.auth.verifyOtp(sessionBuilder, testPhone, '111111');
      expect(fifthAttempt.success, isFalse);
      expect(fifthAttempt.attemptsRemaining, 0);
      expect(fifthAttempt.isLockedOut, isTrue);

      // Even if the correct OTP is entered afterwards, it must remain locked
      final correctOtp = ConsoleSmsProvider.lastSentOtp!;
      final blockedAttempt = await endpoints.auth.verifyOtp(sessionBuilder, testPhone, correctOtp);
      expect(blockedAttempt.success, isFalse);
      expect(blockedAttempt.message, contains('locked'));
    });

    test('when verifyOtp is called with an expired OTP, verification fails', () async {
      await endpoints.auth.sendOtp(sessionBuilder, testPhone);
      final otp = ConsoleSmsProvider.lastSentOtp!;

      // Simulate expired OTP by backdating expiresAt in DB
      final session = sessionBuilder.build();
      final otps = await PhoneOtp.db.find(session, where: (t) => t.phone.equals(testPhone));
      final record = otps.first;
      record.expiresAt = DateTime.now().subtract(const Duration(minutes: 1));
      await PhoneOtp.db.updateRow(session, record);

      final authResponse = await endpoints.auth.verifyOtp(sessionBuilder, testPhone, otp);
      expect(authResponse.success, isFalse);
      expect(authResponse.message, contains('expired'));
    });

    test('when resident user attempts to access SaaS Super Admin metrics, role denial is enforced', () async {
      final sessionBuilderResident = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          residentUser.id.toString(),
          {},
        ),
      );

      await expectLater(
        () => endpoints.saasAdmin.getMetricSummary(sessionBuilderResident),
        throwsA(isA<StateError>().having(
          (e) => e.message,
          'message',
          contains('Access denied'),
        )),
      );
    });
  });
}
