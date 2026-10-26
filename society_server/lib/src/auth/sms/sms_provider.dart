/// Abstract interface for sending SMS OTP verification codes.
abstract interface class SmsProvider {
  /// Sends a 6-digit OTP to the destination [phoneNumber].
  /// Returns `true` if delivery succeeded or was accepted by the gateway.
  Future<bool> sendOtp({
    required String phoneNumber,
    required String otp,
    required Duration expiry,
  });
}
