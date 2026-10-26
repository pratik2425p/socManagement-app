import 'package:serverpod/serverpod.dart';
import '../audit/audit_service.dart';
import '../core/auth_context.dart';
import '../generated/protocol.dart';
import '../storage/storage_service.dart';

class DocumentEndpoint extends Endpoint {
  /// Fetch all society documents for the authenticated user's society.
  /// Regular residents can only view non-confidential documents.
  Future<List<SocietyDocument>> getDocuments(
    Session session, {
    DocumentCategory? category,
    int limit = 50,
    int offset = 0,
  }) async {
    final auth = await AuthContext.require(session);
    final isCommittee = auth.isCommittee;

    return await SocietyDocument.db.find(
      session,
      where: (t) {
        var filter = t.societyId.equals(auth.societyId);
        if (!isCommittee) {
          filter = filter & t.isCommitteeOnly.equals(false);
        }
        if (category != null) {
          filter = filter & t.category.equals(category);
        }
        return filter;
      },
      limit: limit,
      offset: offset,
      orderBy: (t) => t.uploadedAt,
      orderDescending: true,
    );
  }

  /// Generates a signed direct upload description for cloud storage.
  /// Enforces file type allowlist (PDF, JPG, PNG), size limit (10MB), and per-society paths.
  Future<UploadDescriptionResponse> getUploadDescription(
    Session session, {
    required String fileName,
    required int fileSizeBytes,
    required String category,
  }) async {
    final auth = await AuthContext.require(session);

    StorageService.validateFile(fileName, fileSizeBytes);

    final path = StorageService.generateStoragePath(
      societyId: auth.societyId,
      category: category,
      fileName: fileName,
    );

    final uploadDescription = await StorageService.createUploadDescription(
      session,
      path: path,
      fileSizeBytes: fileSizeBytes,
    );

    return UploadDescriptionResponse(
      uploadDescription: uploadDescription,
      storagePath: path,
    );
  }

  /// Verifies the upload and registers the document in the Society Document Vault.
  /// Emits an append-only audit trail event on the server.
  Future<SocietyDocument> saveDocument(
    Session session, {
    required String title,
    required String description,
    required DocumentCategory category,
    required String storagePath,
    required String fileSize,
    required bool isCommitteeOnly,
  }) async {
    final auth = await AuthContext.require(session);

    StorageService.validateSocietyPath(storagePath, auth.societyId);

    final isVerified = await StorageService.verifyUpload(session, storagePath);
    if (!isVerified) {
      throw StateError('File upload could not be verified in cloud storage.');
    }

    final downloadUrl = await StorageService.getDownloadUrl(session, storagePath);

    final doc = SocietyDocument(
      societyId: auth.societyId,
      title: title,
      description: description,
      category: category,
      storagePath: storagePath,
      fileUrl: downloadUrl,
      fileSize: fileSize,
      uploadedByName: auth.userName,
      isCommitteeOnly: isCommitteeOnly,
      uploadedAt: DateTime.now(),
    );

    final saved = await SocietyDocument.db.insertRow(session, doc);

    await AuditService.record(
      session,
      societyId: auth.societyId,
      category: AuditCategory.governance,
      action: 'DOCUMENT_UPLOADED',
      actorId: auth.userId,
      actorName: auth.userName,
      actorRole: auth.role,
      target: title,
      description: 'Uploaded "$title" (${category.name}) to Document Vault',
    );

    return saved;
  }

  /// Obtains a secure download URL with access check.
  /// Denies access if the caller belongs to a different society or lacks committee rights.
  Future<String> getDownloadUrl(
    Session session, {
    int? documentId,
    String? storagePath,
  }) async {
    final auth = await AuthContext.require(session);

    String resolvedPath;
    if (documentId != null) {
      final doc = await SocietyDocument.db.findById(session, documentId);
      if (doc == null) {
        throw ArgumentError('Document not found with ID $documentId');
      }
      if (doc.societyId != auth.societyId) {
        throw StateError('Access denied: Cross-society document access is prohibited.');
      }
      if (doc.isCommitteeOnly && !auth.isCommittee) {
        throw StateError('Access denied: Confidential document requires committee role.');
      }
      resolvedPath = doc.storagePath ?? doc.fileUrl;
    } else if (storagePath != null) {
      StorageService.validateSocietyPath(storagePath, auth.societyId);
      resolvedPath = storagePath;
    } else {
      throw ArgumentError('Either documentId or storagePath must be provided.');
    }

    return await StorageService.getDownloadUrl(session, resolvedPath);
  }

  /// Fetch meeting minutes (AGM / EGM / Managing Committee)
  Future<List<MeetingMinutes>> getMeetingMinutes(
    Session session, {
    int limit = 50,
    int offset = 0,
  }) async {
    final auth = await AuthContext.require(session);

    return await MeetingMinutes.db.find(
      session,
      where: (t) => t.societyId.equals(auth.societyId),
      limit: limit,
      offset: offset,
      orderBy: (t) => t.meetingDate,
      orderDescending: true,
    );
  }

  /// Record new meeting minutes (Committee / Admin only)
  Future<MeetingMinutes> recordMeetingMinutes(
    Session session,
    MeetingMinutes minutes,
  ) async {
    final auth = await AuthContext.require(session);
    if (!auth.isCommittee) {
      throw StateError('Access denied: Only committee members can record meeting minutes.');
    }

    final sanitizedMinutes = minutes.copyWith(
      societyId: auth.societyId,
      recordedByName: auth.userName,
      createdAt: DateTime.now(),
    );

    return await MeetingMinutes.db.insertRow(session, sanitizedMinutes);
  }
}
