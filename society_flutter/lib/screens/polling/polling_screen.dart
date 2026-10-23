import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../services/society_state.dart';
import '../../theme/app_theme.dart';

class PollingScreen extends StatelessWidget {
  final SocietyState state;
  const PollingScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final isCommittee = state.currentRole == UserRole.chairman ||
        state.currentRole == UserRole.committee;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resolutions & Polling', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rule Banner
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFBFDBFE)),
              ),
              child: const Row(
                children: [
                  Icon(Icons.how_to_vote, color: AppTheme.infoBlue),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Democratic Principle: 1 Flat = 1 Vote & Secret Ballot. Individual voter choices are strictly anonymous; only aggregate results and flat participation status are visible.',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E40AF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),

            // Active Polls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    'Active Resolutions',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  state.currentFlat.isNotEmpty ? 'Flat ${state.currentFlat}' : 'Voting Console',
                  style: const TextStyle(color: AppTheme.primaryNavy, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 12),

            ...state.polls.map((poll) {
              final options = state.getPollOptions(poll.id!);
              final hasVoted = state.hasFlatVoted(poll.id!, state.currentFlat);
              final totalVotes = poll.totalVotesCast;
              final participationPct = poll.totalEligibleFlats > 0
                  ? ((totalVotes / poll.totalEligibleFlats) * 100).toInt()
                  : 0;

              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: AppTheme.infoBlue.withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  poll.category,
                                  style: const TextStyle(
                                    color: AppTheme.infoBlue,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF3E8FF),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: const Color(0xFFD8B4FE)),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.lock, size: 10, color: Color(0xFF7E22CE)),
                                    SizedBox(width: 3),
                                    Text('SECRET BALLOT', style: TextStyle(color: Color(0xFF7E22CE), fontSize: 9, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          if (hasVoted)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: AppTheme.successGreen.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.check, size: 14, color: AppTheme.successGreen),
                                  SizedBox(width: 4),
                                  Text(
                                    'YOUR FLAT HAS VOTED',
                                    style: TextStyle(
                                      color: AppTheme.successGreen,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          else
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: AppTheme.warningOrange.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                'VOTE PENDING',
                                style: TextStyle(
                                  color: AppTheme.warningOrange,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        poll.title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        poll.description,
                        style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                      ),
                      const SizedBox(height: 12),

                      // Participation Bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Participation: $totalVotes of ${poll.totalEligibleFlats} Flats ($participationPct%)',
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                          ),
                          Text(
                            'Ends in ${poll.endDate.difference(DateTime.now()).inDays} days',
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: poll.totalEligibleFlats > 0 ? (totalVotes / poll.totalEligibleFlats) : 0,
                          backgroundColor: Colors.grey.shade200,
                          color: AppTheme.accentTeal,
                          minHeight: 6,
                        ),
                      ),
                      const Divider(height: 24),

                      // Voting Options with Percentage Bar
                      ...options.map((opt) {
                        final pct = totalVotes > 0 ? ((opt.votesCount / totalVotes) * 100).toInt() : 0;

                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppTheme.borderLight,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      opt.optionText,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '$pct% (${opt.votesCount} votes)',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: AppTheme.primaryNavy,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: LinearProgressIndicator(
                                  value: totalVotes > 0 ? (opt.votesCount / totalVotes) : 0,
                                  backgroundColor: const Color(0xFFF1F5F9),
                                  color: AppTheme.primaryNavy,
                                  minHeight: 8,
                                ),
                              ),
                              if (!hasVoted) ...[
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: double.infinity,
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(color: AppTheme.primaryNavy),
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                    ),
                                    onPressed: () async {
                                      final ok = await state.castVote(
                                        pollId: poll.id!,
                                        flatNumber: state.currentFlat,
                                        optionId: opt.id!,
                                      );
                                      if (ok && context.mounted) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            backgroundColor: AppTheme.successGreen,
                                            content: Text('Vote Cast for Flat ${state.currentFlat}! (1 Flat = 1 Vote recorded)'),
                                          ),
                                        );
                                      }
                                    },
                                    child: Text('Vote for: "${opt.optionText}"'),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: isCommittee
          ? FloatingActionButton.extended(
              backgroundColor: AppTheme.primaryNavy,
              icon: const Icon(Icons.add_task, color: Colors.white),
              label: const Text('Create Resolution Poll', style: TextStyle(color: Colors.white)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Create resolution dialog opened.')),
                );
              },
            )
          : null,
    );
  }
}
