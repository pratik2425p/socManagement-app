import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../../../services/extended_features.dart';
import '../../../../services/society_state.dart';

void showTenancyManagementModal(BuildContext context, SocietyState state) {
  AppBottomSheet.show(
    context: context,
    title: 'Tenant Agreements & NOCs',
    subtitle: 'Flat ${state.currentFlat} • Lease Compliance Records',
    child: _TenancyManagementContent(state: state),
  );
}

class _TenancyManagementContent extends StatelessWidget {
  final SocietyState state;
  const _TenancyManagementContent({required this.state});

  @override
  Widget build(BuildContext context) {
    final nocs = state.tenantNocs.where((n) => n.flatNumber == state.currentFlat).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppButton.secondary(
          label: 'Request New Tenant NOC',
          icon: Icons.add_circle_outline_rounded,
          onPressed: () {
            Navigator.pop(context);
            showNewTenantNocModal(context, state);
          },
        ),
        AppSpacing.vGapLg,

        const AppSectionHeader(title: 'Active Lease & Tenant Records', padding: EdgeInsets.zero),
        AppSpacing.vGapSm,

        if (nocs.isEmpty)
          const AppCard(
            hasShadow: false,
            padding: AppSpacing.insetAllXl,
            child: Center(
              child: Text(
                'No tenant NOCs filed for your flat yet.\nSelf-occupied or no registered tenant.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          )
        else
          ...nocs.map((noc) {
            final isExpired = noc.isExpired;

            return AppCard(
              margin: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(noc.tenantName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      AppStatusChip(
                        label: isExpired ? 'EXPIRED' : noc.status,
                        variant: isExpired ? AppStatusVariant.error : AppStatusVariant.success,
                      ),
                    ],
                  ),
                  AppSpacing.vGapXs,
                  Text('Phone: ${noc.tenantPhone} • Rent: ₹${noc.monthlyRent.toStringAsFixed(0)}/mo', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  Text('NOC No: ${noc.nocNumber}', style: const TextStyle(fontSize: 11, color: Colors.grey)),
                  const Divider(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isExpired ? 'Lease Ended' : 'Valid for ${noc.daysUntilExpiry} days',
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: isExpired ? AppColors.error : AppColors.success),
                      ),
                      AppButton.text(
                        label: 'View Certificate',
                        onPressed: () => showNocCertificateModal(context, noc),
                        height: 36,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
      ],
    );
  }
}

void showNewTenantNocModal(BuildContext context, SocietyState state) {
  AppBottomSheet.show(
    context: context,
    title: 'Apply for Tenant Society NOC',
    subtitle: 'Flat ${state.currentFlat} • Official Committee Verification',
    child: _NewNocFormContent(state: state),
  );
}

class _NewNocFormContent extends StatefulWidget {
  final SocietyState state;
  const _NewNocFormContent({required this.state});

  @override
  State<_NewNocFormContent> createState() => _NewNocFormContentState();
}

class _NewNocFormContentState extends State<_NewNocFormContent> {
  final _formKey = GlobalKey<FormState>();
  final _tenantNameController = TextEditingController();
  final _tenantPhoneController = TextEditingController();
  final _rentController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _tenantNameController.dispose();
    _tenantPhoneController.dispose();
    _rentController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSubmitting = true);

    final newNoc = TenantNocRecord(
      id: 'NOC-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
      societyId: widget.state.currentSociety?.id ?? 1,
      flatNumber: widget.state.currentFlat,
      ownerName: widget.state.currentUserName,
      ownerPhone: '9822011223',
      tenantName: _tenantNameController.text.trim(),
      tenantPhone: _tenantPhoneController.text.trim(),
      leaseStart: DateTime.now(),
      leaseEnd: DateTime.now().add(const Duration(days: 335)),
      monthlyRent: double.tryParse(_rentController.text.trim()) ?? 22000.0,
      nocNumber: 'SOC-NOC-2026-${widget.state.currentFlat}',
    );

    widget.state.tenantNocs.add(newNoc);
    widget.state.auditLogs.insert(
      0,
      AuditLogEntry(
        id: 'LOG-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
        societyId: widget.state.currentSociety?.id ?? 1,
        category: 'Member & Flat',
        action: 'Tenant NOC Issued',
        actorName: widget.state.currentUserName,
        actorRole: 'Resident',
        target: 'Flat ${widget.state.currentFlat}',
        description: 'Issued NOC ${newNoc.nocNumber} to tenant ${newNoc.tenantName}',
      ),
    );

    Navigator.pop(context);
    AppSnackbar.showSuccess(context, '🎉 Tenant NOC approved and issued for Flat ${widget.state.currentFlat}!');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextField(
            controller: _tenantNameController,
            label: 'Tenant Full Name *',
            hint: 'e.g. Rahul Sharma',
            prefixIcon: const Icon(Icons.person_outline, size: 20),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter tenant name' : null,
          ),
          AppSpacing.vGapMd,
          AppTextField(
            controller: _tenantPhoneController,
            label: 'Tenant Mobile Number *',
            hint: 'e.g. 9811223344',
            keyboardType: TextInputType.phone,
            prefixIcon: const Icon(Icons.phone_outlined, size: 20),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter tenant phone' : null,
          ),
          AppSpacing.vGapMd,
          AppTextField(
            controller: _rentController,
            label: 'Monthly Rent (₹) *',
            hint: 'e.g. 24000',
            keyboardType: TextInputType.number,
            prefixIcon: const Icon(Icons.currency_rupee, size: 20),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter rent amount' : null,
          ),
          AppSpacing.vGapXl,
          AppButton.secondary(
            label: 'Issue Society Tenant NOC',
            isLoading: _isSubmitting,
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}

void showNocCertificateModal(BuildContext context, TenantNocRecord noc) {
  AppBottomSheet.show(
    context: context,
    title: '📜 Society Tenancy NOC',
    subtitle: noc.nocNumber,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppCard(
          color: const Color(0xFFF8FAFC),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text('SHREE SAMARTH CHS LTD.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              const Center(
                child: Text('NO OBJECTION CERTIFICATE (TENANT)', style: TextStyle(fontSize: 11, color: Colors.grey)),
              ),
              const Divider(height: 24),
              Text('Flat Number: ${noc.flatNumber}', style: const TextStyle(fontWeight: FontWeight.w600)),
              Text('Registered Owner: ${noc.ownerName}'),
              Text('Tenant Name: ${noc.tenantName}'),
              Text('Lease Validity: ${noc.leaseStart.day}/${noc.leaseStart.month}/${noc.leaseStart.year} to ${noc.leaseEnd.day}/${noc.leaseEnd.month}/${noc.leaseEnd.year}'),
              Text('Monthly Agreed Rent: ₹${noc.monthlyRent.toStringAsFixed(0)}'),
              const Divider(height: 24),
              const Text('The society committee confirms receipt of tenant police verification and issues this official NOC.', style: TextStyle(fontSize: 11, fontStyle: FontStyle.italic)),
            ],
          ),
        ),
        AppSpacing.vGapLg,
        AppButton.primary(
          label: 'Done',
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}
