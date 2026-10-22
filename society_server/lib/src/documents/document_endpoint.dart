import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class DocumentEndpoint extends Endpoint {
  /// Fetch all society documents
  Future<List<SocietyDocument>> getDocuments(
    Session session,
    int societyId, {
    bool includeCommitteeOnly = false,
  }) async {
    return await SocietyDocument.db.find(
      session,
      where: (t) =>
          t.societyId.equals(societyId) &
          (includeCommitteeOnly ? Constant.bool(true) : t.isCommitteeOnly.equals(false)),
      orderBy: (t) => t.uploadedAt,
      orderDescending: true,
    );
  }

  /// Upload a document (bye-laws, audit reports, insurance, etc.)
  Future<SocietyDocument> uploadDocument(
    Session session,
    SocietyDocument doc,
  ) async {
    return await SocietyDocument.db.insertRow(session, doc);
  }

  /// Fetch meeting minutes (AGM / EGM / Managing Committee)
  Future<List<MeetingMinutes>> getMeetingMinutes(
    Session session,
    int societyId,
  ) async {
    return await MeetingMinutes.db.find(
      session,
      where: (t) => t.societyId.equals(societyId),
      orderBy: (t) => t.meetingDate,
      orderDescending: true,
    );
  }

  /// Record new meeting minutes
  Future<MeetingMinutes> recordMeetingMinutes(
    Session session,
    MeetingMinutes minutes,
  ) async {
    return await MeetingMinutes.db.insertRow(session, minutes);
  }
}
