import 'package:serverpod/serverpod.dart';
import 'console_sms_provider.dart';
import 'msg91_sms_provider.dart';
import 'sms_provider.dart';

/// Factory resolving the active [SmsProvider] based on environment passwords.
class SmsProviderFactory {
  static SmsProvider? _overrideProvider;

  /// Allows unit and integration tests to inject a mock or test provider.
  static void setOverrideProvider(SmsProvider? provider) {
    _overrideProvider = provider;
  }

  /// Resolves the provider. Uses MSG91 if passwords are configured, otherwise falls back to console.
  static SmsProvider getProvider(Session session) {
    if (_overrideProvider != null) {
      return _overrideProvider!;
    }

    final authKey = session.passwords['msg91AuthKey'];
    final templateId = session.passwords['msg91TemplateId'];
    final senderId = session.passwords['msg91SenderId'] ?? 'SOCMGT';

    if (authKey != null && authKey.isNotEmpty && templateId != null && templateId.isNotEmpty) {
      return Msg91SmsProvider(
        authKey: authKey,
        templateId: templateId,
        senderId: senderId,
      );
    }

    return ConsoleSmsProvider();
  }
}
