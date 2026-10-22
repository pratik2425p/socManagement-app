import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class SocietyEndpoint extends Endpoint {
  /// Create a new society on the SaaS platform
  Future<Society> createSociety(Session session, Society society) async {
    return await Society.db.insertRow(session, society);
  }

  /// List all societies
  Future<List<Society>> getSocieties(Session session) async {
    return await Society.db.find(session);
  }

  /// Get a single society by ID
  Future<Society?> getSocietyById(Session session, int id) async {
    return await Society.db.findById(session, id);
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
}
