import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../core/core.dart';
import '../../services/society_state.dart';

/// Redesigned Society Document Vault & Meeting Minutes (MOM)
class DocumentVaultScreen extends StatefulWidget {
  final SocietyState state;
  const DocumentVaultScreen({super.key, required this.state});

  @override
  State<DocumentVaultScreen> createState() => _DocumentVaultScreenState();
}

class _DocumentVaultScreenState extends State<DocumentVaultScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  DocumentCategory? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showUploadDialog(BuildContext context) {
    final titleCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    DocumentCategory category = DocumentCategory.byeLaws;
    bool isConfidential = false;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: const Text('Upload Official Society Document'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextField(
                  controller: titleCtrl,
                  label: 'Document Title *',
                  hint: 'e.g. FY 2025-26 Statutory Audit Report',
                ),
                AppSpacing.vGapMd,
                AppTextField(
                  controller: descCtrl,
                  label: 'Summary / Description *',
                  hint: 'e.g. Conducted by M/s R.K. Joshi & Associates, CA',
                  maxLines: 2,
                ),
                AppSpacing.vGapMd,
                const Text('Document Category *', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                AppSpacing.vGapXs,
                DropdownButtonFormField<DocumentCategory>(
                  initialValue: category,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    border: OutlineInputBorder(borderRadius: AppRadii.borderMd),
                  ),
                  items: DocumentCategory.values.map((c) {
                    return DropdownMenuItem(value: c, child: Text(c.name));
                  }).toList(),
                  onChanged: (v) {
                    if (v != null) setDialogState(() => category = v);
                  },
                ),
                AppSpacing.vGapSm,
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  value: isConfidential,
                  title: const Text('Confidential (Committee Only)', style: TextStyle(fontSize: 13)),
                  activeColor: AppColors.accentTeal,
                  onChanged: (v) => setDialogState(() => isConfidential = v ?? false),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleCtrl.text.trim().isEmpty) return;
                widget.state.uploadDocument(
                  title: titleCtrl.text.trim(),
                  description: descCtrl.text.trim(),
                  category: category,
                  fileSize: '2.4 MB',
                  isCommitteeOnly: isConfidential,
                );
                Navigator.pop(ctx);
                AppSnackbar.showSuccess(context, 'Document uploaded to Vault successfully!');
              },
              child: const Text('Upload to Vault'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isCommittee = state.currentRole == UserRole.chairman ||
        state.currentRole == UserRole.committee ||
        state.currentRole == UserRole.accountant;

    final visibleDocs = state.documents.where((d) {
      if (!isCommittee && d.isCommitteeOnly) return false;
      if (_selectedCategory != null && d.category != _selectedCategory) return false;
      return true;
    }).toList();

    final minutes = state.meetingMinutes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Society Document Vault & AGM Records'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.accentTeal,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(icon: Icon(Icons.folder_shared_outlined), text: 'Official Documents'),
            Tab(icon: Icon(Icons.groups_outlined), text: 'Meeting Minutes (MOM)'),
          ],
        ),
      ),
      body: ResponsiveContainer(
        child: TabBarView(
          controller: _tabController,
          children: [
          // Tab 1: Official Documents
          Column(
            children: [
              // Filter Bar
              Container(
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                color: isDark ? AppColors.surfaceElevatedDark : Colors.white,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryChip('All Docs', null),
                    _buildCategoryChip('Bye-Laws', DocumentCategory.byeLaws),
                    _buildCategoryChip('Audits', DocumentCategory.auditReport),
                    _buildCategoryChip('Insurance & NOC', DocumentCategory.insurance),
                    _buildCategoryChip('Legal', DocumentCategory.legal),
                  ],
                ),
              ),
              const Divider(height: 1),

              Expanded(
                child: visibleDocs.isEmpty
                    ? const AppEmptyState(
                        icon: Icons.folder_off_outlined,
                        title: 'No Documents in Category',
                        message: 'Official papers and audit reports uploaded will show here.',
                      )
                    : ListView.builder(
                        padding: AppSpacing.screenPadding,
                        itemCount: visibleDocs.length,
                        itemBuilder: (ctx, i) {
                          final doc = visibleDocs[i];

                          return AppCard(
                            margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(AppSpacing.sm),
                                  decoration: BoxDecoration(
                                    color: AppColors.errorContainer,
                                    borderRadius: AppRadii.borderSm,
                                  ),
                                  child: const Icon(Icons.picture_as_pdf_rounded, color: AppColors.error, size: 24),
                                ),
                                AppSpacing.hGapMd,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              doc.title,
                                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          if (doc.isCommitteeOnly)
                                            const AppStatusChip.warning(label: 'CONFIDENTIAL'),
                                        ],
                                      ),
                                      AppSpacing.vGapXs,
                                      Text(
                                        doc.description,
                                        style: TextStyle(fontSize: 12, color: AppColors.textSecondary(context), height: 1.3),
                                      ),
                                      AppSpacing.vGapSm,
                                      Text(
                                        'Uploaded by: ${doc.uploadedByName} • ${doc.uploadedAt.day}/${doc.uploadedAt.month}/${doc.uploadedAt.year}',
                                        style: const TextStyle(fontSize: 10, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),

          // Tab 2: Meeting Minutes (MOM)
          minutes.isEmpty
              ? const AppEmptyState(
                  icon: Icons.groups_outlined,
                  title: 'No Meeting Minutes Filed',
                  message: 'AGM and EGM official minutes with quorums will be cataloged here.',
                )
              : ListView.builder(
                  padding: AppSpacing.screenPadding,
                  itemCount: minutes.length,
                  itemBuilder: (ctx, i) {
                    final m = minutes[i];

                    return AppCard(
                      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(m.meetingType, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                              AppStatusChip.info(label: '${m.attendeesCount} Attendees'),
                            ],
                          ),
                          AppSpacing.vGapXs,
                          Text(
                            'Held on: ${m.meetingDate.day}/${m.meetingDate.month}/${m.meetingDate.year} • Recorded by ${m.recordedByName}',
                            style: const TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                          AppSpacing.vGapSm,
                          Text(m.minutesSummary, style: const TextStyle(fontSize: 12, height: 1.4)),
                          if (m.agenda.isNotEmpty) ...[
                            AppSpacing.vGapSm,
                            Container(
                              padding: AppSpacing.insetAllSm,
                              decoration: BoxDecoration(
                                color: isDark ? AppColors.surfaceElevatedDark : const Color(0xFFF1F5F9),
                                borderRadius: AppRadii.borderSm,
                              ),
                              child: Text(
                                'Agenda: ${m.agenda}',
                                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                ),
        ],
      ),
    ),
      floatingActionButton: isCommittee
          ? FloatingActionButton.extended(
              backgroundColor: AppColors.accentTeal,
              foregroundColor: Colors.white,
              icon: const Icon(Icons.upload_file_rounded),
              label: const Text('Upload Document'),
              onPressed: () => _showUploadDialog(context),
            )
          : null,
    );
  }

  Widget _buildCategoryChip(String label, DocumentCategory? cat) {
    final isSelected = _selectedCategory == cat;

    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        selectedColor: AppColors.primaryContainer,
        labelStyle: TextStyle(
          color: isSelected ? AppColors.primaryNavy : AppColors.textSecondary(context),
          fontSize: 11,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
        onSelected: (val) {
          setState(() => _selectedCategory = val ? cat : null);
        },
      ),
    );
  }
}
