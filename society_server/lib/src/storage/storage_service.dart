import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';
import 'package:serverpod/serverpod.dart';

/// Centralized cloud storage management service for society documents and NOC records.
/// Enforces per-society path isolation, file format allowlists, and size limits.
class StorageService {
  /// Allowed file extensions
  static const Set<String> allowedExtensions = {'pdf', 'jpg', 'jpeg', 'png'};

  /// Maximum file size: 10 megabytes (10 * 1024 * 1024 bytes)
  static const int maxFileSizeBytes = 10 * 1024 * 1024;

  /// Validates file extension and size according to security allowlists.
  static void validateFile(String fileName, int fileSizeBytes) {
    final dotIndex = fileName.lastIndexOf('.');
    if (dotIndex == -1) {
      throw ArgumentError('File has no extension. Allowed formats: PDF, JPG, PNG');
    }

    final ext = fileName.substring(dotIndex + 1).toLowerCase();
    if (!allowedExtensions.contains(ext)) {
      throw ArgumentError(
        'Unsupported file format "$ext". Allowed formats: PDF, JPG, PNG',
      );
    }

    if (fileSizeBytes <= 0) {
      throw ArgumentError('File is empty.');
    }

    if (fileSizeBytes > maxFileSizeBytes) {
      throw ArgumentError(
        'File size exceeds the 10MB limit (size: $fileSizeBytes bytes).',
      );
    }
  }

  /// Builds a deterministic, society-scoped storage path:
  /// `societies/{societyId}/{category}/{timestamp}_{sanitizedName}.{ext}`
  static String generateStoragePath({
    required int societyId,
    required String category,
    required String fileName,
  }) {
    final dotIndex = fileName.lastIndexOf('.');
    final ext = dotIndex != -1 ? fileName.substring(dotIndex + 1).toLowerCase() : 'pdf';
    final rawBase = dotIndex != -1 ? fileName.substring(0, dotIndex) : fileName;
    final sanitizedBase = rawBase.replaceAll(RegExp(r'[^a-zA-Z0-9_\-]'), '_');
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final safeCategory = (category == 'nocs') ? 'nocs' : 'documents';

    return 'societies/$societyId/$safeCategory/${timestamp}_$sanitizedBase.$ext';
  }

  /// Strictly validates that the given storage path belongs to the expected society.
  /// Throws [StateError] if cross-society access is attempted.
  static void validateSocietyPath(String storagePath, int expectedSocietyId) {
    final segments = storagePath.split('/');
    if (segments.length < 2 || segments[0] != 'societies') {
      throw ArgumentError('Invalid storage path format: "$storagePath"');
    }

    final pathSocietyId = int.tryParse(segments[1]);
    if (pathSocietyId == null || pathSocietyId != expectedSocietyId) {
      throw StateError(
        'Access denied: Cross-society storage access is prohibited.',
      );
    }
  }

  /// Requests a signed direct upload description from Serverpod cloud storage.
  static Future<String> createUploadDescription(
    Session session, {
    required String path,
    required int fileSizeBytes,
  }) async {
    final description = await session.storage.createDirectFileUploadDescription(
      storageId: 'public',
      path: path,
      maxFileSize: maxFileSizeBytes,
    );

    if (description == null) {
      throw StateError('Failed to generate upload description from cloud storage.');
    }

    return description;
  }

  /// Verifies that direct file upload has succeeded in the storage backend.
  static Future<bool> verifyUpload(Session session, String path) async {
    final verified = await session.storage.verifyDirectFileUpload(
      storageId: 'public',
      path: path,
    );
    if (verified) return true;

    return await session.storage.fileExists(storageId: 'public', path: path);
  }

  /// Resolves the secure download URL.
  /// If S3 credentials are configured, produces an AWS SigV4 presigned GET URL with 15m expiry.
  /// Otherwise falls back to Serverpod's public storage URI.
  static Future<String> getDownloadUrl(Session session, String storagePath) async {
    final s3Bucket = session.server.serverpod.getPassword('s3Bucket');
    final s3Key = session.server.serverpod.getPassword('s3AccessKeyId');
    final s3Secret = session.server.serverpod.getPassword('s3SecretAccessKey');
    final s3Region = session.server.serverpod.getPassword('s3Region') ?? 'ap-south-1';
    final s3Endpoint = session.server.serverpod.getPassword('s3Endpoint');

    if (s3Bucket != null &&
        s3Key != null &&
        s3Secret != null &&
        s3Key.isNotEmpty &&
        s3Secret.isNotEmpty) {
      return _generateS3PresignedGetUrl(
        accessKey: s3Key,
        secretKey: s3Secret,
        bucket: s3Bucket,
        region: s3Region,
        endpoint: s3Endpoint ?? 'https://s3.$s3Region.amazonaws.com',
        path: storagePath,
        expiration: const Duration(minutes: 15),
      );
    }

    final publicUri = await session.storage.getPublicUrl(
      storageId: 'public',
      path: storagePath,
    );

    if (publicUri != null) {
      return publicUri.toString();
    }

    final config = session.server.serverpod.config;
    return Uri(
      scheme: config.apiServer.publicScheme,
      host: config.apiServer.publicHost,
      port: config.apiServer.publicPort,
      path: '/serverpod_cloud_storage',
      queryParameters: {
        'method': 'file',
        'path': storagePath,
      },
    ).toString();
  }

  static String _generateS3PresignedGetUrl({
    required String accessKey,
    required String secretKey,
    required String bucket,
    required String region,
    required String endpoint,
    required String path,
    required Duration expiration,
  }) {
    final baseUri = Uri.parse(endpoint);
    final normalizedPath = baseUri.path.endsWith('/')
        ? '${baseUri.path}$bucket/$path'
        : '${baseUri.path}/$bucket/$path';

    final datetime = SigV4.generateDatetime();
    final credentialScope = SigV4.buildCredentialScope(datetime, region, 's3');
    final host = (baseUri.hasPort && baseUri.port != 80 && baseUri.port != 443)
        ? '${baseUri.host}:${baseUri.port}'
        : baseUri.host;

    final queryParams = <String, String>{
      'X-Amz-Algorithm': 'AWS4-HMAC-SHA256',
      'X-Amz-Credential': '$accessKey/$credentialScope',
      'X-Amz-Date': datetime,
      'X-Amz-Expires': expiration.inSeconds.toString(),
      'X-Amz-SignedHeaders': 'host',
    };

    final canonicalQuery = SigV4.buildCanonicalQueryString(queryParams);
    final encodedPath = normalizedPath.split('/').map(Uri.encodeComponent).join('/');

    final canonicalRequest = '''GET
$encodedPath
$canonicalQuery
host:$host

host
UNSIGNED-PAYLOAD''';

    final stringToSign = SigV4.buildStringToSign(
      datetime,
      credentialScope,
      SigV4.hashCanonicalRequest(canonicalRequest),
    );

    final signingKey = SigV4.calculateSigningKey(secretKey, datetime, region, 's3');
    final signature = SigV4.calculateSignature(signingKey, stringToSign);
    queryParams['X-Amz-Signature'] = signature;

    return Uri(
      scheme: baseUri.scheme,
      host: baseUri.host,
      port: baseUri.hasPort ? baseUri.port : null,
      path: normalizedPath,
      queryParameters: queryParams,
    ).toString();
  }
}
