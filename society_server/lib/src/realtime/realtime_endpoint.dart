import 'package:serverpod/serverpod.dart';
import '../core/auth_context.dart';
import '../generated/protocol.dart';

/// Real-time streaming endpoint for gate bell visitor requests and SOS emergency sirens.
/// Enforces strict server-side authorization so users can only subscribe to their own flat and society.
class RealtimeEndpoint extends Endpoint {
  /// Stream gate-bell visitor requests for the caller's flat.
  /// Enforces that residents can only subscribe to their own assigned flat.
  Stream<GateBellEvent> streamGateBell(
    Session session, {
    String? requestedFlat,
  }) async* {
    final auth = await AuthContext.require(session);
    final userFlat = auth.flatNumber;

    if (requestedFlat != null &&
        requestedFlat != userFlat &&
        !auth.isCommittee &&
        auth.role != UserRole.guard &&
        auth.role != UserRole.admin) {
      throw StateError(
        'Forbidden: Unauthorized flat subscription. You may only subscribe to your flat ($userFlat).',
      );
    }

    final targetFlat = requestedFlat ?? userFlat;
    if (targetFlat == null || targetFlat.isEmpty) {
      throw StateError('User does not have an assigned flat number to stream gate-bell events.');
    }

    final channel = 'society_${auth.societyId}_flat_$targetFlat';
    final stream = session.messages.createStream<GateBellEvent>(channel);
    yield* stream;
  }

  /// Stream emergency SOS alerts for the caller's society.
  /// Enforces that users can only subscribe to their own society's emergency channel.
  Stream<SosAlertEvent> streamSosAlerts(
    Session session, {
    int? requestedSocietyId,
  }) async* {
    final auth = await AuthContext.require(session);

    if (requestedSocietyId != null &&
        requestedSocietyId != auth.societyId &&
        auth.role != UserRole.admin) {
      throw StateError(
        'Forbidden: Unauthorized society subscription. Cross-society stream access is prohibited.',
      );
    }

    final targetSocietyId = requestedSocietyId ?? auth.societyId;
    final channel = 'society_${targetSocietyId}_sos';
    final stream = session.messages.createStream<SosAlertEvent>(channel);
    yield* stream;
  }
}
