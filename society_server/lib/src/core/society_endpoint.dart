import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class SocietyEndpoint extends Endpoint {
  /// Create a new society on the SaaS platform
  Future<Society> createSociety(Session session, Society society) async {
    return await Society.db.insertRow(session, society);
  }

  /// List all societies
  Future<List<Society>> getSocieties(Session session) async {
    return await Society.db.find(
      session,
      orderBy: (t) => t.id,
      orderDescending: true,
    );
  }

  /// Get a single society by ID
  Future<Society?> getSocietyById(Session session, int id) async {
    return await Society.db.findById(session, id);
  }

  /// Onboard a new customer society with subscription and primary Society Admin
  Future<Society> onboardNewSocietyWithAdmin(
    Session session,
    Society society,
    String adminName,
    String adminPhone,
    String adminEmail,
    String planName,
  ) async {
    // 1. Insert society
    final createdSociety = await Society.db.insertRow(session, society);
    final societyId = createdSociety.id!;

    // 2. Create subscription
    final sub = SocietySubscription(
      societyId: societyId,
      societyName: createdSociety.name,
      tier: planName.toLowerCase().contains('enterprise')
          ? SubscriptionTier.enterprise
          : planName.toLowerCase().contains('pro') || planName.toLowerCase().contains('standard')
              ? SubscriptionTier.pro
              : SubscriptionTier.starter,
      flatCount: createdSociety.totalFlats,
      ratePerFlat: 25.0,
      monthlyTotal: createdSociety.totalFlats * 25.0,
      billingCycle: 'monthly',
      status: 'active',
      nextRenewalDate: DateTime.now().add(const Duration(days: 365)),
      contactEmail: adminEmail,
      contactPhone: adminPhone,
      createdAt: DateTime.now(),
    );
    await SocietySubscription.db.insertRow(session, sub);

    // 3. Parse Admin Flat Number & Create primary society admin / chairman
    String cleanEmail = adminEmail;
    String assignedFlat = 'Admin Office';
    if (adminEmail.contains('#')) {
      final parts = adminEmail.split('#');
      cleanEmail = parts[0].trim();
      if (parts.length > 1 && parts[1].trim().isNotEmpty) {
        assignedFlat = parts[1].trim().toUpperCase();
      }
    } else if (adminEmail.contains('|')) {
      final parts = adminEmail.split('|');
      cleanEmail = parts[0].trim();
      if (parts.length > 1 && parts[1].trim().isNotEmpty) {
        assignedFlat = parts[1].trim().toUpperCase();
      }
    }

    final adminUser = SocietyUser(
      societyId: societyId,
      fullName: adminName,
      phone: adminPhone,
      email: cleanEmail,
      role: UserRole.chairman,
      flatNumber: assignedFlat,
      status: 'active',
      createdAt: DateTime.now(),
    );
    await SocietyUser.db.insertRow(session, adminUser);

    // If flat is specified and not 'Admin Office', ensure Flat record exists in PostgreSQL!
    if (assignedFlat != 'Admin Office') {
      final existingFlats = await Flat.db.find(
        session,
        where: (t) => t.societyId.equals(societyId) & t.flatNumber.equals(assignedFlat),
      );
      if (existingFlats.isEmpty) {
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

        final digits = int.tryParse(assignedFlat.replaceAll(RegExp(r'[^0-9]'), '')) ?? 101;
        await Flat.db.insertRow(
          session,
          Flat(
            societyId: societyId,
            buildingId: building.id ?? 1,
            flatNumber: assignedFlat,
            floor: (digits ~/ 100) > 0 ? (digits ~/ 100) : 1,
            squareFeet: 1050.0,
            status: 'Occupied',
          ),
        );
      }
    }

    return createdSociety;
  }

  /// Get buildings for a society
  Future<List<Building>> getBuildings(Session session, int societyId) async {
    return await Building.db.find(
      session,
      where: (t) => t.societyId.equals(societyId),
      orderBy: (t) => t.name,
    );
  }

  /// Create a building
  Future<Building> createBuilding(Session session, Building building) async {
    return await Building.db.insertRow(session, building);
  }

  /// Get flats for a given society
  Future<List<Flat>> getFlats(Session session, int societyId) async {
    return await Flat.db.find(
      session,
      where: (t) => t.societyId.equals(societyId),
      orderBy: (t) => t.flatNumber,
    );
  }

  /// Add a flat to a society
  Future<Flat> createFlat(Session session, Flat flat) async {
    return await Flat.db.insertRow(session, flat);
  }

  /// Bulk add flats to a society
  Future<List<Flat>> bulkCreateFlats(Session session, List<Flat> flats) async {
    final inserted = <Flat>[];
    for (final flat in flats) {
      inserted.add(await Flat.db.insertRow(session, flat));
    }
    return inserted;
  }

  /// Get society users/members
  Future<List<SocietyUser>> getSocietyUsers(Session session, int societyId) async {
    return await SocietyUser.db.find(
      session,
      where: (t) => t.societyId.equals(societyId),
      orderBy: (t) => t.fullName,
    );
  }

  /// Register/Add a society user
  Future<SocietyUser> createSocietyUser(Session session, SocietyUser user) async {
    return await SocietyUser.db.insertRow(session, user);
  }

  /// Create a member invitation
  Future<SocietyInvitation> createInvitation(
    Session session,
    SocietyInvitation invitation,
  ) async {
    return await SocietyInvitation.db.insertRow(session, invitation);
  }

  /// Bulk create invitations (e.g. from Excel/CSV import)
  Future<List<SocietyInvitation>> bulkCreateInvitations(
    Session session,
    List<SocietyInvitation> invitations,
  ) async {
    final inserted = <SocietyInvitation>[];
    for (final inv in invitations) {
      inserted.add(await SocietyInvitation.db.insertRow(session, inv));
    }
    return inserted;
  }

  /// List invitations for a society
  Future<List<SocietyInvitation>> getInvitations(
    Session session,
    int societyId,
  ) async {
    return await SocietyInvitation.db.find(
      session,
      where: (t) => t.societyId.equals(societyId),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );
  }

  /// Verify and accept an invitation by invite code
  Future<SocietyUser?> verifyAndAcceptInvitation(
    Session session,
    String inviteCode,
    String phone,
  ) async {
    final invitations = await SocietyInvitation.db.find(
      session,
      where: (t) => t.inviteCode.equals(inviteCode.trim().toUpperCase()),
    );

    if (invitations.isEmpty) return null;
    final invite = invitations.first;

    if (invite.status == 'accepted') {
      // Already accepted, find and return existing user
      final existingUsers = await SocietyUser.db.find(
        session,
        where: (t) => t.societyId.equals(invite.societyId) & t.phone.equals(invite.phone),
      );
      if (existingUsers.isNotEmpty) return existingUsers.first;
    }

    // Mark as accepted
    invite.status = 'accepted';
    await SocietyInvitation.db.updateRow(session, invite);

    // Create active SocietyUser account
    final newUser = SocietyUser(
      societyId: invite.societyId,
      fullName: invite.inviteeName,
      phone: invite.phone,
      email: invite.email ?? '${invite.phone}@samarth.in',
      role: invite.role,
      flatNumber: invite.flatNumber,
      status: 'active',
      createdAt: DateTime.now(),
    );

    return await SocietyUser.db.insertRow(session, newUser);
  }

  /// Dev-only direct phone login. Disabled in production.
  Future<SocietyUser?> loginWithPhone(Session session, String phone) async {
    if (session.serverpod.runMode == 'production') {
      throw StateError(
        'Direct loginWithPhone is disabled in production. Use secure SMS OTP authentication.',
      );
    }
    final cleanPhone = phone.trim().replaceAll(RegExp(r'[^0-9]'), '');
    final users = await SocietyUser.db.find(
      session,
      where: (t) => t.phone.equals(cleanPhone) | t.phone.equals(phone.trim()),
    );
    if (users.isEmpty) return null;
    return users.first;
  }
}
