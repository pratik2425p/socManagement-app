import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class CommunicationEndpoint extends Endpoint {
  /// Get notices for a society
  Future<List<Notice>> getNotices(Session session, int societyId) async {
    return await Notice.db.find(
      session,
      where: (t) => t.societyId.equals(societyId),
      orderBy: (t) => t.postedAt,
      orderDescending: true,
    );
  }

  /// Publish a new notice
  Future<Notice> createNotice(Session session, Notice notice) async {
    return await Notice.db.insertRow(session, notice);
  }

  /// Get complaints, optionally filtered by flat
  Future<List<Complaint>> getComplaints(
    Session session,
    int societyId, {
    String? flatNumber,
  }) async {
    return await Complaint.db.find(
      session,
      where: (t) =>
          t.societyId.equals(societyId) &
          (flatNumber != null ? t.flatNumber.equals(flatNumber) : Constant.bool(true)),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );
  }

  /// Raise a new complaint
  Future<Complaint> createComplaint(Session session, Complaint complaint) async {
    complaint.status = ComplaintStatus.open;
    return await Complaint.db.insertRow(session, complaint);
  }

  /// Update complaint status and resolution notes
  Future<Complaint?> updateComplaintStatus(
    Session session,
    int complaintId,
    ComplaintStatus status,
    String? resolutionNotes,
  ) async {
    final complaint = await Complaint.db.findById(session, complaintId);
    if (complaint == null) return null;

    complaint.status = status;
    if (resolutionNotes != null) {
      complaint.resolutionNotes = resolutionNotes;
    }
    if (status == ComplaintStatus.resolved || status == ComplaintStatus.closed) {
      complaint.resolvedAt = DateTime.now();
    }

    return await Complaint.db.updateRow(session, complaint);
  }
}
