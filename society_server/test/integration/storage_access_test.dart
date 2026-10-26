import 'dart:typed_data';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:society_server/src/generated/protocol.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod(
    'Given Cloud Storage, Access Check and Cross-Society Isolation',
    (sessionBuilder, endpoints) {
      late Society society1, society2;
      late SocietyUser residentSociety1, chairmanSociety1, residentSociety2;

      setUpAll(() async {
        AuthServices.set(tokenManagerBuilders: [JwtConfigFromPasswords()]);
      });

      setUp(() async {
        final session = sessionBuilder.build();
        await TenantNoc.db.deleteWhere(session, where: (_) => Constant.bool(true));
        await AuditLog.db.deleteWhere(session, where: (_) => Constant.bool(true));
        await SocietyDocument.db.deleteWhere(session, where: (_) => Constant.bool(true));
        await SocietyUser.db.deleteWhere(session, where: (_) => Constant.bool(true));
        await Society.db.deleteWhere(session, where: (_) => Constant.bool(true));

        society1 = await Society.db.insertRow(
          session,
          Society(
            name: 'Emerald Heights CHS',
            code: 'EH01',
            address: 'Bandra West',
            city: 'Mumbai',
            state: 'Maharashtra',
            pincode: '400050',
            totalFlats: 80,
            subscriptionPlan: 'pro',
            subscriptionStatus: 'active',
            registrationNumber: 'MAH/MUM/2021/456',
            gstin: '27AABCU1234A1Z1',
            createdAt: DateTime.now(),
          ),
        );

        society2 = await Society.db.insertRow(
          session,
          Society(
            name: 'Silver Oak CHS',
            code: 'SO02',
            address: 'Kalyan',
            city: 'Thane',
            state: 'Maharashtra',
            pincode: '421301',
            totalFlats: 50,
            subscriptionPlan: 'basic',
            subscriptionStatus: 'active',
            createdAt: DateTime.now(),
          ),
        );

        residentSociety1 = await SocietyUser.db.insertRow(
          session,
          SocietyUser(
            societyId: society1.id!,
            fullName: 'Aarav Patel',
            phone: '9820011221',
            email: 'aarav@emerald.in',
            role: UserRole.resident,
            flatNumber: 'A-101',
            status: 'active',
            createdAt: DateTime.now(),
          ),
        );

        chairmanSociety1 = await SocietyUser.db.insertRow(
          session,
          SocietyUser(
            societyId: society1.id!,
            fullName: 'Vikram Mehta',
            phone: '9820011222',
            email: 'vikram@emerald.in',
            role: UserRole.chairman,
            flatNumber: 'A-102',
            status: 'active',
            createdAt: DateTime.now(),
          ),
        );

        residentSociety2 = await SocietyUser.db.insertRow(
          session,
          SocietyUser(
            societyId: society2.id!,
            fullName: 'Rohan Sharma',
            phone: '9833011223',
            email: 'rohan@silveroak.in',
            role: UserRole.resident,
            flatNumber: 'B-301',
            status: 'active',
            createdAt: DateTime.now(),
          ),
        );
      });

      TestSessionBuilder sessionFor(SocietyUser user) => sessionBuilder.copyWith(
            authentication: AuthenticationOverride.authenticationInfo(user.phone, {}),
          );

      test('File type and size allowlist rejects invalid extensions and oversized files', () async {
        final session = sessionFor(residentSociety1);
        await expectLater(
          () => endpoints.document.getUploadDescription(
            session,
            fileName: 'malware.exe',
            fileSizeBytes: 1024,
            category: 'documents',
          ),
          throwsA(isA<ArgumentError>().having((e) => e.message, 'message', contains('Unsupported file format'))),
        );

        await expectLater(
          () => endpoints.document.getUploadDescription(
            session,
            fileName: 'large_video.pdf',
            fileSizeBytes: 15 * 1024 * 1024,
            category: 'documents',
          ),
          throwsA(isA<ArgumentError>().having((e) => e.message, 'message', contains('10MB limit'))),
        );
      });

      test('Upload description generates deterministic per-society paths', () async {
        final session = sessionFor(residentSociety1);
        final uploadResp = await endpoints.document.getUploadDescription(
          session,
          fileName: 'annual_audit_report.pdf',
          fileSizeBytes: 1024 * 1024,
          category: 'documents',
        );

        expect(uploadResp.storagePath, startsWith('societies/${society1.id}/documents/'));
        expect(uploadResp.storagePath, endsWith('.pdf'));
        expect(uploadResp.uploadDescription, isNotEmpty);
      });

      test('User from another society cannot get a download URL for a society document', () async {
        final dbSession = sessionBuilder.build();
        final storagePath = 'societies/${society1.id}/documents/byelaws_2026.pdf';
        await dbSession.storage.storeFile(
          storageId: 'public',
          path: storagePath,
          byteData: ByteData.sublistView(Uint8List.fromList([1, 2, 3, 4])),
        );

        final docSociety1 = await SocietyDocument.db.insertRow(
          dbSession,
          SocietyDocument(
            societyId: society1.id!,
            title: 'Society Bye Laws 2026',
            description: 'Official society rules and governance guidelines.',
            category: DocumentCategory.byeLaws,
            storagePath: storagePath,
            fileUrl: '/serverpod_cloud_storage?method=file&path=$storagePath',
            fileSize: '1.2 MB',
            uploadedByName: 'Secretary Office',
            isCommitteeOnly: false,
            uploadedAt: DateTime.now(),
          ),
        );

        final user1Session = sessionFor(residentSociety1);
        final downloadUrl1 = await endpoints.document.getDownloadUrl(user1Session, documentId: docSociety1.id);
        expect(Uri.decodeFull(downloadUrl1), contains(storagePath));

        // CRITICAL SECURITY TEST: Cross-society download rejected
        final user2Session = sessionFor(residentSociety2);
        await expectLater(
          () => endpoints.document.getDownloadUrl(user2Session, documentId: docSociety1.id),
          throwsA(isA<StateError>().having((e) => e.message, 'message', contains('Cross-society document access is prohibited'))),
        );

        await expectLater(
          () => endpoints.document.getDownloadUrl(user2Session, storagePath: storagePath),
          throwsA(isA<StateError>().having((e) => e.message, 'message', contains('Cross-society storage access is prohibited'))),
        );
      });

      test('Confidential documents are restricted to committee members', () async {
        final dbSession = sessionBuilder.build();
        final storagePath = 'societies/${society1.id}/documents/internal_audit.pdf';

        final confidentialDoc = await SocietyDocument.db.insertRow(
          dbSession,
          SocietyDocument(
            societyId: society1.id!,
            title: 'Internal Committee Financial Audit',
            description: 'Privileged internal audit documentation.',
            category: DocumentCategory.auditReport,
            storagePath: storagePath,
            fileUrl: '/serverpod_cloud_storage?method=file&path=$storagePath',
            fileSize: '850 KB',
            uploadedByName: 'Treasurer',
            isCommitteeOnly: true,
            uploadedAt: DateTime.now(),
          ),
        );

        final residentSession = sessionFor(residentSociety1);
        await expectLater(
          () => endpoints.document.getDownloadUrl(residentSession, documentId: confidentialDoc.id),
          throwsA(isA<StateError>().having((e) => e.message, 'message', contains('Confidential document requires committee role'))),
        );

        final chairmanSession = sessionFor(chairmanSociety1);
        final url = await endpoints.document.getDownloadUrl(chairmanSession, documentId: confidentialDoc.id);
        expect(Uri.decodeFull(url), contains(storagePath));
      });

      test('Tenancy NOC submission with cross-society document path is rejected', () async {
        final session = sessionFor(residentSociety1);
        final crossSocietyPath = 'societies/${society2.id}/nocs/lease_agreement.pdf';

        await expectLater(
          () => endpoints.tenancy.submitNoc(
            session,
            flatNumber: 'A-101',
            ownerName: 'Aarav Patel',
            ownerPhone: '9820011221',
            tenantName: 'Kunal Verma',
            tenantPhone: '9811223344',
            leaseStart: DateTime.now(),
            leaseEnd: DateTime.now().add(const Duration(days: 365)),
            monthlyRent: 35000.0,
            documentPath: crossSocietyPath,
          ),
          throwsA(isA<StateError>().having((e) => e.message, 'message', contains('Cross-society storage access is prohibited'))),
        );

        final validPath = 'societies/${society1.id}/nocs/lease_agreement.pdf';
        final noc = await endpoints.tenancy.submitNoc(
          session,
          flatNumber: 'A-101',
          ownerName: 'Aarav Patel',
          ownerPhone: '9820011221',
          tenantName: 'Kunal Verma',
          tenantPhone: '9811223344',
          leaseStart: DateTime.now(),
          leaseEnd: DateTime.now().add(const Duration(days: 365)),
          monthlyRent: 35000.0,
          documentPath: validPath,
        );

        expect(noc.societyId, equals(society1.id));
        expect(noc.documentPath, equals(validPath));
      });
    },
    rollbackDatabase: RollbackDatabase.disabled,
  );
}
