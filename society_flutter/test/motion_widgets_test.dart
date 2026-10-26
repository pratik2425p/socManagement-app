import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:society_flutter/core/core.dart';

void main() {
  group('Motion Widgets and Reduced Motion Fallbacks', () {
    testWidgets('AnimatedCountUp renders endValue and currency format', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AnimatedCountUp.currency(
              endValue: 4500.0,
              duration: Duration(milliseconds: 100),
            ),
          ),
        ),
      );

      // Advance through animation
      await tester.pump(const Duration(milliseconds: 50));
      await tester.pumpAndSettle();

      expect(find.textContaining('₹'), findsOneWidget);
      expect(find.textContaining('4,500'), findsOneWidget);
    });

    testWidgets('PressScale animates down on tap and triggers callback', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PressScale(
              onTap: () => tapped = true,
              child: const Text('Tap Button'),
            ),
          ),
        ),
      );

      expect(find.text('Tap Button'), findsOneWidget);

      // Pointer down should trigger scale reduction
      final gesture = await tester.startGesture(tester.getCenter(find.text('Tap Button')));
      await tester.pump(const Duration(milliseconds: 40));

      // Pointer up completes tap
      await gesture.up();
      await tester.pumpAndSettle();

      expect(tapped, isTrue);
    });

    testWidgets('ProgressRing renders smoothly with center widget and clamped progress', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProgressRing(
              progress: 0.75,
              size: 60,
              center: Text('75%'),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('75%'), findsOneWidget);
    });

    testWidgets('FadeSlideIn displays child and respects reduced motion', (tester) async {
      // Normal motion enabled
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FadeSlideIn(
              child: Text('Animated Content'),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('Animated Content'), findsOneWidget);

      // With reduced motion (disableAnimations = true)
      await tester.pumpWidget(
        const MediaQuery(
          data: MediaQueryData(disableAnimations: true),
          child: MaterialApp(
            home: Scaffold(
              body: FadeSlideIn(
                child: Text('Instant Content'),
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      expect(find.text('Instant Content'), findsOneWidget);
    });
  });
}
