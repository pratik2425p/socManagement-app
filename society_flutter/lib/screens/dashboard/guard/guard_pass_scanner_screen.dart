import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';
import 'widgets/scanner_result_sheet.dart';
import 'widgets/scanner_viewfinder_overlay.dart';

/// Full-screen high-tech QR pass scanner for security guards at the gate
class GuardPassScannerScreen extends StatefulWidget {
  final SocietyState state;

  const GuardPassScannerScreen({super.key, required this.state});

  @override
  State<GuardPassScannerScreen> createState() => _GuardPassScannerScreenState();
}

class _GuardPassScannerScreenState extends State<GuardPassScannerScreen> {
  late MobileScannerController _scannerController;
  bool _isProcessing = false;
  bool _isTorchOn = false;

  @override
  void initState() {
    super.initState();
    _scannerController = MobileScannerController(
      detectionSpeed: DetectionSpeed.normal,
      facing: CameraFacing.back,
      torchEnabled: false,
    );
  }

  @override
  void dispose() {
    _scannerController.dispose();
    super.dispose();
  }

  Future<void> _handleBarcode(BarcodeCapture capture) async {
    if (_isProcessing) return;

    final barcodes = capture.barcodes;
    if (barcodes.isEmpty) return;

    final rawValue = barcodes.first.rawValue;
    if (rawValue == null || rawValue.isEmpty) return;

    setState(() => _isProcessing = true);

    final result = await widget.state.verifyQrPass(rawValue);
    if (!mounted) return;

    if (result.isValid) {
      ScannerResultSheet.show(
        context: context,
        isSuccess: true,
        title: 'PASS VERIFIED - ENTRY GRANTED',
        subtitle: 'Dynamic QR token authenticated for Flat ${result.flatNumber}',
        flatNumber: result.flatNumber,
        icon: Icons.check_circle_rounded,
        iconColor: AppColors.success,
        onDismiss: () => setState(() => _isProcessing = false),
      );
    } else {
      ScannerResultSheet.show(
        context: context,
        isSuccess: false,
        title: 'PASS REJECTED',
        subtitle: result.errorReason ?? 'Unknown verification failure',
        icon: Icons.cancel_rounded,
        iconColor: AppColors.error,
        onDismiss: () => setState(() => _isProcessing = false),
      );
    }
  }

  void _showManualEntryDialog() {
    final codeCtrl = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.dialpad_rounded, color: AppColors.primaryNavy),
            AppSpacing.hGapSm,
            Text('Manual Gate Pass Entry'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter visitor 4-digit passcode or flat number to verify:',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            AppSpacing.vGapMd,
            AppTextField(
              controller: codeCtrl,
              label: '4-Digit Passcode',
              hint: '4219',
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final code = codeCtrl.text.trim();
              Navigator.pop(ctx);
              if (code.isNotEmpty) {
                final success = await widget.state.guardVerifyPasscode(code);
                if (!mounted) return;
                if (success) {
                  ScannerResultSheet.show(
                    context: context,
                    isSuccess: true,
                    title: 'PIN VERIFIED - ENTRY GRANTED',
                    subtitle: 'Passcode $code confirmed valid. Boom barrier opened.',
                    icon: Icons.check_circle_rounded,
                    iconColor: AppColors.success,
                    onDismiss: () => setState(() => _isProcessing = false),
                  );
                } else {
                  ScannerResultSheet.show(
                    context: context,
                    isSuccess: false,
                    title: 'INVALID PIN',
                    subtitle: 'No active pre-approved visit matching passcode $code',
                    icon: Icons.cancel_rounded,
                    iconColor: AppColors.error,
                    onDismiss: () => setState(() => _isProcessing = false),
                  );
                }
              }
            },
            child: const Text('Verify PIN'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Hardware Camera Feed
          MobileScanner(
            controller: _scannerController,
            onDetect: _handleBarcode,
          ),

          // 2. Custom Viewfinder with sweeping laser and corner brackets
          const ScannerViewfinderOverlay(),

          // 3. Top Control Bar (Back, Flashlight, Camera Flip)
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black54,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    const Text(
                      'Gate Pass Scanner',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black54,
                          child: IconButton(
                            icon: Icon(
                              _isTorchOn ? Icons.flash_on_rounded : Icons.flash_off_rounded,
                              color: _isTorchOn ? Colors.amber : Colors.white,
                            ),
                            onPressed: () async {
                              await _scannerController.toggleTorch();
                              setState(() => _isTorchOn = !_isTorchOn);
                            },
                          ),
                        ),
                        AppSpacing.hGapSm,
                        CircleAvatar(
                          backgroundColor: Colors.black54,
                          child: IconButton(
                            icon: const Icon(Icons.flip_camera_ios_rounded, color: Colors.white),
                            onPressed: () => _scannerController.switchCamera(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 4. Bottom Manual Fallback Button
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Align dynamic QR pass within corners',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    AppSpacing.vGapSm,
                    PressScale(
                      child: AppButton(
                        label: 'Enter Flat / PIN Manually',
                        icon: Icons.dialpad_rounded,
                        variant: AppButtonVariant.secondary,
                        isFullWidth: true,
                        onPressed: _showManualEntryDialog,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
