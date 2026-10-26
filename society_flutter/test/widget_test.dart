import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:society_flutter/core/widgets/amenity_icon.dart';

void main() {
  group('Amenity Icon Tests', () {
    test('maps pool icon correctly', () {
      expect(getAmenityIconData('pool'), Icons.pool_rounded);
      expect(getAmenityIconData('swimming_pool'), Icons.pool_rounded);
    });

    test('maps sports court icons correctly', () {
      expect(getAmenityIconData('sports_tennis'), Icons.sports_tennis_rounded);
      expect(getAmenityIconData('badminton'), Icons.sports_tennis_rounded);
    });

    test('maps fallback icon for unknown names', () {
      expect(getAmenityIconData(null), Icons.apartment_rounded);
      expect(getAmenityIconData('unknown_xyz'), Icons.apartment_rounded);
    });
  });
}
