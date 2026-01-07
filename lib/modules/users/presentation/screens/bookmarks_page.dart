import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/bloc/user_bloc.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/bloc/user_event.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/bloc/user_state.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/widgets/user_list_item.dart';

import '../../domain/entities/user_entity.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(const UserEvent.loadBookmarkedUsers());
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<UserBloc>().add(const UserEvent.loadBookmarkedUsers());
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return PagedListView<int, UserEntity>.separated(
            state: state.pagingState,
            fetchNextPage: () {
              // Bookmarks don't support pagination, so this is a no-op
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
                    Navigator.of(
                      context,
                    ).pushNamed('/reputation', arguments: user);
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
                            const UserEvent.loadBookmarkedUsers(),
                          );
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              },
              noItemsFoundIndicatorBuilder: (context) {
                return const Center(child: Text('No bookmarked users'));
              },
            ),
            separatorBuilder: (context, index) => const Divider(),
          );
        },
      ),
    );
  }
}
