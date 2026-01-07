import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:stackoverflow_users_reputation/modules/users/domain/entities/user_entity.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/widgets/user_list_item.dart';

import '../../domain/entities/reputation_history_entity.dart';
import '../bloc/reputation_bloc.dart';
import '../bloc/reputation_event.dart';
import '../bloc/reputation_state.dart';

class ReputationDetailScreen extends StatefulWidget {
  final UserEntity user;

  const ReputationDetailScreen({super.key, required this.user});

  @override
  State<ReputationDetailScreen> createState() => _ReputationDetailScreenState();
}

class _ReputationDetailScreenState extends State<ReputationDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ReputationBloc>().add(
      ReputationEvent.fetchNextPage(userId: widget.user.userId, pageKey: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.user.displayName}\'s Reputation')),
      body: Column(
        children: [
          UserListItem(
            user: widget.user,
            onBookmarkToggle: null,
            onUserTap: null,
          ),
          const Divider(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<ReputationBloc>().add(
                  ReputationEvent.refreshReputationHistory(
                    userId: widget.user.userId,
                  ),
                );
              },
              child: BlocBuilder<ReputationBloc, ReputationState>(
                builder: (context, state) {
                  return PagedListView<int, ReputationHistoryEntity>(
                    state: state.pagingState,
                    fetchNextPage: () {
                      final nextPageKey = (state.keys?.last ?? 0) + 1;
                      context.read<ReputationBloc>().add(
                        ReputationEvent.fetchNextPage(
                          userId: widget.user.userId,
                          pageKey: nextPageKey,
                        ),
                      );
                    },
                    builderDelegate: PagedChildBuilderDelegate<
                      ReputationHistoryEntity
                    >(
                      itemBuilder: (context, reputation, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          child: ListTile(
                            title: Text(
                              reputation.reputationHistoryType
                                  .toDisplayString(),
                            ),
                            subtitle: Text(
                              DateFormat(
                                'MMM dd, yyyy HH:mm',
                              ).format(reputation.createdAt),
                            ),
                            trailing: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    reputation.reputationChange > 0
                                        ? Colors.green[100]
                                        : Colors.red[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '${reputation.reputationChange > 0 ? '+' : ''}${reputation.reputationChange}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      reputation.reputationChange > 0
                                          ? Colors.green[700]
                                          : Colors.red[700],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      firstPageErrorIndicatorBuilder: (context) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Error: ${state.error}'),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<ReputationBloc>().add(
                                    ReputationEvent.refreshReputationHistory(
                                      userId: widget.user.userId,
                                    ),
                                  );
                                },
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        );
                      },
                      newPageErrorIndicatorBuilder: (context) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Error: ${state.error}'),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  final nextPageKey =
                                      (state.keys?.last ?? 0) + 1;
                                  context.read<ReputationBloc>().add(
                                    ReputationEvent.fetchNextPage(
                                      userId: widget.user.userId,
                                      pageKey: nextPageKey,
                                    ),
                                  );
                                },
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        );
                      },
                      noItemsFoundIndicatorBuilder: (context) {
                        return const Center(
                          child: Text('No reputation history found'),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
