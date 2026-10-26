import 'dart:convert';
import 'package:crypto/crypto.dart';

/// Validation status result of a scanned security gate pass
class PassValidationResult {
  final bool isValid;
  final String? errorReason;
  final int? societyId;
  final String? flatNumber;
  final DateTime? timestamp;
  final int? ageSeconds;

  const PassValidationResult._({
    required this.isValid,
    this.errorReason,
    this.societyId,
    this.flatNumber,
    this.timestamp,
    this.ageSeconds,
  });

  factory PassValidationResult.success({
    required int societyId,
    required String flatNumber,
    required DateTime timestamp,
    required int ageSeconds,
  }) {
    return PassValidationResult._(
      isValid: true,
      societyId: societyId,
      flatNumber: flatNumber,
      timestamp: timestamp,
      ageSeconds: ageSeconds,
    );
  }

  factory PassValidationResult.failure(String reason) {
    return PassValidationResult._(
      isValid: false,
      errorReason: reason,
    );
  }
}

/// Service for generating and verifying cryptographic time-limited QR passes
class QrPassService {
  QrPassService._();

  static const String _secretKey = 'soc_pass_hmac_secret_2026';
  static const int passValiditySeconds = 60;

  /// Generate signature for payload
  static String _computeSignature(String payload) {
    final hmac = Hmac(sha256, utf8.encode(_secretKey));
    final digest = hmac.convert(utf8.encode(payload));
    return digest.toString().substring(0, 16); // 16-char hex signature
  }

  /// Generate a dynamic 60s rotating QR token:
  /// Format: SOC-PASS:{societyId}:{flatNumber}:{timestampMs}:{signature}
  static String generateToken({
    required int societyId,
    required String flatNumber,
    DateTime? now,
  }) {
    final timestamp = (now ?? DateTime.now()).millisecondsSinceEpoch;
    final payload = '$societyId:$flatNumber:$timestamp';
    final signature = _computeSignature(payload);
    return 'SOC-PASS:$societyId:$flatNumber:$timestamp:$signature';
  }

  /// Validate a scanned QR token string against current society context
  static PassValidationResult validateToken({
    required String rawToken,
    required int currentSocietyId,
    DateTime? checkTime,
  }) {
    final trimmed = rawToken.trim();
    if (!trimmed.startsWith('SOC-PASS:')) {
      return PassValidationResult.failure('Invalid pass format (Not a Society Gate Pass)');
    }

    final parts = trimmed.split(':');
    if (parts.length != 5) {
      return PassValidationResult.failure('Malformed pass token structure');
    }

    final societyId = int.tryParse(parts[1]);
    final flatNumber = parts[2];
    final timestampMs = int.tryParse(parts[3]);
    final signature = parts[4];

    if (societyId == null || timestampMs == null || flatNumber.isEmpty) {
      return PassValidationResult.failure('Corrupted pass metadata');
    }

    // 1. Verify HMAC signature to prevent tampering
    final expectedPayload = '$societyId:$flatNumber:$timestampMs';
    final expectedSig = _computeSignature(expectedPayload);
    if (signature != expectedSig) {
      return PassValidationResult.failure('Tampered token: Signature verification failed');
    }

    // 2. Verify society isolation
    if (societyId != currentSocietyId) {
      return PassValidationResult.failure(
        'Wrong society: Pass issued for Society #$societyId, this gate is Society #$currentSocietyId',
      );
    }

    // 3. Verify expiration window (60s)
    final nowMs = (checkTime ?? DateTime.now()).millisecondsSinceEpoch;
    final ageMs = nowMs - timestampMs;
    final ageSeconds = (ageMs / 1000).floor();

    if (ageSeconds > passValiditySeconds) {
      return PassValidationResult.failure(
        'Expired pass: Expired ${ageSeconds - passValiditySeconds}s ago (Valid for 60s)',
      );
    }

    if (ageSeconds < -10) {
      // Future timestamp clock skew protection
      return PassValidationResult.failure('Clock skew error: Pass timestamp is in the future');
    }

    return PassValidationResult.success(
      societyId: societyId,
      flatNumber: flatNumber,
      timestamp: DateTime.fromMillisecondsSinceEpoch(timestampMs),
      ageSeconds: ageSeconds,
    );
  }
}
