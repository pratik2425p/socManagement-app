import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:society_server/src/generated/protocol.dart';
import 'package:society_server/src/notifications/fcm_service.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod(
    'Given Real-Time Streaming and FCM Push Notifications',
    rollbackDatabase: RollbackDatabase.disabled,
    (sessionBuilder, endpoints) {
      late Society society1, society2;
      late SocietyUser residentFlat101, residentFlat204, residentSociety2, guardSociety1, chairmanSociety1;

      setUpAll(() async {
        AuthServices.set(tokenManagerBuilders: [JwtConfigFromPasswords()]);
      });

      setUp(() async {
        final session = sessionBuilder.build();
        FcmService.sentPayloads.clear();
        await DeviceToken.db.deleteWhere(session, where: (_) => Constant.bool(true));
        await VisitorEntry.db.deleteWhere(session, where: (_) => Constant.bool(true));
        await SosAlert.db.deleteWhere(session, where: (_) => Constant.bool(true));
        await Notice.db.deleteWhere(session, where: (_) => Constant.bool(true));
        await SocietyUser.db.deleteWhere(session, where: (_) => Constant.bool(true));
        await Society.db.deleteWhere(session, where: (_) => Constant.bool(true));

        society1 = await Society.db.insertRow(
          session,
          Society(
            name: 'Grand Horizon Heights',
            code: 'GH01',
            address: 'Worli',
            city: 'Mumbai',
            state: 'Maharashtra',
            pincode: '400018',
            totalFlats: 100,
            subscriptionPlan: 'pro',
            subscriptionStatus: 'active',
            createdAt: DateTime.now(),
          ),
        );

        society2 = await Society.db.insertRow(
          session,
          Society(
            name: 'Palm Meadows',
            code: 'PM02',
            address: 'Whitefield',
            city: 'Bengaluru',
            state: 'Karnataka',
            pincode: '560066',
            totalFlats: 60,
            subscriptionPlan: 'basic',
            subscriptionStatus: 'active',
            createdAt: DateTime.now(),
          ),
        );

        residentFlat101 = await SocietyUser.db.insertRow(
          session,
          SocietyUser(
            societyId: society1.id!,
            fullName: 'Aarav Mehta',
            phone: '9820011111',
            email: 'aarav@horizon.in',
            role: UserRole.resident,
            flatNumber: 'A-101',
            status: 'active',
            createdAt: DateTime.now(),
          ),
        );

        residentFlat204 = await SocietyUser.db.insertRow(
          session,
          SocietyUser(
            societyId: society1.id!,
            fullName: 'Priya Iyer',
            phone: '9820022222',
            email: 'priya@horizon.in',
            role: UserRole.resident,
            flatNumber: 'B-204',
            status: 'active',
            createdAt: DateTime.now(),
          ),
        );

        guardSociety1 = await SocietyUser.db.insertRow(
          session,
          SocietyUser(
            societyId: society1.id!,
            fullName: 'Bahadur Singh',
            phone: '9820033333',
            email: 'guard@horizon.in',
            role: UserRole.guard,
            flatNumber: null,
            status: 'active',
            createdAt: DateTime.now(),
          ),
        );

        chairmanSociety1 = await SocietyUser.db.insertRow(
          session,
          SocietyUser(
            societyId: society1.id!,
            fullName: 'Vikram Patel',
            phone: '9820044444',
            email: 'chairman@horizon.in',
            role: UserRole.chairman,
            flatNumber: 'A-501',
            status: 'active',
            createdAt: DateTime.now(),
          ),
        );

        residentSociety2 = await SocietyUser.db.insertRow(
          session,
          SocietyUser(
            societyId: society2.id!,
            fullName: 'Karthik Rao',
            phone: '9820055555',
            email: 'karthik@palm.in',
            role: UserRole.resident,
            flatNumber: 'C-102',
            status: 'active',
            createdAt: DateTime.now(),
          ),
        );
      });

      TestSessionBuilder sessionFor(SocietyUser user) => sessionBuilder.copyWith(
            authentication: AuthenticationOverride.authenticationInfo(user.phone, {}),
          );

      test('Resident cannot subscribe to another flat gate-bell stream', () async {
        final stream = endpoints.realtime.streamGateBell(
          sessionFor(residentFlat101),
          requestedFlat: 'B-204',
        );

        await expectLater(
          stream,
          emitsError(isA<StateError>().having(
            (e) => e.message,
            'message',
            contains('Unauthorized flat subscription'),
          )),
        );
      });

      test('Resident cannot subscribe to another society SOS stream', () async {
        final stream = endpoints.realtime.streamSosAlerts(
          sessionFor(residentFlat101),
          requestedSocietyId: society2.id,
        );

        await expectLater(
          stream,
          emitsError(isA<StateError>().having(
            (e) => e.message,
            'message',
            contains('Unauthorized society subscription'),
          )),
        );
      });

      test('Resident receives GateBellEvent when visitor arrives at gate', () async {
        final gateStream = endpoints.realtime.streamGateBell(
          sessionFor(residentFlat101),
          requestedFlat: 'A-101',
        );

        final eventFuture = gateStream.first;

        // Guard registers a visitor for Flat A-101
        await endpoints.visitor.createVisitorEntry(
          sessionFor(guardSociety1),
          VisitorEntry(
            societyId: society1.id!,
            flatNumber: 'A-101',
            visitorName: 'Swiggy Delivery',
            phoneNumber: '9898989898',
            purpose: 'Food Delivery',
            vehicleNumber: 'MH-01-AB-1234',
            status: VisitorStatus.waitingApproval,
            entryGate: 'Main Gate 1',
            checkInTime: DateTime.now(),
          ),
        );

        final received = await eventFuture.timeout(const Duration(seconds: 5));
        expect(received.flatNumber, equals('A-101'));
        expect(received.visitorName, equals('Swiggy Delivery'));
        expect(received.purpose, equals('Food Delivery'));
        expect(received.status, equals(VisitorStatus.waitingApproval));
      });

      test('Society 1 users receive SOS alert stream while Society 2 does not', () async {
        final soc1Stream = endpoints.realtime.streamSosAlerts(
          sessionFor(residentFlat101),
          requestedSocietyId: society1.id,
        );
        final soc2Stream = endpoints.realtime.streamSosAlerts(
          sessionFor(residentSociety2),
          requestedSocietyId: society2.id,
        );

        final eventFuture = soc1Stream.first;

        // Raise emergency SOS in Society 1
        await endpoints.sos.raiseSosAlert(
          sessionFor(residentFlat204),
          SosAlert(
            societyId: society1.id!,
            flatNumber: 'B-204',
            raisedByName: 'Priya Iyer',
            emergencyType: EmergencyType.medical,
            status: SosStatus.active,
            description: 'Severe chest pain, urgent ambulance required',
            raisedAt: DateTime.now(),
          ),
        );

        final sosEvent = await eventFuture.timeout(const Duration(seconds: 5));
        expect(sosEvent.societyId, equals(society1.id));
        expect(sosEvent.emergencyType, equals(EmergencyType.medical));
        expect(sosEvent.flatNumber, equals('B-204'));

        // Confirm Society 2's stream receives nothing
        bool soc2Received = false;
        final sub = soc2Stream.listen((_) => soc2Received = true);
        await Future.delayed(const Duration(milliseconds: 150));
        await sub.cancel();
        expect(soc2Received, isFalse);
      });

      test('FCM push notifications set highPriority for GateBell and SOS, normal for Notice', () async {
        final session = sessionBuilder.build();
        // Register token for resident Flat 101
        await DeviceToken.db.insertRow(
          session,
          DeviceToken(
            userId: residentFlat101.id!,
            societyId: society1.id!,
            deviceToken: 'fcm_token_resident_101',
            platform: 'android',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        );

        // 1. Gate Bell: triggers high-priority push
        await endpoints.visitor.createVisitorEntry(
          sessionFor(guardSociety1),
          VisitorEntry(
            societyId: society1.id!,
            flatNumber: 'A-101',
            visitorName: 'Amazon Courier',
            phoneNumber: '9123456780',
            purpose: 'Parcel',
            status: VisitorStatus.waitingApproval,
            entryGate: 'Gate 2',
          ),
        );

        final gatePushes = FcmService.sentPayloads.where((p) => p.data?['type'] == 'gate_bell').toList();
        expect(gatePushes, isNotEmpty);
        expect(gatePushes.first.highPriority, isTrue);

        // 2. SOS: triggers high-priority push
        await endpoints.sos.raiseSosAlert(
          sessionFor(residentFlat101),
          SosAlert(
            societyId: society1.id!,
            flatNumber: 'A-101',
            raisedByName: 'Aarav Mehta',
            emergencyType: EmergencyType.fire,
            status: SosStatus.active,
            description: 'Fire detected in kitchen',
            raisedAt: DateTime.now(),
          ),
        );

        final sosPushes = FcmService.sentPayloads.where((p) => p.data?['type'] == 'sos_alert').toList();
        expect(sosPushes, isNotEmpty);
        expect(sosPushes.first.highPriority, isTrue);

        // 3. Society Notice: triggers normal priority push
        await endpoints.communication.createNotice(
          sessionFor(chairmanSociety1),
          Notice(
            societyId: society1.id!,
            title: 'Water Supply Maintenance',
            content: 'Water supply will be paused from 2 PM to 5 PM tomorrow.',
            category: 'maintenance',
            priority: 'medium',
            postedByName: 'Vikram Patel',
            postedAt: DateTime.now(),
          ),
        );

        final noticePushes = FcmService.sentPayloads.where((p) => p.data?['type'] == 'notice').toList();
        expect(noticePushes, isNotEmpty);
        expect(noticePushes.first.highPriority, isFalse);
      });

      test('Device token registration, unregistration, and stale token cleanup', () async {
        final residentSession = sessionFor(residentFlat101);

        // Register token
        final registered = await endpoints.notification.registerDeviceToken(
          residentSession,
          deviceToken: 'token_abc_123',
          platform: 'ios',
        );
        expect(registered, isTrue);

        final session = sessionBuilder.build();
        final found = await DeviceToken.db.findFirstRow(
          session,
          where: (t) => t.deviceToken.equals('token_abc_123'),
        );
        expect(found, isNotNull);
        expect(found!.platform, equals('ios'));

        // Insert a stale token (120 days old)
        await DeviceToken.db.insertRow(
          session,
          DeviceToken(
            userId: residentFlat204.id!,
            societyId: society1.id!,
            deviceToken: 'old_stale_token_999',
            platform: 'android',
            createdAt: DateTime.now().subtract(const Duration(days: 120)),
            updatedAt: DateTime.now().subtract(const Duration(days: 120)),
          ),
        );

        // Purge tokens older than 90 days via committee session
        final purgedCount = await endpoints.notification.cleanupStaleTokens(
          sessionFor(chairmanSociety1),
          olderThanDays: 90,
        );
        expect(purgedCount, equals(1));

        final staleToken = await DeviceToken.db.findFirstRow(
          session,
          where: (t) => t.deviceToken.equals('old_stale_token_999'),
        );
        expect(staleToken, isNull);

        // Unregister active token
        await endpoints.notification.unregisterDeviceToken(
          residentSession,
          deviceToken: 'token_abc_123',
        );

        final activeAfterUnregister = await DeviceToken.db.findFirstRow(
          session,
          where: (t) => t.deviceToken.equals('token_abc_123'),
        );
        expect(activeAfterUnregister, isNull);
      });
    },
  );
}
