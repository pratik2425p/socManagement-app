import 'package:serverpod/serverpod.dart';
import '../audit/audit_service.dart';
import '../core/auth_context.dart';
import '../generated/protocol.dart';

class AmenityEndpoint extends Endpoint {
  /// List all active amenities for the authenticated user's society (paginated).
  Future<List<Amenity>> getAmenities(
    Session session, {
    int limit = 50,
    int offset = 0,
  }) async {
    final auth = await AuthContext.require(session);

    return await Amenity.db.find(
      session,
      where: (t) => t.societyId.equals(auth.societyId) & t.isActive.equals(true),
      limit: limit,
      offset: offset,
      orderBy: (t) => t.id,
    );
  }

  /// List amenity bookings for the authenticated user's society (paginated).
  Future<List<AmenityBooking>> getBookings(
    Session session, {
    DateTime? date,
    int? amenityId,
    int limit = 50,
    int offset = 0,
  }) async {
    final auth = await AuthContext.require(session);

    final normalizedDate = date != null ? DateTime.utc(date.year, date.month, date.day) : null;

    return await AmenityBooking.db.find(
      session,
      where: (t) {
        var filter = t.societyId.equals(auth.societyId);
        if (amenityId != null) {
          filter = filter & t.amenityId.equals(amenityId);
        }
        if (normalizedDate != null) {
          filter = filter & t.bookingDate.equals(normalizedDate);
        }
        return filter;
      },
      limit: limit,
      offset: offset,
      orderBy: (t) => t.bookingDate,
      orderDescending: true,
    );
  }

  /// Book an amenity slot. Wrapped in a transaction to prevent double-booking.
  /// Generates a server-side audit log entry automatically.
  Future<AmenityBooking> bookSlot(
    Session session, {
    required int amenityId,
    required DateTime date,
    required String slot,
  }) async {
    final auth = await AuthContext.require(session);

    // Verify amenity exists and belongs to the authenticated society
    final amenity = await Amenity.db.findById(session, amenityId);
    if (amenity == null || amenity.societyId != auth.societyId) {
      throw ArgumentError('Amenity not found or cross-society access denied.');
    }

    final normalizedDate = DateTime.utc(date.year, date.month, date.day);

    return await session.db.transaction((tx) async {
      // 1. Verify slot is not double-booked
      final existing = await AmenityBooking.db.findFirstRow(
        session,
        where: (t) =>
            t.societyId.equals(auth.societyId) &
            t.amenityId.equals(amenityId) &
            t.bookingDate.equals(normalizedDate) &
            t.slot.equals(slot) &
            t.status.equals(BookingStatus.confirmed),
        transaction: tx,
      );

      if (existing != null) {
        throw StateError('Slot already booked. Please choose another slot.');
      }

      // 2. Insert booking record
      final booking = AmenityBooking(
        societyId: auth.societyId,
        amenityId: amenityId,
        amenityName: amenity.name,
        flatNumber: auth.flatNumber ?? 'Office',
        bookedById: auth.userId,
        bookedByName: auth.userName,
        bookingDate: normalizedDate,
        slot: slot,
        amountPaid: amenity.rate,
        status: BookingStatus.confirmed,
        createdAt: DateTime.now(),
      );

      final created = await AmenityBooking.db.insertRow(
        session,
        booking,
        transaction: tx,
      );

      // 3. Write immutable server-side AuditLog
      await AuditService.record(
        session,
        societyId: auth.societyId,
        category: AuditCategory.amenity,
        action: 'AMENITY_RESERVED',
        actorId: auth.userId,
        actorName: auth.userName,
        actorRole: auth.role,
        target: '${amenity.name} ($slot)',
        description:
            'Flat ${auth.flatNumber ?? "Office"} reserved ${amenity.name} for ${normalizedDate.toIso8601String().split("T")[0]} ($slot)',
        transaction: tx,
      );

      return created;
    });
  }

  /// Cancel an existing booking. Checks ownership/permissions and writes audit log.
  Future<AmenityBooking> cancelBooking(
    Session session, {
    required int bookingId,
  }) async {
    final auth = await AuthContext.require(session);

    return await session.db.transaction((tx) async {
      final booking = await AmenityBooking.db.findById(session, bookingId, transaction: tx);
      if (booking == null || booking.societyId != auth.societyId) {
        throw ArgumentError('Booking not found or cross-society access denied.');
      }

      // Permissions: Booked resident or committee/admin
      final isOwner = booking.bookedById == auth.userId;
      final isStaff = auth.role == UserRole.chairman ||
          auth.role == UserRole.committee ||
          auth.role == UserRole.admin;

      if (!isOwner && !isStaff) {
        throw StateError('Forbidden: You can only cancel your own bookings.');
      }

      booking.status = BookingStatus.cancelled;
      final updated = await AmenityBooking.db.updateRow(session, booking, transaction: tx);

      // Server-side audit log
      await AuditService.record(
        session,
        societyId: auth.societyId,
        category: AuditCategory.amenity,
        action: 'AMENITY_CANCELLED',
        actorId: auth.userId,
        actorName: auth.userName,
        actorRole: auth.role,
        target: '${booking.amenityName} (${booking.slot})',
        description: 'Booking #$bookingId cancelled by ${auth.userName}',
        transaction: tx,
      );

      return updated;
    });
  }
}
