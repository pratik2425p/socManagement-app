import 'package:flutter/foundation.dart';
import 'package:society_client/society_client.dart';
import 'demo_seed_financial.dart';

/// Pre-seeded in-memory data records for offline Demo mode.
/// Contains complete data for all 5 personas: Resident, Guard, Chairman, Accountant, Admin.
class DemoSeedData {
  DemoSeedData._() {
    if (kReleaseMode) {
      throw StateError('DemoSeedData is strictly prohibited in release builds.');
    }
  }

  static List<Society> get societies => [
        Society(
          id: 1,
          name: 'Grand Horizon Heights CHS',
          code: 'GH01',
          address: 'Altamount Road, Cumballa Hill',
          city: 'Mumbai',
          state: 'Maharashtra',
          pincode: '400026',
          totalFlats: 120,
          subscriptionPlan: 'pro',
          subscriptionStatus: 'active',
          registrationNumber: 'MAH/MUM/2021/892',
          gstin: '27AABCU9876A1Z4',
          createdAt: DateTime(2024, 1, 1),
        ),
      ];

  static List<SocietyUser> get users => [
        SocietyUser(
          id: 1,
          societyId: 1,
          fullName: 'Aarav Mehta',
          phone: '9820011111',
          email: 'aarav@horizon.in',
          role: UserRole.resident,
          flatNumber: 'A-101',
          status: 'active',
          createdAt: DateTime(2024, 1, 15),
        ),
        SocietyUser(
          id: 2,
          societyId: 1,
          fullName: 'Bahadur Singh',
          phone: '9820022222',
          email: 'guard@horizon.in',
          role: UserRole.guard,
          flatNumber: null,
          status: 'active',
          createdAt: DateTime(2024, 2, 1),
        ),
        SocietyUser(
          id: 3,
          societyId: 1,
          fullName: 'Vikram Patel',
          phone: '9820033333',
          email: 'chairman@horizon.in',
          role: UserRole.chairman,
          flatNumber: 'A-501',
          status: 'active',
          createdAt: DateTime(2023, 11, 1),
        ),
        SocietyUser(
          id: 4,
          societyId: 1,
          fullName: 'Sneha Deshmukh',
          phone: '9820044444',
          email: 'accountant@horizon.in',
          role: UserRole.accountant,
          flatNumber: 'B-202',
          status: 'active',
          createdAt: DateTime(2024, 1, 10),
        ),
        SocietyUser(
          id: 5,
          societyId: 1,
          fullName: 'Platform Super Admin',
          phone: '9820055555',
          email: 'admin@societyos.io',
          role: UserRole.admin,
          flatNumber: null,
          status: 'active',
          createdAt: DateTime(2023, 6, 1),
        ),
      ];

  static List<MaintenanceBill> get bills => DemoSeedFinancial.bills;
  static List<VisitorEntry> get visitors => DemoSeedFinancial.visitors;
  static List<VoucherRequest> get vouchers => DemoSeedFinancial.vouchers;
  static List<LedgerEntry> get ledgerEntries => DemoSeedFinancial.ledgerEntries;
  static List<Amenity> get amenities => DemoSeedFinancial.amenities;

  static List<Notice> get notices => [
        Notice(
          id: 1,
          societyId: 1,
          title: 'Diwali Lighting & Community Fireworks Schedule',
          content: 'Eco-friendly green fireworks are permitted in the central lawn between 8:00 PM and 10:00 PM. Sweets distribution at Clubhouse.',
          category: 'Festival',
          priority: 'high',
          postedByName: 'Managing Committee',
          postedAt: DateTime.now().subtract(const Duration(hours: 4)),
        ),
        Notice(
          id: 2,
          societyId: 1,
          title: 'Annual General Body Meeting (AGM) 2026',
          content: 'Notice is hereby given that the 5th AGM will be held on Sunday at 10:30 AM in the Grand Banquet Hall. Agenda circulated via Document Vault.',
          category: 'Official',
          priority: 'urgent',
          postedByName: 'Vikram Patel (Chairman)',
          postedAt: DateTime.now().subtract(const Duration(days: 2)),
        ),
      ];

  static List<SocietyPoll> get polls => [
        SocietyPoll(
          id: 1,
          societyId: 1,
          title: 'Electric Vehicle (EV) Chargers in Podium 2',
          description: 'Proposal to install 8 shared 22kW AC Type-2 chargers funded from Reserve Surplus.',
          category: 'Infrastructure',
          status: PollStatus.active,
          startDate: DateTime.now().subtract(const Duration(days: 2)),
          endDate: DateTime.now().add(const Duration(days: 7)),
          totalEligibleFlats: 120,
          totalVotesCast: 78,
          createdByName: 'Managing Committee',
          createdAt: DateTime.now().subtract(const Duration(days: 2)),
        ),
      ];

  static Map<int, List<PollOption>> get pollOptions => {
        1: [
          PollOption(id: 1, pollId: 1, optionText: 'Yes, Install 8 Shared Fast Chargers', votesCount: 54),
          PollOption(id: 2, pollId: 1, optionText: 'Allow individual chargers at owner cost', votesCount: 18),
          PollOption(id: 3, pollId: 1, optionText: 'Defer to next financial year', votesCount: 6),
        ],
      };

  static List<SocietySubscription> get subscriptions => [
        SocietySubscription(
          id: 1,
          societyId: 1,
          societyName: 'Grand Horizon Heights CHS',
          tier: SubscriptionTier.pro,
          flatCount: 120,
          ratePerFlat: 25.0,
          monthlyTotal: 3000.0,
          billingCycle: 'monthly',
          status: 'active',
          nextRenewalDate: DateTime(2027, 1, 1),
          contactEmail: 'chairman@horizon.in',
          contactPhone: '9820033333',
          createdAt: DateTime(2024, 1, 1),
        ),
        SocietySubscription(
          id: 2,
          societyId: 2,
          societyName: 'Silver Oak CHS',
          tier: SubscriptionTier.starter,
          flatCount: 60,
          ratePerFlat: 25.0,
          monthlyTotal: 1500.0,
          billingCycle: 'monthly',
          status: 'active',
          nextRenewalDate: DateTime(2027, 6, 1),
          contactEmail: 'karthik@silveroak.in',
          contactPhone: '9820055555',
          createdAt: DateTime(2024, 6, 1),
        ),
      ];
}
