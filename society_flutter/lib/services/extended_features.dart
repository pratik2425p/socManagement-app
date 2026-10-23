import 'package:flutter/material.dart';

/// Predefined Community Amenities & Facilities
class Amenity {
  final String id;
  final String name;
  final IconData icon;
  final int capacity;
  final double rate; // 0 for complimentary
  final String unit; // per hour / per day / free
  final List<String> timeSlots;
  final String description;
  final String rules;

  const Amenity({
    required this.id,
    required this.name,
    required this.icon,
    required this.capacity,
    required this.rate,
    required this.unit,
    required this.timeSlots,
    required this.description,
    required this.rules,
  });
}

/// Facility Reservation Record
class AmenityBooking {
  final String id;
  final int societyId;
  final String amenityId;
  final String amenityName;
  final String flatNumber;
  final String bookedByName;
  final DateTime bookingDate;
  final String slot;
  final double amountPaid;
  final String status; // 'confirmed', 'cancelled'
  final DateTime createdAt;

  AmenityBooking({
    required this.id,
    required this.societyId,
    required this.amenityId,
    required this.amenityName,
    required this.flatNumber,
    required this.bookedByName,
    required this.bookingDate,
    required this.slot,
    required this.amountPaid,
    this.status = 'confirmed',
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'societyId': societyId,
        'amenityId': amenityId,
        'amenityName': amenityName,
        'flatNumber': flatNumber,
        'bookedByName': bookedByName,
        'bookingDate': bookingDate.toIso8601String(),
        'slot': slot,
        'amountPaid': amountPaid,
        'status': status,
        'createdAt': createdAt.toIso8601String(),
      };
}

/// Immutable Audit Trail Entry (Compliance & Fraud Detection)
class AuditLogEntry {
  final String id;
  final int societyId;
  final String category; // 'Financial', 'Gate & Security', 'Governance', 'Member & Flat', 'Amenity'
  final String action;
  final String actorName;
  final String actorRole;
  final String target;
  final String description;
  final DateTime timestamp;

  AuditLogEntry({
    required this.id,
    required this.societyId,
    required this.category,
    required this.action,
    required this.actorName,
    required this.actorRole,
    required this.target,
    required this.description,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'societyId': societyId,
        'category': category,
        'action': action,
        'actorName': actorName,
        'actorRole': actorRole,
        'target': target,
        'description': description,
        'timestamp': timestamp.toIso8601String(),
      };
}

/// Tenant Agreement & NOC Record
class TenantNocRecord {
  final String id;
  final int societyId;
  final String flatNumber;
  final String ownerName;
  final String ownerPhone;
  final String tenantName;
  final String tenantPhone;
  final DateTime leaseStart;
  final DateTime leaseEnd;
  final double monthlyRent;
  final String nocNumber;
  final String status; // 'Approved', 'Pending Police Verification', 'Expired'
  final DateTime issuedAt;

  TenantNocRecord({
    required this.id,
    required this.societyId,
    required this.flatNumber,
    required this.ownerName,
    required this.ownerPhone,
    required this.tenantName,
    required this.tenantPhone,
    required this.leaseStart,
    required this.leaseEnd,
    required this.monthlyRent,
    required this.nocNumber,
    this.status = 'Approved',
    DateTime? issuedAt,
  }) : issuedAt = issuedAt ?? DateTime.now();

  bool get isExpired => DateTime.now().isAfter(leaseEnd);
  int get daysUntilExpiry => leaseEnd.difference(DateTime.now()).inDays;
}
