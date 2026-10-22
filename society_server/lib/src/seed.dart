import 'package:serverpod/serverpod.dart';
import 'generated/protocol.dart';

Future<void> seedInitialData(Serverpod pod) async {
  final session = await pod.createSession();
  try {
    // Check if society already seeded
    final existing = await Society.db.findFirstRow(session);
    if (existing != null) {
      session.log('[Seed] Database already contains data. Skipping seed.');
      return;
    }

    session.log('[Seed] Seeding initial society management data...');

    // 1. Society
    final society = await Society.db.insertRow(
      session,
      Society(
        name: 'Shree Samarth Co-op Housing Society',
        code: 'SAMARTH01',
        address: 'Plot 42, Sector 14, Palm Beach Road',
        city: 'Navi Mumbai',
        state: 'Maharashtra',
        pincode: '400703',
        totalFlats: 35,
        subscriptionPlan: 'pro',
        subscriptionStatus: 'active',
        createdAt: DateTime.now(),
      ),
    );

    final societyId = society.id!;

    // 2. Buildings & Flats
    final bldgA = await Building.db.insertRow(
      session,
      Building(
        societyId: societyId,
        name: 'Wing A',
        totalFloors: 7,
        createdAt: DateTime.now(),
      ),
    );

    final flats = [
      Flat(societyId: societyId, buildingId: bldgA.id!, flatNumber: 'A-101', floor: 1, squareFeet: 750, status: 'occupied'),
      Flat(societyId: societyId, buildingId: bldgA.id!, flatNumber: 'A-201', floor: 2, squareFeet: 950, status: 'occupied'),
      Flat(societyId: societyId, buildingId: bldgA.id!, flatNumber: 'A-304', floor: 3, squareFeet: 820, status: 'occupied'),
      Flat(societyId: societyId, buildingId: bldgA.id!, flatNumber: 'B-102', floor: 1, squareFeet: 750, status: 'occupied'),
      Flat(societyId: societyId, buildingId: bldgA.id!, flatNumber: 'B-201', floor: 2, squareFeet: 820, status: 'occupied'),
      Flat(societyId: societyId, buildingId: bldgA.id!, flatNumber: 'B-302', floor: 3, squareFeet: 950, status: 'occupied'),
    ];
    for (final f in flats) {
      await Flat.db.insertRow(session, f);
    }

    // 3. Society Users
    final users = [
      SocietyUser(societyId: societyId, fullName: 'Vicky Patil', phone: '9822011223', email: 'vicky@samarth.in', role: UserRole.resident, flatNumber: 'A-304', status: 'active', createdAt: DateTime.now()),
      SocietyUser(societyId: societyId, fullName: 'Santosh Gawde', phone: '9811223344', email: 'guard@samarth.in', role: UserRole.guard, status: 'active', createdAt: DateTime.now()),
      SocietyUser(societyId: societyId, fullName: 'Anand Rao', phone: '9922001122', email: 'chairman@samarth.in', role: UserRole.chairman, status: 'active', createdAt: DateTime.now()),
      SocietyUser(societyId: societyId, fullName: 'Sunil Mehta', phone: '9765443322', email: 'accounts@samarth.in', role: UserRole.accountant, status: 'active', createdAt: DateTime.now()),
    ];
    for (final u in users) {
      await SocietyUser.db.insertRow(session, u);
    }

    // 4. Maintenance Bills
    await MaintenanceBill.db.insertRow(
      session,
      MaintenanceBill(
        societyId: societyId,
        flatId: 3,
        flatNumber: 'A-304',
        billNumber: 'BILL-OCT-2026-304',
        billingMonth: 'October 2026',
        dueDate: DateTime.now().add(const Duration(days: 8)),
        amount: 2450.0,
        lateFee: 0.0,
        status: BillStatus.unpaid,
        issuedAt: DateTime.now().subtract(const Duration(days: 5)),
      ),
    );

    await MaintenanceBill.db.insertRow(
      session,
      MaintenanceBill(
        societyId: societyId,
        flatId: 3,
        flatNumber: 'A-304',
        billNumber: 'BILL-SEP-2026-304',
        billingMonth: 'September 2026',
        dueDate: DateTime.now().subtract(const Duration(days: 22)),
        amount: 2450.0,
        lateFee: 0.0,
        status: BillStatus.paid,
        issuedAt: DateTime.now().subtract(const Duration(days: 35)),
      ),
    );

    // 5. Visitors
    await VisitorEntry.db.insertRow(
      session,
      VisitorEntry(
        societyId: societyId,
        flatNumber: 'A-304',
        visitorName: 'Rahul Shinde (Swiggy)',
        phoneNumber: '9822011223',
        purpose: 'Delivery',
        vehicleNumber: 'MH-12-AB-1234',
        passcode: '4821',
        status: VisitorStatus.inside,
        entryGate: 'Main Gate 1',
        checkInTime: DateTime.now().subtract(const Duration(minutes: 14)),
      ),
    );
    await VisitorEntry.db.insertRow(
      session,
      VisitorEntry(
        societyId: societyId,
        flatNumber: 'B-102',
        visitorName: 'Suresh Deshmukh',
        phoneNumber: '9923456789',
        purpose: 'Guest',
        passcode: '8910',
        status: VisitorStatus.expected,
        entryGate: 'Main Gate 1',
      ),
    );

    // 6. Vouchers
    await VoucherRequest.db.insertRow(
      session,
      VoucherRequest(
        societyId: societyId,
        voucherNumber: 'VCH-2026-089',
        title: 'Water Pump Repair & Motor Rewinding',
        description: 'Emergency plumber & electrician repair for Wing A overhead pump.',
        amount: 4500.0,
        category: 'Plumbing & Electrical',
        requestedByName: 'Sachin Kadam (Committee)',
        status: VoucherStatus.approved,
        approvedByName: 'Anand Rao (Chairman)',
        approvedAt: DateTime.now().subtract(const Duration(hours: 3)),
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
    );
    await VoucherRequest.db.insertRow(
      session,
      VoucherRequest(
        societyId: societyId,
        voucherNumber: 'VCH-2026-090',
        title: 'Garden Trimming & Plant Manure',
        description: 'Monthly landscape gardener fee and compost purchase.',
        amount: 2200.0,
        category: 'Gardening & Common Area',
        requestedByName: 'Pooja More (Committee)',
        status: VoucherStatus.pendingApproval,
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      ),
    );

    // 7. General Ledger Entries
    await LedgerEntry.db.insertRow(
      session,
      LedgerEntry(
        societyId: societyId,
        entryNumber: 'JE-1001',
        entryDate: DateTime.now().subtract(const Duration(days: 3)),
        description: 'Settled CCTV camera cable replacement (VCH-2026-085)',
        postedByName: 'Sunil Mehta (Accountant)',
        totalDebit: 1800.0,
        totalCredit: 1800.0,
        postedAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
    );

    // 8. Complaints
    await Complaint.db.insertRow(
      session,
      Complaint(
        societyId: societyId,
        flatNumber: 'A-304',
        reportedByName: 'Vicky Patil',
        title: 'Water Seepage in Master Bathroom',
        description: 'Persistent dampness and seepage from top floor flat A-404 plumbing line.',
        category: 'Plumbing',
        status: ComplaintStatus.inProgress,
        assignedTo: 'Ramesh Plumber',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    );

    // 9. Notices
    await Notice.db.insertRow(
      session,
      Notice(
        societyId: societyId,
        title: 'Annual General Body Meeting (AGM) 2026',
        content: 'The 14th AGM will be held on Sunday at 10:30 AM in the Clubhouse. Agenda includes solar panel installation and annual accounts approval.',
        category: 'General Meeting',
        priority: 'High',
        postedByName: 'Secretary & Chairman',
        postedAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
    );

    // 10. Documents
    await SocietyDocument.db.insertRow(
      session,
      SocietyDocument(
        societyId: societyId,
        title: 'Model Housing Society Bye-Laws (Maharashtra)',
        description: 'Official society rules, member rights, elections and penalty clauses.',
        category: DocumentCategory.byeLaws,
        fileUrl: 'https://society.storage/byelaws_2026.pdf',
        fileSize: '3.4 MB',
        uploadedByName: 'Secretary Office',
        isCommitteeOnly: false,
        uploadedAt: DateTime.now().subtract(const Duration(days: 60)),
      ),
    );

    // 11. Meeting Minutes
    await MeetingMinutes.db.insertRow(
      session,
      MeetingMinutes(
        societyId: societyId,
        meetingTitle: '14th Annual General Body Meeting (AGM)',
        meetingType: 'AGM',
        meetingDate: DateTime.now().subtract(const Duration(days: 25)),
        agenda: 'Approval of audited balance sheet, appointment of statutory auditor, solar rooftop tender.',
        minutesSummary: 'Resolved: 1. Accounts unanimously passed. 2. Tata Solar proposal approved by majority. 3. Sinking fund contribution increased by ₹200/mo.',
        attendeesCount: 29,
        documentUrl: 'https://society.storage/agm_minutes_2026.pdf',
        recordedByName: 'Rajesh Nair (Secretary)',
        createdAt: DateTime.now().subtract(const Duration(days: 24)),
      ),
    );

    // 12. Polling
    final poll = await SocietyPoll.db.insertRow(
      session,
      SocietyPoll(
        societyId: societyId,
        title: 'Should we install a 15 kW Solar Rooftop Plant for Common Area Lights?',
        description: 'Capital cost estimate is ₹6.8 Lakhs with 40% government subsidy. Expected payback period is 2.5 years with zero common electricity bill.',
        category: 'Infrastructure & Capital Works',
        status: PollStatus.active,
        startDate: DateTime.now().subtract(const Duration(days: 3)),
        endDate: DateTime.now().add(const Duration(days: 4)),
        totalEligibleFlats: 35,
        totalVotesCast: 24,
        createdByName: 'Managing Committee',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
    );
    await PollOption.db.insertRow(session, PollOption(pollId: poll.id!, optionText: 'Yes, Proceed with Solar Installation', votesCount: 19));
    await PollOption.db.insertRow(session, PollOption(pollId: poll.id!, optionText: 'No, Postpone to next financial year', votesCount: 3));
    await PollOption.db.insertRow(session, PollOption(pollId: poll.id!, optionText: 'Need more vendor quotes first', votesCount: 2));

    // 13. Emergency SOS
    await SosAlert.db.insertRow(
      session,
      SosAlert(
        societyId: societyId,
        flatNumber: 'B-302',
        raisedByName: 'Sunita Deshpande',
        emergencyType: EmergencyType.medical,
        description: 'Severe chest discomfort. Ambulance required immediately.',
        status: SosStatus.active,
        raisedAt: DateTime.now().subtract(const Duration(minutes: 6)),
      ),
    );

    // 14. SaaS Subscriptions
    final subs = [
      SocietySubscription(societyId: 1, societyName: 'Shree Samarth Co-op Housing Society', tier: SubscriptionTier.pro, flatCount: 35, ratePerFlat: 25.0, monthlyTotal: 875.0, billingCycle: 'Monthly', status: 'active', nextRenewalDate: DateTime.now().add(const Duration(days: 18)), contactEmail: 'committee@samarthsociety.in', contactPhone: '9822011223', createdAt: DateTime.now().subtract(const Duration(days: 90))),
      SocietySubscription(societyId: 2, societyName: 'Godrej Horizon Township (Phase 1)', tier: SubscriptionTier.enterprise, flatCount: 480, ratePerFlat: 35.0, monthlyTotal: 16800.0, billingCycle: 'Quarterly', status: 'active', nextRenewalDate: DateTime.now().add(const Duration(days: 42)), contactEmail: 'estate.manager@godrejhorizon.com', contactPhone: '9820099881', createdAt: DateTime.now().subtract(const Duration(days: 120))),
      SocietySubscription(societyId: 3, societyName: 'Shivneri Residency Wing A-D', tier: SubscriptionTier.starter, flatCount: 64, ratePerFlat: 15.0, monthlyTotal: 960.0, billingCycle: 'Monthly', status: 'trial', nextRenewalDate: DateTime.now().add(const Duration(days: 4)), contactEmail: 'shivneri.society@gmail.com', contactPhone: '9765001122', createdAt: DateTime.now().subtract(const Duration(days: 10))),
    ];
    for (final s in subs) {
      await SocietySubscription.db.insertRow(session, s);
    }

    session.log('[Seed] Database successfully seeded with baseline records!');
  } finally {
    await session.close();
  }
}
