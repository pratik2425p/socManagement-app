import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:society_client/society_client.dart';
import '../core/utils/navigation_service.dart';
import '../screens/dashboard/guard/modals/sos_alert_dialog.dart';
import '../screens/dashboard/resident/modals/gate_bell_modal.dart';
import 'society_state.dart';

/// Real-time streaming service for Gate Bell visitor approvals and Emergency SOS sirens.
/// Enforces authorized subscriptions, lifecycle reconnection, and push token management.
class RealtimeService with WidgetsBindingObserver {
  final Client client;
  final SocietyState state;

  StreamSubscription<GateBellEvent>? _gateBellSub;
  StreamSubscription<SosAlertEvent>? _sosSub;
  Timer? _reconnectTimer;
  bool _isSubscribing = false;
  String? _registeredToken;

  RealtimeService({
    required this.client,
    required this.state,
  });

  /// Initialize lifecycle listener and attach state changes
  void init() {
    WidgetsBinding.instance.addObserver(this);
    state.addListener(_onStateChanged);
    _syncSubscriptions();
  }

  /// Dispose subscriptions and lifecycle observer
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    state.removeListener(_onStateChanged);
    stopSubscriptions();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      debugPrint('[RealtimeService] App resumed. Re-verifying subscriptions and refreshing state.');
      _syncSubscriptions();
      this.state.refreshRealtimeData();
    }
  }

  void _onStateChanged() {
    _syncSubscriptions();
  }

  /// Synchronize subscriptions according to current auth and flat state
  void _syncSubscriptions() {
    if (!state.isLoggedIn) {
      stopSubscriptions();
      _unregisterDeviceToken();
      return;
    }

    _registerDeviceToken();

    if (_gateBellSub == null && _sosSub == null && !_isSubscribing) {
      startSubscriptions();
    }
  }

  /// Start real-time foreground event streams
  Future<void> startSubscriptions() async {
    if (_isSubscribing) return;
    _isSubscribing = true;
    _reconnectTimer?.cancel();

    try {
      await _subscribeSosAlerts();
      await _subscribeGateBell();
    } catch (e) {
      debugPrint('[RealtimeService] Subscription initial error: $e');
      _scheduleReconnect();
    } finally {
      _isSubscribing = false;
    }
  }

  /// Subscribes to society-wide emergency SOS stream
  Future<void> _subscribeSosAlerts() async {
    await _sosSub?.cancel();
    _sosSub = null;

    try {
      final stream = state.dataSource.streamSosAlerts(
        requestedSocietyId: state.currentSocietyId,
      );

      _sosSub = stream.listen(
        (event) {
          debugPrint('[RealtimeService] Received SOS Alert Event: ${event.emergencyType.name} at Flat ${event.flatNumber}');
          state.onSosAlertEvent(event);

          if (event.status == SosStatus.active) {
            _showSosDialog(event);
          }
        },
        onError: (err) {
          debugPrint('[RealtimeService] SOS stream error: $err');
          _scheduleReconnect();
        },
        onDone: () {
          debugPrint('[RealtimeService] SOS stream closed by server.');
          _scheduleReconnect();
        },
        cancelOnError: false,
      );
    } catch (e) {
      debugPrint('[RealtimeService] Failed to establish SOS stream: $e');
      _scheduleReconnect();
    }
  }

  /// Subscribes to flat-specific gate bell stream (or society gate stream for guards)
  Future<void> _subscribeGateBell() async {
    await _gateBellSub?.cancel();
    _gateBellSub = null;

    final flat = state.currentFlat.trim();

    // Gate bell stream is flat-specific; requires an assigned flat number
    if (flat.isEmpty) {
      debugPrint('[RealtimeService] No flat assigned for current user; skipping gate bell stream.');
      return;
    }

    try {
      final stream = state.dataSource.streamGateBell(
        requestedFlat: flat.isNotEmpty ? flat : null,
      );

      _gateBellSub = stream.listen(
        (event) {
          debugPrint('[RealtimeService] Received Gate Bell Event for Flat ${event.flatNumber}: ${event.visitorName} (${event.status.name})');
          state.onGateBellEvent(event);

          if (event.status == VisitorStatus.waitingApproval) {
            _showGateBellModal(event);
          }
        },
        onError: (err) {
          debugPrint('[RealtimeService] Gate bell stream error: $err');
          _scheduleReconnect();
        },
        onDone: () {
          debugPrint('[RealtimeService] Gate bell stream closed by server.');
          _scheduleReconnect();
        },
        cancelOnError: false,
      );
    } catch (e) {
      debugPrint('[RealtimeService] Failed to establish gate bell stream: $e');
      _scheduleReconnect();
    }
  }

  /// Show incoming gate-bell approval modal
  void _showGateBellModal(GateBellEvent event) {
    final context = NavigationService.currentContext;
    if (context == null) return;

    // Only prompt resident if the visitor is for their flat
    if (state.currentRole == UserRole.resident && event.flatNumber != state.currentFlat) {
      return;
    }

    GateBellModal.show(
      context: context,
      event: event,
      state: state,
    );
  }

  /// Show immediate emergency SOS dialog
  void _showSosDialog(SosAlertEvent event) {
    final context = NavigationService.currentContext;
    if (context == null) return;

    SosAlertDialog.show(
      context: context,
      event: event,
      state: state,
    );
  }

  /// Stop and tear down active streams
  void stopSubscriptions() {
    _reconnectTimer?.cancel();
    _gateBellSub?.cancel();
    _sosSub?.cancel();
    _gateBellSub = null;
    _sosSub = null;
  }

  /// Schedules reconnect with exponential backoff / retry
  void _scheduleReconnect() {
    if (_reconnectTimer?.isActive ?? false) return;
    debugPrint('[RealtimeService] Scheduling stream reconnect in 5 seconds...');
    _reconnectTimer = Timer(const Duration(seconds: 5), () {
      if (state.isLoggedIn) {
        startSubscriptions();
      }
    });
  }

  /// Register FCM push device token for current user
  Future<void> _registerDeviceToken() async {
    final userId = state.currentUserId;
    if (userId == null) return;

    final token = 'fcm_token_usr_${userId}_${defaultTargetPlatform.name}';
    if (_registeredToken == token) return;

    try {
      final success = await state.dataSource.registerDeviceToken(
        deviceToken: token,
        platform: defaultTargetPlatform.name,
      );
      if (success) {
        _registeredToken = token;
        debugPrint('[RealtimeService] Registered device push token: $token');
      }
    } catch (e) {
      debugPrint('[RealtimeService] Error registering device token: $e');
    }
  }

  /// Unregister FCM push device token on logout
  Future<void> _unregisterDeviceToken() async {
    if (_registeredToken == null) return;
    try {
      await state.dataSource.unregisterDeviceToken(deviceToken: _registeredToken!);
      debugPrint('[RealtimeService] Unregistered device push token: $_registeredToken');
    } catch (e) {
      debugPrint('[RealtimeService] Error unregistering device token: $e');
    } finally {
      _registeredToken = null;
    }
  }
}
