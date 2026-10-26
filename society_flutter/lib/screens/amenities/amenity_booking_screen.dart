import 'package:flutter/material.dart';
import '../../core/core.dart';
import '../../services/extended_features.dart';
import '../../services/society_state.dart';

/// Redesigned Community Amenities & Sports Turf Booking Screen
class AmenityBookingScreen extends StatefulWidget {
  final SocietyState state;
  const AmenityBookingScreen({super.key, required this.state});

  @override
  State<AmenityBookingScreen> createState() => _AmenityBookingScreenState();
}

class _AmenityBookingScreenState extends State<AmenityBookingScreen> {
  Amenity? _selectedAmenity;
  String? _selectedSlot;
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 1));
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    if (widget.state.amenities.isNotEmpty) {
      _selectedAmenity = widget.state.amenities.first;
      if (_selectedAmenity!.timeSlots.isNotEmpty) {
        _selectedSlot = _selectedAmenity!.timeSlots.first;
      }
    }
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 60)),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _confirmBooking() async {
    if (_selectedAmenity == null || _selectedSlot == null) return;

    setState(() => _isSubmitting = true);
    final success = await widget.state.bookAmenity(
      amenityId: _selectedAmenity!.id,
      amenityName: _selectedAmenity!.name,
      date: _selectedDate,
      slot: _selectedSlot!,
      amount: _selectedAmenity!.rate,
    );
    setState(() => _isSubmitting = false);

    if (!mounted) return;

    if (success) {
      AppSnackbar.showSuccess(
        context,
        'Slot reserved successfully for ${_selectedAmenity!.name}!',
      );
    } else {
      AppSnackbar.showError(
        context,
        'Slot already booked or unavailable. Please pick another slot/date.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final amenities = widget.state.amenities;
    final myBookings = widget.state.amenityBookings;

    return Scaffold(
      appBar: AppAppBar(
        title: 'Community Amenities',
        subtitle: 'Banquet Hall, Swimming Pool & Sports Courts',
      ),
      body: SingleChildScrollView(
        padding: AppSpacing.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Available Facilities Carousel
            const AppSectionHeader(
              title: 'Select Facility',
              subtitle: 'Tap to view slot availability and rules',
              padding: EdgeInsets.zero,
            ),
            AppSpacing.vGapSm,
            SizedBox(
              height: 115,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: amenities.length,
                separatorBuilder: (context, index) => AppSpacing.hGapSm,
                itemBuilder: (context, index) {
                  final a = amenities[index];
                  final isSelected = a.id == _selectedAmenity?.id;

                  return AppCard(
                    onTap: () {
                      setState(() {
                        _selectedAmenity = a;
                        _selectedSlot = a.timeSlots.isNotEmpty ? a.timeSlots.first : null;
                      });
                    },
                    width: 140,
                    padding: AppSpacing.insetAllMd,
                    borderColor: isSelected ? AppColors.accentTeal : null,
                    color: isSelected
                        ? (isDark
                            ? AppColors.accentTealDark.withValues(alpha: 0.25)
                            : AppColors.secondaryContainer.withValues(alpha: 0.5))
                        : null,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          a.icon,
                          color: isSelected ? AppColors.accentTeal : AppColors.primaryNavy,
                          size: 28,
                        ),
                        AppSpacing.vGapSm,
                        Text(
                          a.name,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                            color: isSelected
                                ? (isDark ? Colors.white : AppColors.accentTealDark)
                                : AppColors.textPrimary(context),
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            AppSpacing.vGapLg,

            // Selected Amenity Reservation Box
            if (_selectedAmenity != null) ...[
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(_selectedAmenity!.icon, color: AppColors.accentTeal, size: 24),
                        AppSpacing.hGapSm,
                        Expanded(
                          child: Text(
                            _selectedAmenity!.name,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        AppStatusChip(
                          label: _selectedAmenity!.rate == 0
                              ? 'COMPLIMENTARY'
                              : '₹${_selectedAmenity!.rate.toStringAsFixed(0)} ${_selectedAmenity!.unit}',
                          variant: _selectedAmenity!.rate == 0
                              ? AppStatusVariant.success
                              : AppStatusVariant.warning,
                        ),
                      ],
                    ),
                    AppSpacing.vGapSm,
                    Text(
                      _selectedAmenity!.description,
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
                              _selectedAmenity!.rules,
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
                              '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        AppButton.outline(
                          label: 'Change Date',
                          icon: Icons.calendar_today_rounded,
                          height: 38,
                          onPressed: _pickDate,
                        ),
                      ],
                    ),
                    AppSpacing.vGapLg,

                    // Slot Chips
                    const Text('Select Time Slot *', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                    AppSpacing.vGapSm,
                    Wrap(
                      spacing: AppSpacing.sm,
                      runSpacing: AppSpacing.sm,
                      children: _selectedAmenity!.timeSlots.map((slot) {
                        final isSlotSelected = _selectedSlot == slot;
                        return ChoiceChip(
                          label: Text(slot),
                          selected: isSlotSelected,
                          selectedColor: AppColors.primaryContainer,
                          labelStyle: TextStyle(
                            color: isSlotSelected ? AppColors.primaryNavy : AppColors.textSecondary(context),
                            fontWeight: isSlotSelected ? FontWeight.bold : FontWeight.normal,
                            fontSize: 11,
                          ),
                          onSelected: (val) {
                            if (val) setState(() => _selectedSlot = slot);
                          },
                        );
                      }).toList(),
                    ),
                    AppSpacing.vGapXl,

                    AppButton.primary(
                      label: 'Confirm Amenity Reservation',
                      icon: Icons.check_circle_outline_rounded,
                      isLoading: _isSubmitting,
                      isFullWidth: true,
                      onPressed: _confirmBooking,
                    ),
                  ],
                ),
              ),
              AppSpacing.vGapXl,
            ],

            // Recent Bookings List
            const AppSectionHeader(
              title: 'My Reservations',
              subtitle: 'Active amenity passes and schedule',
            ),
            AppSpacing.vGapSm,
            if (myBookings.isEmpty)
              const AppEmptyState(
                icon: Icons.sports_tennis_rounded,
                title: 'No Amenity Bookings',
                message: 'Pick a date and facility above to reserve clubhouse or courts.',
              )
            else
              ...myBookings.map((b) {
                return AppCard(
                  margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(b.amenityName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          const SizedBox(height: 2),
                          Text(
                            '${b.bookingDate.day}/${b.bookingDate.month}/${b.bookingDate.year} • ${b.slot}',
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      AppStatusChip.success(label: b.status),
                    ],
                  ),
                );
              }),
            AppSpacing.vGapXxl,
          ],
        ),
      ),
    );
  }
}
