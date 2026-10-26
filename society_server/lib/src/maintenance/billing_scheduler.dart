import 'dart:async';
import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../notifications/fcm_service.dart';

/// Automatic Recurring Maintenance Billing Scheduler
/// Runs periodically (or on server boot) to generate monthly maintenance
/// dues for all flats across all registered customer societies in PostgreSQL.
class BillingScheduler {
  static Timer? _timer;

  /// Starts the recurring background billing scheduler
  static void start(Serverpod pod) {
    _timer?.cancel();

    // Run initial billing check at server startup
    runBillingJob(pod);

    // Run every 24 hours to automatically generate new cycle bills
    _timer = Timer.periodic(const Duration(hours: 24), (_) {
      runBillingJob(pod);
    });
  }

  /// Stop scheduler
  static void stop() {
    _timer?.cancel();
    _timer = null;
  }

  /// Execute the billing generation job across all active societies
  static Future<int> runBillingJob(Serverpod pod) async {
    final session = await pod.createSession();
    int billsGenerated = 0;

    try {
      final societies = await Society.db.find(
        session,
        where: (t) => t.subscriptionStatus.equals('active'),
      );

      final now = DateTime.now();
      const monthNames = [
        'January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'
      ];
      final currentMonthName = '${monthNames[now.month - 1]} ${now.year}';
      
      // Due date on the 10th
      final dueDate = DateTime(now.year, now.month, 10).isAfter(now)
          ? DateTime(now.year, now.month, 10)
          : DateTime(now.year, now.month + 1, 10);

      for (final society in societies) {
        final societyId = society.id!;

        // 1. Fetch all flats for this society
        var flats = await Flat.db.find(
          session,
          where: (t) => t.societyId.equals(societyId),
        );

        // If no flats are configured yet, check if admin user has an assigned flat
        if (flats.isEmpty) {
          final users = await SocietyUser.db.find(
            session,
            where: (t) => t.societyId.equals(societyId),
          );
          for (final u in users) {
            if (u.flatNumber != null && u.flatNumber!.isNotEmpty && u.flatNumber != 'Admin Office') {
              var building = await Building.db.findFirstRow(
                session,
                where: (t) => t.societyId.equals(societyId),
              );
              building ??= await Building.db.insertRow(
                session,
                Building(
                  societyId: societyId,
                  name: 'Wing A',
                  totalFloors: 10,
                  createdAt: DateTime.now(),
                ),
              );

              final flat = await Flat.db.insertRow(
                session,
                Flat(
                  societyId: societyId,
                  buildingId: building.id ?? 1,
                  flatNumber: u.flatNumber!,
                  floor: 1,
                  squareFeet: 1050.0,
                  status: 'Occupied',
                ),
              );
              flats = [flat];
            }
          }
        }

        // Standard flat rate: ₹2,500
        const double maintenanceRate = 2500.0;

        for (final flat in flats) {
          // Check if bill already exists for this billing month
          final existingBill = await MaintenanceBill.db.findFirstRow(
            session,
            where: (t) =>
                t.societyId.equals(societyId) &
                t.flatNumber.equals(flat.flatNumber) &
                t.billingMonth.equals(currentMonthName),
          );

          if (existingBill == null) {
            final cleanFlat = flat.flatNumber.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
            final billNumber = 'BILL-${society.code}-$cleanFlat-${now.year}${now.month.toString().padLeft(2, '0')}';

            final newBill = MaintenanceBill(
              societyId: societyId,
              flatId: flat.id ?? 1,
              flatNumber: flat.flatNumber,
              billNumber: billNumber,
              billingMonth: currentMonthName,
              dueDate: dueDate,
              amount: maintenanceRate,
              lateFee: 150.0,
              status: BillStatus.unpaid,
              issuedAt: now,
            );

            await MaintenanceBill.db.insertRow(session, newBill);
            billsGenerated++;
            session.log('[BillingScheduler] Generated $billNumber for Flat ${flat.flatNumber} in ${society.name}');

            await FcmService.sendToFlat(
              session,
              societyId: societyId,
              flatNumber: flat.flatNumber,
              title: '📄 Maintenance Bill Generated',
              body: 'Maintenance bill of ₹${maintenanceRate.toStringAsFixed(0)} for $currentMonthName has been issued.',
              highPriority: false,
              data: {'type': 'bill_reminder', 'billNumber': billNumber},
            );
          }
        }
      }
    } catch (e, st) {
      session.log('[BillingScheduler] Error generating bills: $e\n$st', level: LogLevel.error);
    } finally {
      await session.close();
    }

    return billsGenerated;
  }
}
