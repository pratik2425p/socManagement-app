import 'package:flutter/material.dart';
import 'package:society_client/society_client.dart';
import '../../core/core.dart';
import '../../services/society_state.dart';

/// Democratic Polling & Society Resolutions (1 Flat = 1 Vote)
class PollingScreen extends StatelessWidget {
  final SocietyState state;
  const PollingScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isCommittee = state.currentRole == UserRole.chairman ||
        state.currentRole == UserRole.committee;

    return Scaffold(
      appBar: AppAppBar(
        title: 'Democratic Polling & Resolutions',
        subtitle: '1 Flat = 1 Vote • Secret Ballot Voting Console',
      ),
      body: RefreshIndicator(
        onRefresh: () => state.fetchInitialData(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: AppSpacing.screenPadding,
          child: ResponsiveContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              // Democratic Principle Banner
              Container(
                padding: AppSpacing.insetAllMd,
                decoration: BoxDecoration(
                  color: AppColors.infoContainer,
                  borderRadius: AppRadii.borderMd,
                  border: Border.all(color: AppColors.infoBorder),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.how_to_vote_rounded, color: AppColors.info, size: 22),
                    AppSpacing.hGapMd,
                    Expanded(
                      child: Text(
                        '1 Flat = 1 Vote & Secret Ballot. Individual voting selections are strictly anonymous; only aggregate vote counts and flat participation status are visible.',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.infoDark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.vGapLg,

              AppSectionHeader(
                title: 'Active Society Resolutions (${state.polls.length})',
                subtitle: state.currentFlat.isNotEmpty ? 'Voting for Flat ${state.currentFlat}' : 'Viewing as Committee',
                padding: EdgeInsets.zero,
              ),
              AppSpacing.vGapSm,

              if (state.polls.isEmpty)
                const AppEmptyState(
                  icon: Icons.how_to_vote_outlined,
                  title: 'No Active Resolutions',
                  message: 'No society polls are currently open for voting.',
                )
              else
                ...state.polls.map((poll) {
                  final options = state.getPollOptions(poll.id!);
                  final hasVoted = state.hasFlatVoted(poll.id!, state.currentFlat);
                  final totalVotes = poll.totalVotesCast;
                  final turnout = poll.totalEligibleFlats > 0
                      ? ((totalVotes / poll.totalEligibleFlats) * 100).toInt()
                      : 0;

                  return AppCard(
                    margin: const EdgeInsets.only(bottom: AppSpacing.lg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                AppStatusChip.info(label: poll.category),
                                AppSpacing.hGapXs,
                                const AppStatusChip(
                                  label: 'SECRET BALLOT',
                                  variant: AppStatusVariant.neutral,
                                  icon: Icons.lock_outline_rounded,
                                ),
                              ],
                            ),
                            if (hasVoted)
                              const AppStatusChip.success(label: 'VOTED')
                            else
                              const AppStatusChip.warning(label: 'VOTE PENDING'),
                          ],
                        ),
                        AppSpacing.vGapMd,
                        Text(
                          poll.title,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        AppSpacing.vGapXs,
                        Text(
                          poll.description,
                          style: TextStyle(fontSize: 13, color: AppColors.textSecondary(context), height: 1.4),
                        ),
                        AppSpacing.vGapMd,

                        // Turnout Progress Bar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Voter Turnout: $turnout% ($totalVotes/${poll.totalEligibleFlats} flats)',
                              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Ends: ${poll.endDate.day}/${poll.endDate.month}/${poll.endDate.year}',
                              style: const TextStyle(fontSize: 11, color: Colors.grey),
                            ),
                          ],
                        ),
                        AppSpacing.vGapXs,
                        ClipRRect(
                          borderRadius: AppRadii.borderFull,
                          child: LinearProgressIndicator(
                            value: poll.totalEligibleFlats > 0 ? (totalVotes / poll.totalEligibleFlats) : 0,
                            backgroundColor: isDark ? AppColors.surfaceElevatedDark : const Color(0xFFF1F5F9),
                            color: AppColors.accentTeal,
                            minHeight: 6,
                          ),
                        ),
                        const Divider(height: 24),

                        // Option Choices
                        ...options.map((opt) {
                          final pct = totalVotes > 0 ? ((opt.votesCount / totalVotes) * 100).toInt() : 0;

                          return Container(
                            margin: const EdgeInsets.only(bottom: AppSpacing.sm),
                            padding: AppSpacing.insetAllMd,
                            decoration: BoxDecoration(
                              color: isDark ? AppColors.surfaceElevatedDark : const Color(0xFFF8FAFC),
                              borderRadius: AppRadii.borderMd,
                              border: Border.all(color: AppColors.border(context)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        opt.optionText,
                                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                                      ),
                                    ),
                                    Text(
                                      '$pct% (${opt.votesCount} votes)',
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.primaryNavy),
                                    ),
                                  ],
                                ),
                                AppSpacing.vGapSm,
                                ClipRRect(
                                  borderRadius: AppRadii.borderFull,
                                  child: LinearProgressIndicator(
                                    value: totalVotes > 0 ? (opt.votesCount / totalVotes) : 0,
                                    backgroundColor: isDark ? AppColors.surfaceDark : const Color(0xFFE2E8F0),
                                    color: AppColors.primaryNavy,
                                    minHeight: 6,
                                  ),
                                ),
                                if (!hasVoted) ...[
                                  AppSpacing.vGapSm,
                                  AppButton.outline(
                                    label: 'Vote: "${opt.optionText}"',
                                    isFullWidth: true,
                                    height: 38,
                                    onPressed: () async {
                                      final ok = await state.castVote(
                                        pollId: poll.id!,
                                        flatNumber: state.currentFlat,
                                        optionId: opt.id!,
                                      );
                                      if (ok && context.mounted) {
                                        AppSnackbar.showSuccess(
                                          context,
                                          'Vote recorded for Flat ${state.currentFlat}! (1 Flat = 1 Vote recorded)',
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  );
                }),
              AppSpacing.vGapXxl,
            ],
          ),
        ),
      ),
    ),
      floatingActionButton: isCommittee
          ? FloatingActionButton.extended(
              backgroundColor: AppColors.primaryNavy,
              foregroundColor: Colors.white,
              icon: const Icon(Icons.add_task_rounded),
              label: const Text('Create Resolution Poll'),
              onPressed: () {
                AppSnackbar.showInfo(context, 'New poll resolution draft modal ready.');
              },
            )
          : null,
    );
  }
}
