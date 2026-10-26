import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:society_client/society_client.dart';
import 'package:society_flutter/screens/dashboard/guard/modals/sos_alert_dialog.dart';
import 'package:society_flutter/screens/dashboard/resident/modals/gate_bell_modal.dart';
import 'package:society_flutter/services/society_state.dart';

void main() {
  group('Real-Time Event Processing Tests', () {
    test('onGateBellEvent updates existing visitor status in SocietyState', () async {
      final client = Client('http://localhost:8080');
      final state = SocietyState(client: client);

      bool notified = false;
      state.addListener(() => notified = true);

      final event = GateBellEvent(
        visitorId: 99,
        societyId: 1,
        flatNumber: 'A-101',
        visitorName: 'Amazon Courier',
        visitorPhone: '9876543210',
        purpose: 'Delivery',
        status: VisitorStatus.waitingApproval,
        createdAt: DateTime.now(),
      );

      await state.onGateBellEvent(event);
      expect(notified, isTrue);
    });

    test('onSosAlertEvent inserts active SOS alert and updates activeSosAlerts', () async {
      final client = Client('http://localhost:8080');
      final state = SocietyState(client: client);

      bool notified = false;
      state.addListener(() => notified = true);

      final event = SosAlertEvent(
        alertId: 501,
        societyId: 1,
        flatNumber: 'B-204',
        raisedByName: 'Rohan Sharma',
        emergencyType: EmergencyType.medical,
        status: SosStatus.active,
        description: 'Urgent medical ambulance required',
        raisedAt: DateTime.now(),
      );

      await state.onSosAlertEvent(event);
      expect(notified, isTrue);
      expect(state.activeSosAlerts.any((a) => a.id == 501), isTrue);
      expect(state.activeSosAlerts.first.flatNumber, equals('B-204'));

      // Now resolve it
      final resolveEvent = SosAlertEvent(
        alertId: 501,
        societyId: 1,
        flatNumber: 'B-204',
        raisedByName: 'Rohan Sharma',
        emergencyType: EmergencyType.medical,
        status: SosStatus.resolved,
        raisedAt: DateTime.now(),
      );

      await state.onSosAlertEvent(resolveEvent);
      expect(state.activeSosAlerts.any((a) => a.id == 501), isFalse);
    });

    testWidgets('GateBellModal renders visitor details and approval buttons', (tester) async {
      final client = Client('http://localhost:8080');
      final state = SocietyState(client: client);

      final event = GateBellEvent(
        visitorId: 42,
        societyId: 1,
        flatNumber: 'A-101',
        visitorName: 'Delivery Agent',
        visitorPhone: '9820011223',
        purpose: 'Courier',
        vehicleNumber: 'MH-02-CD-5678',
        status: VisitorStatus.waitingApproval,
        createdAt: DateTime.now(),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () => GateBellModal.show(
                    context: context,
                    event: event,
                    state: state,
                  ),
                  child: const Text('Open Modal'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open Modal'));
      await tester.pumpAndSettle();

      expect(find.text('Delivery Agent'), findsOneWidget);
      expect(find.text('COURIER'), findsOneWidget);
      expect(find.text('9820011223'), findsOneWidget);
      expect(find.text('MH-02-CD-5678'), findsOneWidget);
      expect(find.text('Approve Entry'), findsOneWidget);
      expect(find.text('Deny Entry'), findsOneWidget);
    });

    testWidgets('SosAlertDialog renders emergency details and acknowledge button for guard', (tester) async {
      final client = Client('http://localhost:8080');
      final state = SocietyState(client: client);
      state.setActiveUser(
        SocietyUser(
          societyId: 1,
          fullName: 'Security Guard Ramu',
          phone: '9820033333',
          email: 'ramu@guard.in',
          role: UserRole.guard,
          status: 'active',
          createdAt: DateTime.now(),
        ),
      );

      final event = SosAlertEvent(
        alertId: 88,
        societyId: 1,
        flatNumber: 'C-302',
        raisedByName: 'Sunita Roy',
        emergencyType: EmergencyType.fire,
        status: SosStatus.active,
        description: 'Smoke detected in balcony',
        raisedAt: DateTime.now(),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () => SosAlertDialog.show(
                    context: context,
                    event: event,
                    state: state,
                  ),
                  child: const Text('Open SOS Alert'),
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open SOS Alert'));
      await tester.pumpAndSettle();

      expect(find.text('EMERGENCY SOS'), findsOneWidget);
      expect(find.text('Flat C-302'), findsOneWidget);
      expect(find.text('Type: FIRE'), findsOneWidget);
      expect(find.text('URGENT'), findsOneWidget);
      expect(find.text('Acknowledge'), findsOneWidget);
      expect(find.text('Dismiss'), findsOneWidget);
    });
  });
}
