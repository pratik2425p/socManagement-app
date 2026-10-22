import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../services/society_state.dart';
import '../../theme/app_theme.dart';

class DocumentVaultScreen extends StatefulWidget {
  final SocietyState state;
  const DocumentVaultScreen({super.key, required this.state});

  @override
  State<DocumentVaultScreen> createState() => _DocumentVaultScreenState();
}

class _DocumentVaultScreenState extends State<DocumentVaultScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
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

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final isCommittee = state.currentRole == UserRole.chairman ||
        state.currentRole == UserRole.committee ||
        state.currentRole == UserRole.accountant;

    final visibleDocs = state.documents.where((d) {
      if (!isCommittee && d.isCommitteeOnly) return false;
      if (_selectedCategory != null && d.category != _selectedCategory) return false;
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Society Document Vault & AGM Records'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppTheme.accentTeal,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white.withValues(alpha: 0.7),
          tabs: const [
            Tab(icon: Icon(Icons.folder_shared_outlined), text: 'Official Documents'),
            Tab(icon: Icon(Icons.groups_outlined), text: 'Meeting Minutes (MOM)'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab 1: Documents
          Column(
            children: [
              // Category Filter Bar
              Container(
                height: 54,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                color: Colors.white,
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
                    ? const Center(child: Text('No documents found in this category.'))
                    : ListView.builder(
                        padding: const EdgeInsets.all(14),
                        itemCount: visibleDocs.length,
                        itemBuilder: (ctx, i) {
                          final doc = visibleDocs[i];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 12),
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: AppTheme.primaryNavy.withValues(alpha: 0.1),
                                    child: const Icon(Icons.picture_as_pdf, color: AppTheme.dangerRed),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                doc.title,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                            if (doc.isCommitteeOnly)
                                              Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                                decoration: BoxDecoration(
                                                  color: AppTheme.warningOrange.withValues(alpha: 0.15),
                                                  borderRadius: BorderRadius.circular(4),
                                                ),
                                                child: const Text(
                                                  'CONFIDENTIAL',
                                                  style: TextStyle(
                                                    color: AppTheme.warningOrange,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          doc.description,
                                          style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Text(
                                              'Size: ${doc.fileSize} • Uploaded by ${doc.uploadedByName}',
                                              style: TextStyle(color: Colors.grey.shade600, fontSize: 11),
                                            ),
                                            const Spacer(),
                                            OutlinedButton.icon(
                                              icon: const Icon(Icons.download, size: 14),
                                              label: const Text('Download PDF', style: TextStyle(fontSize: 12)),
                                              style: OutlinedButton.styleFrom(
                                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                                minimumSize: Size.zero,
                                              ),
                                              onPressed: () {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(content: Text('Downloading ${doc.title}...')),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),

          // Tab 2: Meeting Minutes (AGM / EGM)
          ListView.builder(
            padding: const EdgeInsets.all(14),
            itemCount: state.meetingMinutes.length,
            itemBuilder: (ctx, i) {
              final mom = state.meetingMinutes[i];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppTheme.accentTeal.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              mom.meetingType.toUpperCase(),
                              style: const TextStyle(
                                color: AppTheme.accentTeal,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            '${mom.meetingDate.day}/${mom.meetingDate.month}/${mom.meetingDate.year}',
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        mom.meetingTitle,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Agenda: ${mom.agenda}',
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppTheme.borderLight),
                        ),
                        child: Text(
                          mom.minutesSummary,
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.people_alt_outlined, size: 16, color: AppTheme.primaryNavy),
                              const SizedBox(width: 4),
                              Text(
                                '${mom.attendeesCount} Flats Present (Quorum Met)',
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          Text(
                            'Recorded by: ${mom.recordedByName}',
                            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: isCommittee
          ? FloatingActionButton.extended(
              backgroundColor: AppTheme.primaryNavy,
              icon: const Icon(Icons.upload_file, color: Colors.white),
              label: const Text('Upload Document', style: TextStyle(color: Colors.white)),
              onPressed: () => _showUploadDialog(context),
            )
          : null,
    );
  }

  Widget _buildCategoryChip(String label, DocumentCategory? cat) {
    final isSelected = _selectedCategory == cat;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        selected: isSelected,
        label: Text(label),
        selectedColor: AppTheme.primaryNavy.withValues(alpha: 0.15),
        labelStyle: TextStyle(
          color: isSelected ? AppTheme.primaryNavy : Colors.grey.shade700,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 12,
        ),
        onSelected: (_) => setState(() => _selectedCategory = cat),
      ),
    );
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
          title: const Text('Upload Society Document'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleCtrl,
                  decoration: const InputDecoration(labelText: 'Document Title'),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<DocumentCategory>(
                  initialValue: category,
                  decoration: const InputDecoration(labelText: 'Category'),
                  items: const [
                    DropdownMenuItem(value: DocumentCategory.byeLaws, child: Text('Society Bye-Laws')),
                    DropdownMenuItem(value: DocumentCategory.auditReport, child: Text('Financial Audit Report')),
                    DropdownMenuItem(value: DocumentCategory.insurance, child: Text('Insurance & Safety NOC')),
                    DropdownMenuItem(value: DocumentCategory.legal, child: Text('Legal & Municipal Notices')),
                    DropdownMenuItem(value: DocumentCategory.circular, child: Text('General Circular')),
                  ],
                  onChanged: (val) => setDialogState(() => category = val!),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: descCtrl,
                  maxLines: 2,
                  decoration: const InputDecoration(labelText: 'Description / Purpose'),
                ),
                const SizedBox(height: 12),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Confidential (Committee Only)'),
                  value: isConfidential,
                  onChanged: (val) => setDialogState(() => isConfidential = val ?? false),
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
                if (titleCtrl.text.isNotEmpty) {
                  widget.state.uploadDocument(
                    title: titleCtrl.text,
                    description: descCtrl.text,
                    category: category,
                    fileSize: '1.2 MB',
                    isCommitteeOnly: isConfidential,
                  );
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Document Saved to Society Vault!')),
                  );
                }
              },
              child: const Text('Upload & Save'),
            ),
          ],
        ),
      ),
    );
  }
}
