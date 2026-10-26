import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../../core/core.dart';

/// Interactive reservation card for selecting date, slot, and confirming booking
class AmenityReservationCard extends StatelessWidget {
  final Amenity amenity;
  final DateTime selectedDate;
  final String? selectedSlot;
  final bool isSubmitting;
  final VoidCallback onPickDate;
  final ValueChanged<String> onSlotSelected;
  final VoidCallback onConfirm;

  const AmenityReservationCard({
    super.key,
    required this.amenity,
    required this.selectedDate,
    required this.selectedSlot,
    required this.isSubmitting,
    required this.onPickDate,
    required this.onSlotSelected,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Hero(
                tag: 'amenity_icon_${amenity.id}',
                child: Icon(getAmenityIconData(amenity.icon), color: AppColors.accentTeal, size: 24),
              ),
              AppSpacing.hGapSm,
              Expanded(
                child: Text(
                  amenity.name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              AppStatusChip(
                label: amenity.rate == 0
                    ? 'COMPLIMENTARY'
                    : '₹${amenity.rate.toStringAsFixed(0)} ${amenity.unit}',
                variant: amenity.rate == 0
                    ? AppStatusVariant.success
                    : AppStatusVariant.warning,
              ),
            ],
          ),
          AppSpacing.vGapSm,
          Text(
            amenity.description,
            style: TextStyle(fontSize: 12, color: AppColors.textSecondary(context), height: 1.4),
          ),
          AppSpacing.vGapMd,

          // Rules Box
          Container(
            padding: AppSpacing.insetAllMd,
            decoration: BoxDecoration(
              color: AppColors.warningContainer,
              borderRadius: AppRadii.borderSm,
              border: Border.all(color: AppColors.warningBorder),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.info_outline_rounded, size: 16, color: AppColors.warningDark),
                AppSpacing.hGapSm,
                Expanded(
                  child: Text(
                    amenity.rules,
                    style: const TextStyle(fontSize: 11, color: AppColors.warningDark),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 24),

          // Date Selection
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Reservation Date', style: TextStyle(fontSize: 11, color: Colors.grey)),
                  Text(
                    AppDateTimeFormatter.formatDate(selectedDate),
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              PressScale(
                child: AppButton.outline(
                  label: 'Change Date',
                  icon: Icons.calendar_today_rounded,
                  height: 38,
                  onPressed: onPickDate,
                ),
              ),
            ],
          ),
          AppSpacing.vGapLg,

          // Morphing Slot Picker
          const Text('Select Time Slot *', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          AppSpacing.vGapSm,
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: amenity.timeSlots.map((slot) {
              final isSlotSelected = selectedSlot == slot;
              final isDark = Theme.of(context).brightness == Brightness.dark;

              return PressScale(
                onTap: () => onSlotSelected(slot),
                child: AnimatedContainer(
                  duration: AppMotion.fast,
                  curve: AppMotion.standard,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSlotSelected
                        ? (isDark
                            ? AppColors.primaryNavy
                            : AppColors.primaryNavy)
                        : (isDark ? AppColors.surfaceElevatedDark : AppColors.surfaceLight),
                    borderRadius: isSlotSelected ? AppRadii.borderLg : AppRadii.borderSm,
                    border: Border.all(
                      color: isSlotSelected
                          ? AppColors.accentTeal
                          : (isDark ? AppColors.borderDark : AppColors.borderLight),
                      width: isSlotSelected ? 1.5 : 1.0,
                    ),
                    boxShadow: isSlotSelected ? AppShadows.subtle(context) : null,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isSlotSelected) ...[
                        const Icon(Icons.check_circle_rounded, size: 14, color: AppColors.accentTeal),
                        AppSpacing.hGapXs,
                      ],
                      Text(
                        slot,
                        style: TextStyle(
                          color: isSlotSelected
                              ? Colors.white
                              : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
                          fontWeight: isSlotSelected ? FontWeight.bold : FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          AppSpacing.vGapXl,

          PressScale(
            child: AppButton.primary(
              label: 'Confirm Amenity Reservation',
              icon: Icons.check_circle_outline_rounded,
              isLoading: isSubmitting,
              isFullWidth: true,
              onPressed: onConfirm,
            ),
          ),
        ],
      ),
    );
  }
}
