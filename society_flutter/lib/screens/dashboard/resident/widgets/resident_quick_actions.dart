import 'package:flutter/material.dart';
import '../../../../core/core.dart';
import '../../../../services/society_state.dart';
import '../../../amenities/amenity_booking_screen.dart';
import '../../../documents/document_vault_screen.dart';
import '../../../polling/polling_screen.dart';
import '../modals/pre_approve_visitor_modal.dart';
import '../modals/raise_complaint_modal.dart';
import '../modals/tenancy_modals.dart';

/// Clean Responsive Grid of Resident Quick Actions
class ResidentQuickActions extends StatelessWidget {
  final SocietyState state;
  const ResidentQuickActions({super.key, required this.state});

  Widget _buildTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppCard(
      onTap: onTap,
      padding: AppSpacing.insetAllMd,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: color.withValues(alpha: isDark ? 0.2 : 0.12),
              borderRadius: AppRadii.borderSm,
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          AppSpacing.vGapSm,
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: TextStyle(fontSize: 10, color: AppColors.textSecondary(context)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(title: 'Quick Community Services', padding: EdgeInsets.zero),
        AppSpacing.vGapSm,
        LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth >= 900;
            final isTablet = constraints.maxWidth >= 560 && constraints.maxWidth < 900;

            final crossAxisCount = isDesktop ? 6 : (isTablet ? 3 : 2);
            final childAspectRatio = isDesktop ? 1.35 : (isTablet ? 1.5 : 1.6);

            return GridView.count(
              crossAxisCount: crossAxisCount,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: AppSpacing.sm,
              crossAxisSpacing: AppSpacing.sm,
              childAspectRatio: childAspectRatio,
              children: [
                _buildTile(
                  context,
                  icon: Icons.qr_code_2_rounded,
                  title: 'Pre-Approve',
                  subtitle: 'Guest / Cab Pass',
                  color: AppColors.primaryNavy,
                  onTap: () => showPreApproveVisitorModal(context, state),
                ),
                _buildTile(
                  context,
                  icon: Icons.sports_tennis_rounded,
                  title: 'Amenities',
                  subtitle: 'Turf & Hall',
                  color: AppColors.accentTeal,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ctx) => AmenityBookingScreen(state: state)),
                  ),
                ),
                _buildTile(
                  context,
                  icon: Icons.vpn_key_rounded,
                  title: 'My Tenancy',
                  subtitle: 'NOC & Agreements',
                  color: const Color(0xFF7C3AED),
                  onTap: () => showTenancyManagementModal(context, state),
                ),
                _buildTile(
                  context,
                  icon: Icons.support_agent_rounded,
                  title: 'Helpdesk',
                  subtitle: 'Raise Complaint',
                  color: const Color(0xFFD97706),
                  onTap: () => showRaiseComplaintModal(context, state),
                ),
                _buildTile(
                  context,
                  icon: Icons.how_to_vote_rounded,
                  title: 'Voting & Polls',
                  subtitle: '1 Flat = 1 Vote',
                  color: AppColors.info,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ctx) => PollingScreen(state: state)),
                  ),
                ),
                _buildTile(
                  context,
                  icon: Icons.folder_shared_rounded,
                  title: 'Document Vault',
                  subtitle: 'Bye-Laws & MOM',
                  color: const Color(0xFF059669),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ctx) => DocumentVaultScreen(state: state)),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
