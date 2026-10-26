/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../amenity/models/booking_status.dart' as _i2;

abstract class AmenityBooking implements _i1.SerializableModel {
  AmenityBooking._({
    this.id,
    required this.societyId,
    required this.amenityId,
    required this.amenityName,
    required this.flatNumber,
    required this.bookedById,
    required this.bookedByName,
    required this.bookingDate,
    required this.slot,
    required this.amountPaid,
    required this.status,
    required this.createdAt,
  });

  factory AmenityBooking({
    int? id,
    required int societyId,
    required int amenityId,
    required String amenityName,
    required String flatNumber,
    required int bookedById,
    required String bookedByName,
    required DateTime bookingDate,
    required String slot,
    required double amountPaid,
    required _i2.BookingStatus status,
    required DateTime createdAt,
  }) = _AmenityBookingImpl;

  factory AmenityBooking.fromJson(Map<String, dynamic> jsonSerialization) {
    return AmenityBooking(
      id: jsonSerialization['id'] as int?,
      societyId: jsonSerialization['societyId'] as int,
      amenityId: jsonSerialization['amenityId'] as int,
      amenityName: jsonSerialization['amenityName'] as String,
      flatNumber: jsonSerialization['flatNumber'] as String,
      bookedById: jsonSerialization['bookedById'] as int,
      bookedByName: jsonSerialization['bookedByName'] as String,
      bookingDate: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['bookingDate'],
      ),
      slot: jsonSerialization['slot'] as String,
      amountPaid: (jsonSerialization['amountPaid'] as num).toDouble(),
      status: _i2.BookingStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int societyId;

  int amenityId;

  String amenityName;

  String flatNumber;

  int bookedById;

  String bookedByName;

  DateTime bookingDate;

  String slot;

  double amountPaid;

  _i2.BookingStatus status;

  DateTime createdAt;

  /// Returns a shallow copy of this [AmenityBooking]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AmenityBooking copyWith({
    int? id,
    int? societyId,
    int? amenityId,
    String? amenityName,
    String? flatNumber,
    int? bookedById,
    String? bookedByName,
    DateTime? bookingDate,
    String? slot,
    double? amountPaid,
    _i2.BookingStatus? status,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AmenityBooking',
      if (id != null) 'id': id,
      'societyId': societyId,
      'amenityId': amenityId,
      'amenityName': amenityName,
      'flatNumber': flatNumber,
      'bookedById': bookedById,
      'bookedByName': bookedByName,
      'bookingDate': bookingDate.toJson(),
      'slot': slot,
      'amountPaid': amountPaid,
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AmenityBookingImpl extends AmenityBooking {
  _AmenityBookingImpl({
    int? id,
    required int societyId,
    required int amenityId,
    required String amenityName,
    required String flatNumber,
    required int bookedById,
    required String bookedByName,
    required DateTime bookingDate,
    required String slot,
    required double amountPaid,
    required _i2.BookingStatus status,
    required DateTime createdAt,
  }) : super._(
         id: id,
         societyId: societyId,
         amenityId: amenityId,
         amenityName: amenityName,
         flatNumber: flatNumber,
         bookedById: bookedById,
         bookedByName: bookedByName,
         bookingDate: bookingDate,
         slot: slot,
         amountPaid: amountPaid,
         status: status,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [AmenityBooking]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AmenityBooking copyWith({
    Object? id = _Undefined,
    int? societyId,
    int? amenityId,
    String? amenityName,
    String? flatNumber,
    int? bookedById,
    String? bookedByName,
    DateTime? bookingDate,
    String? slot,
    double? amountPaid,
    _i2.BookingStatus? status,
    DateTime? createdAt,
  }) {
    return AmenityBooking(
      id: id is int? ? id : this.id,
      societyId: societyId ?? this.societyId,
      amenityId: amenityId ?? this.amenityId,
      amenityName: amenityName ?? this.amenityName,
      flatNumber: flatNumber ?? this.flatNumber,
      bookedById: bookedById ?? this.bookedById,
      bookedByName: bookedByName ?? this.bookedByName,
      bookingDate: bookingDate ?? this.bookingDate,
      slot: slot ?? this.slot,
      amountPaid: amountPaid ?? this.amountPaid,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
