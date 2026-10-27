import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../core/core.dart';
import '../../services/society_state.dart';
import 'widgets/amenity_reservation_card.dart';

/// Community Amenities & Facility Booking Screen
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
    if (widget.state.amenities.isEmpty) {
      widget.state.loadAmenities().then((_) {
        if (mounted && widget.state.amenities.isNotEmpty) {
          setState(() {
            _selectedAmenity = widget.state.amenities.first;
            _selectedSlot = _selectedAmenity?.timeSlots.firstOrNull;
          });
        }
      });
      widget.state.loadAmenityBookings();
    } else {
      _selectedAmenity = widget.state.amenities.first;
      _selectedSlot = _selectedAmenity?.timeSlots.firstOrNull;
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
      amenityId: _selectedAmenity!.id ?? 1,
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

    if (_selectedAmenity == null && amenities.isNotEmpty) {
      _selectedAmenity = amenities.first;
      _selectedSlot ??= _selectedAmenity?.timeSlots.firstOrNull;
    }

    return Scaffold(
      appBar: const AppAppBar(
        title: 'Community Amenities',
        subtitle: 'Banquet Hall, Swimming Pool & Sports Courts',
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await widget.state.loadAmenities();
          await widget.state.loadAmenityBookings();
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          padding: AppSpacing.screenPadding,
          child: ResponsiveContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppSectionHeader(
                  title: 'Select Facility',
                  subtitle: 'Tap to view slot availability and rules',
                  padding: EdgeInsets.zero,
                ),
                AppSpacing.vGapSm,
                if (amenities.isEmpty && widget.state.isLoading)
                  const AppSkeleton(width: double.infinity, height: 115, borderRadius: AppRadii.borderMd)
                else if (amenities.isEmpty)
                  const AppEmptyState(
                    icon: Icons.sports_tennis_rounded,
                    title: 'No Amenities Available',
                    message: 'No facilities registered in this society yet.',
                  )
                else
                  SizedBox(
                    height: 115,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: amenities.length,
                      separatorBuilder: (context, index) => AppSpacing.hGapSm,
                      itemBuilder: (context, index) {
                        final a = amenities[index];
                        final isSelected = a.id == _selectedAmenity?.id;

                        return PressScale(
                          onTap: () {
                            setState(() {
                              _selectedAmenity = a;
                              _selectedSlot = a.timeSlots.firstOrNull;
                            });
                          },
                          child: AppCard(
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
                                Hero(
                                  tag: 'amenity_icon_${a.id}',
                                  child: Icon(
                                    getAmenityIconData(a.icon),
                                    color: isSelected ? AppColors.accentTeal : AppColors.primaryNavy,
                                    size: 28,
                                  ),
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
                          ),
                        );
                      },
                    ),
                  ),
                AppSpacing.vGapLg,

                // Selected Amenity Reservation Box
                if (_selectedAmenity != null) ...[
                  AmenityReservationCard(
                    amenity: _selectedAmenity!,
                    selectedDate: _selectedDate,
                    selectedSlot: _selectedSlot,
                    isSubmitting: _isSubmitting,
                    onPickDate: _pickDate,
                    onSlotSelected: (slot) => setState(() => _selectedSlot = slot),
                    onConfirm: _confirmBooking,
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
                  ...List.generate(myBookings.length, (index) {
                    final b = myBookings[index];
                    final isConfirmed = b.status == BookingStatus.confirmed;
                    return FadeSlideIn.staggered(
                      index: index,
                      child: AppCard(
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
                                  '${AppDateTimeFormatter.formatDate(b.bookingDate)} • ${b.slot}',
                                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                            AppStatusChip(
                              label: b.status.name.toUpperCase(),
                              variant: isConfirmed ? AppStatusVariant.success : AppStatusVariant.neutral,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                AppSpacing.vGapXxl,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
