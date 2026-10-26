import 'package:flutter/material.dart';

/// Global Navigation Service providing access to root navigator context
class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext? get currentContext => navigatorKey.currentContext;

  static OverlayState? get overlayState => navigatorKey.currentState?.overlay;
}
