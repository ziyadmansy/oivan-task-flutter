import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:stackoverflow_users_reputation/modules/users/domain/entities/user_entity.dart';

import '../bloc/reputation_bloc.dart';
import '../bloc/reputation_event.dart';
import '../bloc/reputation_state.dart';

class ReputationDetailScreen extends StatefulWidget {
  final UserEntity user;

  const ReputationDetailScreen({Key? key, required this.user})
    : super(key: key);

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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      widget.user.profileImage != null
                          ? NetworkImage(widget.user.profileImage!)
                          : null,
                  radius: 30,
                  child:
                      widget.user.profileImage == null
                          ? const Icon(Icons.person)
                          : null,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.user.displayName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Total Reputation: ${widget.user.reputation}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                            title: Text(reputation.reputationType),
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
