import 'package:serverpod/serverpod.dart';
import 'package:society_server/src/generated/protocol.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Given Amenity and Tenancy endpoints with authentication', (
    sessionBuilder,
    endpoints,
  ) {
    late Society society1;
    late Society society2;
    late SocietyUser userSoc1;
    late SocietyUser user2Soc1;
    late SocietyUser userSoc2;
    late Amenity amenitySoc1;
    late Amenity amenitySoc2;

    setUp(() async {
      final session = sessionBuilder.build();

      // Clean tables for isolated testing
      await AmenityBooking.db.deleteWhere(session, where: (_) => Constant.bool(true));
      await Amenity.db.deleteWhere(session, where: (_) => Constant.bool(true));
      await AuditLog.db.deleteWhere(session, where: (_) => Constant.bool(true));
      await TenantNoc.db.deleteWhere(session, where: (_) => Constant.bool(true));
      await SocietyUser.db.deleteWhere(session, where: (_) => Constant.bool(true));
      await Society.db.deleteWhere(session, where: (_) => Constant.bool(true));

      // 1. Create Society 1 & Society 2
      society1 = await Society.db.insertRow(
        session,
        Society(
          name: 'Samarth Heights',
          code: 'SAM01',
          address: 'Main Road',
          city: 'Mumbai',
          state: 'Maharashtra',
          pincode: '400001',
          totalFlats: 50,
          subscriptionPlan: 'pro',
          subscriptionStatus: 'active',
          createdAt: DateTime.now(),
        ),
      );

      society2 = await Society.db.insertRow(
        session,
        Society(
          name: 'Green Horizon',
          code: 'GRN02',
          address: 'Hill View',
          city: 'Pune',
          state: 'Maharashtra',
          pincode: '411001',
          totalFlats: 100,
          subscriptionPlan: 'enterprise',
          subscriptionStatus: 'active',
          createdAt: DateTime.now(),
        ),
      );

      // 2. Create Users
      userSoc1 = await SocietyUser.db.insertRow(
        session,
        SocietyUser(
          societyId: society1.id!,
          fullName: 'Aarav Mehta',
          phone: '9800000001',
          email: 'aarav@samarth.test',
          role: UserRole.resident,
          flatNumber: 'A-101',
          status: 'active',
          createdAt: DateTime.now(),
        ),
      );

      user2Soc1 = await SocietyUser.db.insertRow(
        session,
        SocietyUser(
          societyId: society1.id!,
          fullName: 'Rohan Deshmukh',
          phone: '9800000002',
          email: 'rohan@samarth.test',
          role: UserRole.resident,
          flatNumber: 'A-102',
          status: 'active',
          createdAt: DateTime.now(),
        ),
      );

      userSoc2 = await SocietyUser.db.insertRow(
        session,
        SocietyUser(
          societyId: society2.id!,
          fullName: 'Vikram Joshi',
          phone: '9800000003',
          email: 'vikram@horizon.test',
          role: UserRole.resident,
          flatNumber: 'H-901',
          status: 'active',
          createdAt: DateTime.now(),
        ),
      );

      // 3. Create Amenities
      amenitySoc1 = await Amenity.db.insertRow(
        session,
        Amenity(
          societyId: society1.id!,
          name: 'Badminton Court',
          icon: 'sports_tennis',
          capacity: 4,
          rate: 100.0,
          unit: 'per hour',
          timeSlots: ['06:00 AM - 07:00 AM', '07:00 PM - 08:00 PM'],
          description: 'Synthetic court',
          rules: 'Non-marking shoes',
          isActive: true,
          createdAt: DateTime.now(),
        ),
      );

      amenitySoc2 = await Amenity.db.insertRow(
        session,
        Amenity(
          societyId: society2.id!,
          name: 'Olympic Pool',
          icon: 'pool',
          capacity: 30,
          rate: 0.0,
          unit: 'free for residents',
          timeSlots: ['06:00 AM - 08:00 AM'],
          description: 'Heated pool',
          rules: 'Swim cap required',
          isActive: true,
          createdAt: DateTime.now(),
        ),
      );
    });

    test('when user books an amenity slot, then booking and server audit log are created', () async {
      final user1Session = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          userSoc1.id.toString(),
          {},
        ),
      );

      final date = DateTime.utc(2026, 11, 15);
      const slot = '07:00 PM - 08:00 PM';

      final booking = await endpoints.amenity.bookSlot(
        user1Session,
        amenityId: amenitySoc1.id!,
        date: date,
        slot: slot,
      );

      expect(booking.id, isNotNull);
      expect(booking.societyId, society1.id);
      expect(booking.bookedById, userSoc1.id);
      expect(booking.status, BookingStatus.confirmed);

      // Verify server-side audit log was written inside transaction
      final auditLogs = await endpoints.audit.getAuditLogs(
        user1Session,
        category: AuditCategory.amenity,
        limit: 50,
        offset: 0,
      );
      expect(auditLogs.length, 1);
      expect(auditLogs.first.action, 'AMENITY_RESERVED');
      expect(auditLogs.first.actorId, userSoc1.id);
      expect(auditLogs.first.societyId, society1.id);
    });

    test('when a second user attempts to double-book the same slot, then request is rejected', () async {
      final user1Session = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          userSoc1.id.toString(),
          {},
        ),
      );

      final user2Session = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          user2Soc1.id.toString(),
          {},
        ),
      );

      final date = DateTime.utc(2026, 11, 20);
      const slot = '06:00 AM - 07:00 AM';

      // First booking succeeds
      final firstBooking = await endpoints.amenity.bookSlot(
        user1Session,
        amenityId: amenitySoc1.id!,
        date: date,
        slot: slot,
      );
      expect(firstBooking.id, isNotNull);

      // Second booking on the identical slot must fail
      await expectLater(
        () => endpoints.amenity.bookSlot(
          user2Session,
          amenityId: amenitySoc1.id!,
          date: date,
          slot: slot,
        ),
        throwsA(isA<StateError>()),
      );

      // Verify database contains only 1 booking for that slot
      final bookings = await endpoints.amenity.getBookings(
        user1Session,
        date: date,
        amenityId: amenitySoc1.id,
        limit: 50,
        offset: 0,
      );
      expect(bookings.length, 1);
    });

    test('when a user from Society 2 attempts to book Society 1 amenity, cross-society access is denied', () async {
      final crossSocietySession = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          userSoc2.id.toString(),
          {},
        ),
      );

      final date = DateTime.utc(2026, 11, 22);
      const slot = '07:00 PM - 08:00 PM';

      // Attempt to access amenity belonging to Society 1 from Society 2 session
      await expectLater(
        () => endpoints.amenity.bookSlot(
          crossSocietySession,
          amenityId: amenitySoc1.id!,
          date: date,
          slot: slot,
        ),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('when a user from Society 2 calls getAmenities, they only receive their own society amenities', () async {
      final user2Session = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          userSoc2.id.toString(),
          {},
        ),
      );

      final amenities = await endpoints.amenity.getAmenities(
        user2Session,
        limit: 50,
        offset: 0,
      );
      expect(amenities.length, 1);
      expect(amenities.first.id, amenitySoc2.id);
      expect(amenities.first.societyId, society2.id);
      expect(amenities.first.name, 'Olympic Pool');
    });

    test('when cross-society user attempts to cancel another society booking, request is rejected', () async {
      final user1Session = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          userSoc1.id.toString(),
          {},
        ),
      );

      final crossSocietySession = sessionBuilder.copyWith(
        authentication: AuthenticationOverride.authenticationInfo(
          userSoc2.id.toString(),
          {},
        ),
      );

      final booking = await endpoints.amenity.bookSlot(
        user1Session,
        amenityId: amenitySoc1.id!,
        date: DateTime.utc(2026, 11, 25),
        slot: '06:00 AM - 07:00 AM',
      );

      await expectLater(
        () => endpoints.amenity.cancelBooking(
          crossSocietySession,
          bookingId: booking.id!,
        ),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
