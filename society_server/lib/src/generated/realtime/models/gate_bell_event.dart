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
import 'package:serverpod/serverpod.dart' as _i1;
import '../../visitor/models/visitor_status.dart' as _i2;

abstract class GateBellEvent
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  GateBellEvent._({
    required this.visitorId,
    required this.societyId,
    required this.flatNumber,
    required this.visitorName,
    required this.visitorPhone,
    required this.purpose,
    this.vehicleNumber,
    this.imageUrl,
    required this.status,
    required this.createdAt,
  });

  factory GateBellEvent({
    required int visitorId,
    required int societyId,
    required String flatNumber,
    required String visitorName,
    required String visitorPhone,
    required String purpose,
    String? vehicleNumber,
    String? imageUrl,
    required _i2.VisitorStatus status,
    required DateTime createdAt,
  }) = _GateBellEventImpl;

  factory GateBellEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return GateBellEvent(
      visitorId: jsonSerialization['visitorId'] as int,
      societyId: jsonSerialization['societyId'] as int,
      flatNumber: jsonSerialization['flatNumber'] as String,
      visitorName: jsonSerialization['visitorName'] as String,
      visitorPhone: jsonSerialization['visitorPhone'] as String,
      purpose: jsonSerialization['purpose'] as String,
      vehicleNumber: jsonSerialization['vehicleNumber'] as String?,
      imageUrl: jsonSerialization['imageUrl'] as String?,
      status: _i2.VisitorStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  int visitorId;

  int societyId;

  String flatNumber;

  String visitorName;

  String visitorPhone;

  String purpose;

  String? vehicleNumber;

  String? imageUrl;

  _i2.VisitorStatus status;

  DateTime createdAt;

  /// Returns a shallow copy of this [GateBellEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GateBellEvent copyWith({
    int? visitorId,
    int? societyId,
    String? flatNumber,
    String? visitorName,
    String? visitorPhone,
    String? purpose,
    String? vehicleNumber,
    String? imageUrl,
    _i2.VisitorStatus? status,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'GateBellEvent',
      'visitorId': visitorId,
      'societyId': societyId,
      'flatNumber': flatNumber,
      'visitorName': visitorName,
      'visitorPhone': visitorPhone,
      'purpose': purpose,
      if (vehicleNumber != null) 'vehicleNumber': vehicleNumber,
      if (imageUrl != null) 'imageUrl': imageUrl,
      'status': status.toJson(),
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'GateBellEvent',
      'visitorId': visitorId,
      'societyId': societyId,
      'flatNumber': flatNumber,
      'visitorName': visitorName,
      'visitorPhone': visitorPhone,
      'purpose': purpose,
      if (vehicleNumber != null) 'vehicleNumber': vehicleNumber,
      if (imageUrl != null) 'imageUrl': imageUrl,
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

class _GateBellEventImpl extends GateBellEvent {
  _GateBellEventImpl({
    required int visitorId,
    required int societyId,
    required String flatNumber,
    required String visitorName,
    required String visitorPhone,
    required String purpose,
    String? vehicleNumber,
    String? imageUrl,
    required _i2.VisitorStatus status,
    required DateTime createdAt,
  }) : super._(
         visitorId: visitorId,
         societyId: societyId,
         flatNumber: flatNumber,
         visitorName: visitorName,
         visitorPhone: visitorPhone,
         purpose: purpose,
         vehicleNumber: vehicleNumber,
         imageUrl: imageUrl,
         status: status,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [GateBellEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GateBellEvent copyWith({
    int? visitorId,
    int? societyId,
    String? flatNumber,
    String? visitorName,
    String? visitorPhone,
    String? purpose,
    Object? vehicleNumber = _Undefined,
    Object? imageUrl = _Undefined,
    _i2.VisitorStatus? status,
    DateTime? createdAt,
  }) {
    return GateBellEvent(
      visitorId: visitorId ?? this.visitorId,
      societyId: societyId ?? this.societyId,
      flatNumber: flatNumber ?? this.flatNumber,
      visitorName: visitorName ?? this.visitorName,
      visitorPhone: visitorPhone ?? this.visitorPhone,
      purpose: purpose ?? this.purpose,
      vehicleNumber: vehicleNumber is String?
          ? vehicleNumber
          : this.vehicleNumber,
      imageUrl: imageUrl is String? ? imageUrl : this.imageUrl,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
