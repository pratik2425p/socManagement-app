import 'package:flutter/material.dart';
import '../../../../core/core.dart';

/// Wizard Step 2: Wings & Bulk Flats Generator
class Step2WingsFlats extends StatelessWidget {
  final TextEditingController wingNameController;
  final TextEditingController floorsController;
  final TextEditingController flatsPerFloorController;
  final List<String> generatedFlats;
  final VoidCallback onGenerateFlats;
  final VoidCallback onClearFlats;

  const Step2WingsFlats({
    super.key,
    required this.wingNameController,
    required this.floorsController,
    required this.flatsPerFloorController,
    required this.generatedFlats,
    required this.onGenerateFlats,
    required this.onClearFlats,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(
          title: 'Wings & Flat Inventory',
          subtitle: 'Auto-generate flat numbering across floors and wings',
          padding: EdgeInsets.zero,
        ),
        AppSpacing.vGapMd,
        AppTextField(
          controller: wingNameController,
          label: 'Wing / Tower Name *',
          hint: 'e.g. Wing A / Tower 1',
          prefixIcon: const Icon(Icons.domain_rounded, size: 20),
        ),
        AppSpacing.vGapMd,
        Row(
          children: [
            Expanded(
              child: AppTextField(
                controller: floorsController,
                label: 'Total Floors *',
                hint: '7',
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(Icons.layers_outlined, size: 20),
              ),
            ),
            AppSpacing.hGapMd,
            Expanded(
              child: AppTextField(
                controller: flatsPerFloorController,
                label: 'Flats / Floor *',
                hint: '4',
                keyboardType: TextInputType.number,
                prefixIcon: const Icon(Icons.grid_view_rounded, size: 20),
              ),
            ),
          ],
        ),
        AppSpacing.vGapLg,
        Row(
          children: [
            Expanded(
              child: AppButton.secondary(
                label: 'Auto-Generate Flats',
                icon: Icons.auto_awesome_rounded,
                onPressed: onGenerateFlats,
              ),
            ),
            if (generatedFlats.isNotEmpty) ...[
              AppSpacing.hGapSm,
              AppButton.outline(
                label: 'Clear',
                onPressed: onClearFlats,
              ),
            ],
          ],
        ),
        AppSpacing.vGapLg,

        if (generatedFlats.isNotEmpty) ...[
          AppSectionHeader(
            title: 'Generated Flats (${generatedFlats.length} Total Units)',
            subtitle: 'Preview of inventory to be saved in PostgreSQL',
          ),
          AppSpacing.vGapSm,
          AppCard(
            child: Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: generatedFlats.map((flat) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.primaryContainer,
                    borderRadius: AppRadii.borderSm,
                    border: Border.all(color: AppColors.primaryNavy.withValues(alpha: 0.2)),
                  ),
                  child: Text(
                    flat,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.primaryNavy),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ],
    );
  }
}
