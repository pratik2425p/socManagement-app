import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class PollEndpoint extends Endpoint {
  /// Fetch polls with optional active/closed filter
  Future<List<SocietyPoll>> getPolls(
    Session session,
    int societyId, {
    PollStatus? status,
  }) async {
    return await SocietyPoll.db.find(
      session,
      where: (t) =>
          t.societyId.equals(societyId) &
          (status != null ? t.status.equals(status) : Constant.bool(true)),
      orderBy: (t) => t.startDate,
      orderDescending: true,
    );
  }

  /// Get options for a specific poll
  Future<List<PollOption>> getPollOptions(Session session, int pollId) async {
    return await PollOption.db.find(
      session,
      where: (t) => t.pollId.equals(pollId),
    );
  }

  /// Chairman / Committee creates a new poll with options
  Future<SocietyPoll> createPoll(
    Session session,
    SocietyPoll poll,
    List<String> options,
  ) async {
    poll.totalVotesCast = 0;
    poll.status = PollStatus.active;
    final createdPoll = await SocietyPoll.db.insertRow(session, poll);

    for (final optText in options) {
      final opt = PollOption(
        pollId: createdPoll.id!,
        optionText: optText,
        votesCount: 0,
      );
      await PollOption.db.insertRow(session, opt);
    }

    return createdPoll;
  }

  /// Resident casts vote (enforces 1 Flat = 1 Vote rule!)
  Future<bool> castVote(
    Session session,
    int pollId,
    String flatNumber,
    String voterName,
    int optionId,
  ) async {
    // Check if this flat already voted
    final existingVote = await PollVote.db.findFirstRow(
      session,
      where: (t) => t.pollId.equals(pollId) & t.flatNumber.equals(flatNumber),
    );
    if (existingVote != null) {
      return false; // Already voted!
    }

    // Record the vote
    final vote = PollVote(
      pollId: pollId,
      flatNumber: flatNumber,
      voterName: voterName,
      optionId: optionId,
      votedAt: DateTime.now(),
    );
    await PollVote.db.insertRow(session, vote);

    // Increment option votes
    final option = await PollOption.db.findById(session, optionId);
    if (option != null) {
      option.votesCount = option.votesCount + 1;
      await PollOption.db.updateRow(session, option);
    }

    // Increment total poll votes
    final poll = await SocietyPoll.db.findById(session, pollId);
    if (poll != null) {
      poll.totalVotesCast = poll.totalVotesCast + 1;
      await SocietyPoll.db.updateRow(session, poll);
    }

    return true;
  }
}
