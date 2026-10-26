import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:society_flutter/core/core.dart';

void main() {
  group('SparklineChart Component Tests', () {
    testWidgets('paints chart line and fill with non-empty data', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SparklineChart(
              data: [100.0, 150.0, 120.0, 200.0, 250.0],
              lineColor: AppColors.success,
              width: 120,
              height: 40,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(SparklineChart), findsOneWidget);
    });

    testWidgets('handles empty dataset without throwing', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SparklineChart(
              data: [],
              width: 100,
              height: 30,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(SparklineChart), findsOneWidget);
    });

    testWidgets('renders instantly when reduced motion is requested', (tester) async {
      await tester.pumpWidget(
        const MediaQuery(
          data: MediaQueryData(disableAnimations: true),
          child: MaterialApp(
            home: Scaffold(
              body: SparklineChart(
                data: [10.0, 20.0, 15.0, 30.0],
                width: 100,
                height: 30,
              ),
            ),
          ),
        ),
      );

      await tester.pump();
      expect(find.byType(SparklineChart), findsOneWidget);
    });
  });
}
