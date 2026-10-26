import 'package:flutter/material.dart';

/// Centralized Corner Radius Tokens
class AppRadii {
  AppRadii._();

  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 28.0;
  static const double full = 999.0;

  // BorderRadius objects
  static const BorderRadius borderXs = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius borderSm = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius borderMd = BorderRadius.all(Radius.circular(md));
  static const BorderRadius borderLg = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius borderXl = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius borderXxl = BorderRadius.all(Radius.circular(xxl));
  static const BorderRadius borderFull = BorderRadius.all(Radius.circular(full));

  // Top/Bottom rounded corners for BottomSheets and Cards
  static const BorderRadius topSheet = BorderRadius.vertical(
    top: Radius.circular(xxl),
  );
  static const BorderRadius topCard = BorderRadius.vertical(
    top: Radius.circular(lg),
  );
  static const BorderRadius bottomCard = BorderRadius.vertical(
    bottom: Radius.circular(lg),
  );
}
