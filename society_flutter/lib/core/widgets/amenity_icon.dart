import 'package:flutter/material.dart';

/// Helper to map server-persisted amenity icon strings to Flutter Material icons.
IconData getAmenityIconData(String? iconName) {
  if (iconName == null) return Icons.apartment_rounded;
  switch (iconName.toLowerCase().trim()) {
    case 'pool':
    case 'swimming':
    case 'swimming_pool':
      return Icons.pool_rounded;
    case 'sports_tennis':
    case 'tennis':
    case 'badminton':
    case 'court':
    case 'turf':
      return Icons.sports_tennis_rounded;
    case 'celebration':
    case 'meeting_room':
    case 'clubhouse':
    case 'hall':
    case 'banquet':
      return Icons.celebration_rounded;
    case 'fitness_center':
    case 'gym':
    case 'gymnasium':
    case 'fitness':
      return Icons.fitness_center_rounded;
    case 'deck':
    case 'terrace':
    case 'lounge':
    case 'rooftop':
      return Icons.deck_rounded;
    case 'sports_cricket':
    case 'cricket':
      return Icons.sports_cricket_rounded;
    case 'sports_basketball':
    case 'basketball':
      return Icons.sports_basketball_rounded;
    case 'park':
    case 'garden':
      return Icons.park_rounded;
    case 'spa':
      return Icons.spa_rounded;
    default:
      return Icons.apartment_rounded;
  }
}
