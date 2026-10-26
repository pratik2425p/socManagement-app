import 'package:flutter/material.dart';
import '../../core/core.dart';
import '../../services/extended_features.dart';
import '../../services/society_state.dart';

/// Redesigned Compliance Audit Trail Screen
class AuditTrailScreen extends StatefulWidget {
  final SocietyState state;
  const AuditTrailScreen({super.key, required this.state});

  @override
  State<AuditTrailScreen> createState() => _AuditTrailScreenState();
}

class _AuditTrailScreenState extends State<AuditTrailScreen> {
  String _selectedCategory = 'All';

  final List<String> _categories = [
    'All',
    'Financial',
    'Gate & Security',
    'Governance',
    'Member & Flat',
    'Amenity',
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final allLogs = widget.state.auditLogs;

    final filteredLogs = _selectedCategory == 'All'
        ? allLogs
        : allLogs.where((l) => l.category == _selectedCategory).toList();

    return Scaffold(
      appBar: AppAppBar(
        title: 'Society Compliance Audit Trail',
        subtitle: 'Statutory log of financial, security & governance actions',
      ),
      body: Column(
        children: [
          // Compliance Banner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: isDark ? AppColors.surfaceElevatedDark : const Color(0xFFF1F5F9),
            child: Row(
              children: [
                const Icon(Icons.security_rounded, size: 20, color: AppColors.accentTeal),
                AppSpacing.hGapMd,
                Expanded(
                  child: Text(
                    'Immutable Audit Trail: All voucher executions, gate check-ins, NOCs, and secret ballots are timestamped.',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                  ),
                ),
                AppSpacing.hGapSm,
                AppStatusChip(
                  label: '${allLogs.length} EVENTS',
                  variant: AppStatusVariant.info,
                ),
              ],
            ),
          ),

          // Category Chips Bar
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: _categories.map((cat) {
                final isSelected = _selectedCategory == cat;
                return Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: ChoiceChip(
                    label: Text(cat),
                    selected: isSelected,
                    selectedColor: AppColors.primaryContainer,
                    labelStyle: TextStyle(
                      color: isSelected ? AppColors.primaryNavy : AppColors.textSecondary(context),
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      fontSize: 12,
                    ),
                    onSelected: (val) {
                      if (val) setState(() => _selectedCategory = cat);
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          const Divider(height: 1),

          // Log Entries List
          Expanded(
            child: filteredLogs.isEmpty
                ? const AppEmptyState(
                    icon: Icons.shield_outlined,
                    title: 'No Audit Records',
                    message: 'Events logged in this category will appear here.',
                  )
                : ListView.builder(
                    padding: AppSpacing.screenPadding,
                    itemCount: filteredLogs.length,
                    itemBuilder: (ctx, i) => _buildAuditCard(context, filteredLogs[i]),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildAuditCard(BuildContext context, AuditLogEntry item) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Color categoryColor;
    IconData categoryIcon;
    switch (item.category) {
      case 'Financial':
        categoryColor = AppColors.success;
        categoryIcon = Icons.account_balance_wallet_rounded;
        break;
      case 'Gate & Security':
        categoryColor = AppColors.warning;
        categoryIcon = Icons.shield_rounded;
        break;
      case 'Governance':
        categoryColor = const Color(0xFF7C3AED);
        categoryIcon = Icons.how_to_vote_rounded;
        break;
      case 'Member & Flat':
        categoryColor = AppColors.accentTeal;
        categoryIcon = Icons.apartment_rounded;
        break;
      default:
        categoryColor = AppColors.primaryNavy;
        categoryIcon = Icons.event_note_rounded;
    }

    return AppCard(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.xs),
                    decoration: BoxDecoration(
                      color: categoryColor.withValues(alpha: 0.15),
                      borderRadius: AppRadii.borderSm,
                    ),
                    child: Icon(categoryIcon, size: 16, color: categoryColor),
                  ),
                  AppSpacing.hGapSm,
                  Text(
                    item.action,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ],
              ),
              AppStatusChip(label: item.category),
            ],
          ),
          AppSpacing.vGapSm,
          Text(
            item.description,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              height: 1.35,
            ),
          ),
          AppSpacing.vGapSm,
          Row(
            children: [
              Text(
                'By: ${item.actorName} (${item.actorRole})',
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.grey),
              ),
              const Spacer(),
              Text(
                '${item.timestamp.hour.toString().padLeft(2, '0')}:${item.timestamp.minute.toString().padLeft(2, '0')} • ${item.timestamp.day}/${item.timestamp.month}',
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
