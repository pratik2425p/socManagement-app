import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';
import 'new_noc_modal.dart';
import 'noc_certificate_modal.dart';

export 'new_noc_modal.dart';
export 'noc_certificate_modal.dart';

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
            final isExpired = DateTime.now().isAfter(noc.leaseEnd);
            final daysUntilExpiry = noc.leaseEnd.difference(DateTime.now()).inDays;

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
                        label: isExpired ? 'EXPIRED' : noc.status.name.toUpperCase(),
                        variant: isExpired ? AppStatusVariant.error : AppStatusVariant.success,
                      ),
                    ],
                  ),
                  AppSpacing.vGapXs,
                  Text(
                    'Phone: ${noc.tenantPhone} • Rent: ₹${noc.monthlyRent.toStringAsFixed(0)}/mo',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text('NOC No: ${noc.nocNumber}', style: const TextStyle(fontSize: 11, color: Colors.grey)),
                  const Divider(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isExpired ? 'Lease Ended' : 'Valid for $daysUntilExpiry days',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: isExpired ? AppColors.error : AppColors.success,
                        ),
                      ),
                      AppButton.text(
                        label: 'View Certificate',
                        onPressed: () => showNocCertificateModal(context, state, noc),
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
