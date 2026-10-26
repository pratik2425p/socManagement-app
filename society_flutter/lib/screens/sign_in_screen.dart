import 'dart:async';
import 'package:flutter/material.dart';
import '../core/core.dart';
import '../services/society_state.dart';
import 'auth/widgets/otp_verification_view.dart';
import 'auth/widgets/phone_input_view.dart';

enum SignInStep { phone, otp }

/// Production-ready SMS OTP Sign-In Screen with Pinput, Cooldown & Lockout
class SignInScreen extends StatefulWidget {
  final SocietyState state;
  final Widget? child;
  final VoidCallback? onAuthenticated;

  const SignInScreen({
    super.key,
    required this.state,
    this.child,
    this.onAuthenticated,
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _phoneController = TextEditingController();
  final _pinController = TextEditingController();
  final _pinFocusNode = FocusNode();

  SignInStep _step = SignInStep.phone;
  bool _isLoading = false;
  int _cooldownSeconds = 0;
  Timer? _cooldownTimer;
  String? _errorMessage;
  int? _attemptsRemaining;
  bool _isLockedOut = false;

  @override
  void initState() {
    super.initState();
    widget.state.addListener(_onStateChange);
  }

  @override
  void dispose() {
    widget.state.removeListener(_onStateChange);
    _cooldownTimer?.cancel();
    _phoneController.dispose();
    _pinController.dispose();
    _pinFocusNode.dispose();
    super.dispose();
  }

  void _onStateChange() {
    if (mounted) setState(() {});
  }

  void _startCooldown(int seconds) {
    _cooldownTimer?.cancel();
    setState(() => _cooldownSeconds = seconds);
    _cooldownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_cooldownSeconds <= 1) {
        timer.cancel();
        setState(() => _cooldownSeconds = 0);
      } else {
        setState(() => _cooldownSeconds--);
      }
    });
  }

  Future<void> _sendOtp() async {
    final phone = _phoneController.text.trim();
    if (phone.length < 10) {
      setState(() => _errorMessage = 'Please enter a valid 10-digit mobile number');
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final result = await widget.state.sendOtp(phone);

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (result.success) {
      setState(() {
        _step = SignInStep.otp;
        _isLockedOut = false;
        _attemptsRemaining = null;
        _errorMessage = null;
      });
      _startCooldown(result.cooldownSeconds > 0 ? result.cooldownSeconds : 60);
      AppSnackbar.showSuccess(context, result.message);
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) _pinFocusNode.requestFocus();
      });
    } else {
      setState(() => _errorMessage = result.message);
      AppSnackbar.showError(context, result.message);
    }
  }

  Future<void> _verifyOtp(String otp) async {
    if (otp.length < 6) {
      setState(() => _errorMessage = 'Please enter the complete 6-digit OTP');
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final phone = _phoneController.text.trim();
    final res = await widget.state.verifyOtp(phone, otp);

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (res.success) {
      AppSnackbar.showSuccess(context, 'Signed in successfully as ${res.user?.fullName ?? ""}');
      widget.onAuthenticated?.call();
    } else {
      setState(() {
        _errorMessage = res.message;
        _attemptsRemaining = res.attemptsRemaining;
        _isLockedOut = res.isLockedOut ?? false;
      });
      _pinController.clear();
      AppSnackbar.showError(context, res.message ?? 'Verification failed');
    }
  }

  void _changePhone() {
    _cooldownTimer?.cancel();
    setState(() {
      _step = SignInStep.phone;
      _pinController.clear();
      _errorMessage = null;
      _isLockedOut = false;
      _attemptsRemaining = null;
      _cooldownSeconds = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state.isLoggedIn && widget.child != null) {
      return widget.child!;
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: _step == SignInStep.otp
          ? AppAppBar(
              title: 'Verification',
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: _changePhone,
              ),
            )
          : null,
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: _step == SignInStep.phone
              ? PhoneInputView(
                  key: const ValueKey('phone_view'),
                  controller: _phoneController,
                  isLoading: _isLoading,
                  errorMessage: _errorMessage,
                  onSendOtp: _sendOtp,
                  onQuickFill: (phone) {
                    _phoneController.text = phone;
                    _sendOtp();
                  },
                )
              : OtpVerificationView(
                  key: const ValueKey('otp_view'),
                  phone: _phoneController.text.trim(),
                  pinController: _pinController,
                  focusNode: _pinFocusNode,
                  isLoading: _isLoading,
                  cooldownSeconds: _cooldownSeconds,
                  attemptsRemaining: _attemptsRemaining,
                  isLockedOut: _isLockedOut,
                  errorMessage: _errorMessage,
                  onVerify: _verifyOtp,
                  onResend: _sendOtp,
                  onChangePhone: _changePhone,
                ),
        ),
      ),
    );
  }
}
