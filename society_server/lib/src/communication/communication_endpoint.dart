import 'package:serverpod/serverpod.dart';
import '../core/auth_context.dart';
import '../generated/protocol.dart';
import '../notifications/fcm_service.dart';

class CommunicationEndpoint extends Endpoint {
  /// Get notices for the authenticated user's society
  Future<List<Notice>> getNotices(Session session) async {
    final auth = await AuthContext.require(session);
    return await Notice.db.find(
      session,
      where: (t) => t.societyId.equals(auth.societyId),
      orderBy: (t) => t.postedAt,
      orderDescending: true,
    );
  }

  /// Publish a new notice and send normal-priority push notifications to residents
  Future<Notice> createNotice(Session session, Notice notice) async {
    final auth = await AuthContext.require(session);
    notice.societyId = auth.societyId;
    final created = await Notice.db.insertRow(session, notice);

    await FcmService.sendToSociety(
      session,
      societyId: auth.societyId,
      title: '📢 Notice: ${created.title}',
      body: created.content,
      highPriority: false,
      data: {'type': 'notice', 'noticeId': created.id.toString()},
    );

    return created;
  }

  /// Get complaints, optionally filtered by flat
  Future<List<Complaint>> getComplaints(
    Session session, {
    String? flatNumber,
  }) async {
    final auth = await AuthContext.require(session);
    final filterFlat = (auth.role == UserRole.resident) ? auth.flatNumber : flatNumber;

    return await Complaint.db.find(
      session,
      where: (t) =>
          t.societyId.equals(auth.societyId) &
          (filterFlat != null ? t.flatNumber.equals(filterFlat) : Constant.bool(true)),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );
  }

  /// Raise a new complaint
  Future<Complaint> createComplaint(Session session, Complaint complaint) async {
    final auth = await AuthContext.require(session);
    complaint.societyId = auth.societyId;
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
    final auth = await AuthContext.require(session);
    final complaint = await Complaint.db.findById(session, complaintId);
    if (complaint == null || complaint.societyId != auth.societyId) return null;

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
