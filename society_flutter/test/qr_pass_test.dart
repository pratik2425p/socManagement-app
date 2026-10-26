import 'package:flutter_test/flutter_test.dart';
import 'package:society_flutter/core/services/qr_pass_service.dart';

void main() {
  group('QrPassService Token Generation and Verification', () {
    const testSocietyId = 1;
    const testFlatNumber = 'A-402';

    test('generates valid token with expected format and signature', () {
      final token = QrPassService.generateToken(
        societyId: testSocietyId,
        flatNumber: testFlatNumber,
      );

      expect(token.startsWith('SOC-PASS:$testSocietyId:$testFlatNumber:'), isTrue);
      final parts = token.split(':');
      expect(parts.length, 5);
      expect(parts[4].length, 16); // 16-char hex signature
    });

    test('validates authentic freshly-generated token successfully', () {
      final now = DateTime.now();
      final token = QrPassService.generateToken(
        societyId: testSocietyId,
        flatNumber: testFlatNumber,
        now: now,
      );

      final result = QrPassService.validateToken(
        rawToken: token,
        currentSocietyId: testSocietyId,
        checkTime: now.add(const Duration(seconds: 15)),
      );

      expect(result.isValid, isTrue);
      expect(result.flatNumber, testFlatNumber);
      expect(result.societyId, testSocietyId);
      expect(result.ageSeconds, 15);
      expect(result.errorReason, isNull);
    });

    test('rejects expired token older than 60 seconds', () {
      final now = DateTime.now();
      final token = QrPassService.generateToken(
        societyId: testSocietyId,
        flatNumber: testFlatNumber,
        now: now,
      );

      final result = QrPassService.validateToken(
        rawToken: token,
        currentSocietyId: testSocietyId,
        checkTime: now.add(const Duration(seconds: 75)),
      );

      expect(result.isValid, isFalse);
      expect(result.errorReason, contains('Expired pass'));
    });

    test('rejects tampered token where payload was modified', () {
      final now = DateTime.now();
      final validToken = QrPassService.generateToken(
        societyId: testSocietyId,
        flatNumber: testFlatNumber,
        now: now,
      );

      // Maliciously change flat number from A-402 to B-999 without recomputing HMAC
      final tampered = validToken.replaceFirst('A-402', 'B-999');

      final result = QrPassService.validateToken(
        rawToken: tampered,
        currentSocietyId: testSocietyId,
        checkTime: now,
      );

      expect(result.isValid, isFalse);
      expect(result.errorReason, contains('Tampered token'));
    });

    test('rejects pass presented at wrong society gate', () {
      final now = DateTime.now();
      final token = QrPassService.generateToken(
        societyId: 1, // Issued for Society #1
        flatNumber: testFlatNumber,
        now: now,
      );

      // Scanned at Society #2 gate
      final result = QrPassService.validateToken(
        rawToken: token,
        currentSocietyId: 2,
        checkTime: now,
      );

      expect(result.isValid, isFalse);
      expect(result.errorReason, contains('Wrong society'));
    });

    test('rejects malformed token strings', () {
      final result1 = QrPassService.validateToken(
        rawToken: 'https://example.com/not-a-pass',
        currentSocietyId: testSocietyId,
      );
      expect(result1.isValid, isFalse);
      expect(result1.errorReason, contains('Invalid pass format'));

      final result2 = QrPassService.validateToken(
        rawToken: 'SOC-PASS:1:A-101',
        currentSocietyId: testSocietyId,
      );
      expect(result2.isValid, isFalse);
      expect(result2.errorReason, contains('Malformed pass token structure'));
    });
  });
}
