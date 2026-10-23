import 'package:flutter/material.dart';
import '../../services/extended_features.dart';
import '../../services/society_state.dart';
import '../../theme/app_theme.dart';

class AuditTrailScreen extends StatefulWidget {
  final SocietyState state;
  const AuditTrailScreen({super.key, required this.state});

  @override
  State<AuditTrailScreen> createState() => _AuditTrailScreenState();
}

class _AuditTrailScreenState extends State<AuditTrailScreen> {
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final allLogs = state.auditLogs;

    final filteredLogs = _selectedCategory == 'All'
        ? allLogs
        : allLogs.where((l) => l.category == _selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Society Audit Trail & Logs', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          // Compliance Header Banner
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: const Color(0xFFF8FAFC),
            child: Row(
              children: [
                const Icon(Icons.security, size: 20, color: AppTheme.primaryNavy),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Immutable Audit Log: Records all financial approvals, gate passes, voting, and notices for regulatory compliance.',
                    style: TextStyle(fontSize: 11, color: Color(0xFF334155), fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryNavy.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '${allLogs.length} Events',
                    style: const TextStyle(color: AppTheme.primaryNavy, fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          // Category Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                'All',
                'Financial',
                'Gate & Security',
                'Governance',
                'Member & Flat',
                'Amenity'
              ].map((cat) {
                final isSelected = _selectedCategory == cat;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(cat),
                    selected: isSelected,
                    selectedColor: AppTheme.primaryNavy,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : AppTheme.darkSlate,
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

          // Log List
          Expanded(
            child: filteredLogs.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.history, size: 48, color: Colors.grey.shade400),
                          const SizedBox(height: 12),
                          const Text('No Audit Events Recorded Yet', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                          const SizedBox(height: 6),
                          Text(
                            'Administrative actions like voucher approvals, payments, gate check-ins, and notices will appear here automatically.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredLogs.length,
                    itemBuilder: (ctx, i) {
                      final item = filteredLogs[i];
                      return _buildAuditCard(item);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildAuditCard(AuditLogEntry item) {
    Color badgeColor = AppTheme.primaryNavy;
    IconData badgeIcon = Icons.info_outline;

    switch (item.category) {
      case 'Financial':
        badgeColor = const Color(0xFF0D9488);
        badgeIcon = Icons.account_balance_wallet;
        break;
      case 'Gate & Security':
        badgeColor = const Color(0xFFD97706);
        badgeIcon = Icons.shield;
        break;
      case 'Governance':
        badgeColor = const Color(0xFF4F46E5);
        badgeIcon = Icons.how_to_vote;
        break;
      case 'Member & Flat':
        badgeColor = const Color(0xFF2563EB);
        badgeIcon = Icons.people_alt;
        break;
      case 'Amenity':
        badgeColor = const Color(0xFF059669);
        badgeIcon = Icons.sports_tennis;
        break;
    }

    final timeStr = '${item.timestamp.hour.toString().padLeft(2, '0')}:${item.timestamp.minute.toString().padLeft(2, '0')}';
    final dateStr = '${item.timestamp.day}/${item.timestamp.month}/${item.timestamp.year}';

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: badgeColor.withValues(alpha: 0.15),
                      child: Icon(badgeIcon, size: 14, color: badgeColor),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      item.action.replaceAll('_', ' '),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: badgeColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  '$dateStr $timeStr',
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade500, fontFamily: 'monospace'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              item.description,
              style: const TextStyle(fontSize: 13, color: AppTheme.darkSlate, height: 1.3),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.person, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      '${item.actorName} (${item.actorRole})',
                      style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF475569)),
                    ),
                  ],
                ),
                Text(
                  item.id,
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade400, fontFamily: 'monospace'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
