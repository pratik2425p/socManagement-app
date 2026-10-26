import 'dart:io';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';
import 'package:serverpod_cloud_storage_s3_compat/serverpod_cloud_storage_s3_compat.dart';

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';
import 'src/payment/razorpay_webhook_route.dart';
import 'src/seed.dart';
import 'src/web/routes/app_config_route.dart';
import 'src/web/routes/root.dart';

/// The starting point of the Serverpod server.
void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(args, Protocol(), Endpoints());

  // Configure S3-compatible cloud storage if credentials are provided in passwords.yaml
  final s3Endpoint = pod.getPassword('s3Endpoint');
  final s3Bucket = pod.getPassword('s3Bucket');
  final s3Region = pod.getPassword('s3Region') ?? 'ap-south-1';
  final s3AccessKey = pod.getPassword('s3AccessKeyId');
  final s3SecretKey = pod.getPassword('s3SecretAccessKey');

  if (s3Bucket != null &&
      s3AccessKey != null &&
      s3SecretKey != null &&
      s3AccessKey.isNotEmpty &&
      s3SecretKey.isNotEmpty) {
    final endpointUri = Uri.parse(s3Endpoint ?? 'https://s3.$s3Region.amazonaws.com');
    pod.addCloudStorage(
      S3CompatCloudStorage(
        storageId: 'public',
        accessKey: s3AccessKey,
        secretKey: s3SecretKey,
        bucket: s3Bucket,
        region: s3Region,
        public: true,
        endpoints: CustomEndpointConfig(baseUri: endpointUri),
        uploadStrategy: PresignedPutUploadStrategy(),
      ),
    );
  }

  // Initialize authentication services for the server.
  // Token managers will be used to validate and issue authentication keys,
  // and the identity providers will be the authentication options available for users.
  pod.initializeAuthServices(
    tokenManagerBuilders: [
      // Use JWT for authentication keys towards the server.
      JwtConfigFromPasswords(),
    ],
    identityProviderBuilders: [
      // Configure the email identity provider for email/password authentication.
      EmailIdpConfigFromPasswords(
        sendRegistrationVerificationCode: _sendRegistrationCode,
        sendPasswordResetVerificationCode: _sendPasswordResetCode,
      ),
    ],
  );

  // Setup a default page at the web root.
  // These are used by the default page.
  pod.webServer.addRoute(RootRoute(), '/');
  pod.webServer.addRoute(RootRoute(), '/index.html');

  // Serve all files in the web/static relative directory under /.
  // These are used by the default web page.
  final root = Directory(Uri(path: 'web/static').toFilePath());
  pod.webServer.addRoute(StaticRoute.directory(root));

  // Razorpay Webhook endpoint for server-side payment confirmation & auto-reconciliation
  pod.webServer.addRoute(RazorpayWebhookRoute(), '/webhook/razorpay');

  // Setup the app config route.
  // We build this configuration based on the servers api url and serve it to
  // the flutter app.
  pod.webServer.addRoute(
    AppConfigRoute(apiConfig: pod.config.apiServer),
    '/app/assets/assets/config.json',
  );

  // Checks if the flutter web app has been built and serves it if it has.
  final appDir = Directory(Uri(path: 'web/app').toFilePath());
  if (appDir.existsSync()) {
    // Serve the flutter web app under the /app path.
    pod.webServer.addRoute(
      FlutterRoute(
        Directory(
          Uri(path: 'web/app').toFilePath(),
        ),
      ),
      '/app',
    );
  } else {
    // If the flutter web app has not been built, serve the build app page.
    pod.webServer.addRoute(
      StaticRoute.file(
        File(
          Uri(path: 'web/pages/build_flutter_app.html').toFilePath(),
        ),
      ),
      '/app/**',
    );
  }

  // Start the server.
  await pod.start();

  // Seed baseline data if empty.
  await seedInitialData(pod);
}

void _sendRegistrationCode(
  Session session, {
  required String email,
  required UuidValue accountRequestId,
  required String verificationCode,
  required Transaction? transaction,
}) {
  // NOTE: Here you call your mail service to send the verification code to
  // the user. For testing, we will just log the verification code.
  session.log('[EmailIdp] Registration code ($email): $verificationCode');
}

void _sendPasswordResetCode(
  Session session, {
  required String email,
  required UuidValue passwordResetRequestId,
  required String verificationCode,
  required Transaction? transaction,
}) {
  // NOTE: Here you call your mail service to send the verification code to
  // the user. For testing, we will just log the verification code.
  session.log('[EmailIdp] Password reset code ($email): $verificationCode');
}
