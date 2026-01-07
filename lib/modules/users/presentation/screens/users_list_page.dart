import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stackoverflow_users_reputation/core/routes/route_extensions.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/bloc/user_event.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/bloc/user_state.dart';

import '../../domain/entities/user_entity.dart';
import '../bloc/user_bloc.dart';
import '../widgets/user_list_item.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<UserBloc>().add(const UserEvent.refreshUsers());
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return PagedListView<int, UserEntity>.separated(
            state: state.pagingState,
            fetchNextPage: () {
              final nextPageKey = (state.keys?.last ?? 0) + 1;
              context.read<UserBloc>().add(
                UserEvent.fetchNextPage(pageKey: nextPageKey),
              );
            },
            builderDelegate: PagedChildBuilderDelegate<UserEntity>(
              itemBuilder: (context, user, index) {
                return UserListItem(
                  user: user,
                  onBookmarkToggle: (user) {
                    context.read<UserBloc>().add(
                      UserEvent.toggleBookmark(user),
                    );
                  },
                  onUserTap: (user) {
                    context.goToReputationDetail(user: user);
                  },
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
                          context.read<UserBloc>().add(
                            const UserEvent.refreshUsers(),
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
                          final nextPageKey = (state.keys?.last ?? 0) + 1;
                          context.read<UserBloc>().add(
                            UserEvent.fetchNextPage(pageKey: nextPageKey),
                          );
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              },
              noItemsFoundIndicatorBuilder: (context) {
                return const Center(child: Text('No users found'));
              },
            ),
            separatorBuilder: (context, index) => const Divider(),
          );
        },
      ),
    );
  }
}
