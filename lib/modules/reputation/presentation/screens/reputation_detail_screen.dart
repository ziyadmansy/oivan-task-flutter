import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:stackoverflow_users_reputation/modules/users/domain/entities/user_entity.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/widgets/user_list_item.dart';

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
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<ReputationBloc>().add(
      ReputationEvent.loadReputationHistory(
        userId: widget.user.userId,
        page: 1,
        pageSize: 30,
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (!_isLoadingMore) {
        _isLoadingMore = true;
        _currentPage++;
        context.read<ReputationBloc>().add(
          ReputationEvent.loadReputationHistory(
            userId: widget.user.userId,
            page: _currentPage,
            pageSize: 30,
          ),
        );
      }
    }
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
            child: BlocBuilder<ReputationBloc, ReputationState>(
              builder: (context, state) {
                return state.when(
                  initial:
                      () => const Center(child: CircularProgressIndicator()),
                  loading: () {
                    if (_currentPage == 1) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const SizedBox();
                    }
                  },
                  loaded: (reputations) {
                    if (reputations.isEmpty) {
                      return const Center(
                        child: Text('No reputation history found'),
                      );
                    }
                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: reputations.length + (_isLoadingMore ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == reputations.length) {
                          return const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: CircularProgressIndicator(),
                          );
                        }
                        final reputation = reputations[index];
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
                    );
                  },
                  error: (errorMessage) {
                    return Center(child: Text('Error: $errorMessage'));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
