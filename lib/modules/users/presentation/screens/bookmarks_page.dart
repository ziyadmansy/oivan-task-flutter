import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/bloc/user_bloc.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/bloc/user_event.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/bloc/user_state.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/widgets/user_list_item.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Bookmarks page doesn't support pagination
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => const Center(child: CircularProgressIndicator()),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          loaded: (loadedState) {
            final bookmarkedUsers =
                loadedState.users.where((user) => user.isBookmarked).toList();
            if (bookmarkedUsers.isEmpty) {
              return const Center(child: Text('No bookmarked users'));
            }
            return ListView.builder(
              controller: _scrollController,
              itemCount: bookmarkedUsers.length,
              itemBuilder: (context, index) {
                return UserListItem(
                  user: bookmarkedUsers[index],
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
            );
          },
          error:
              (errorState) =>
                  Center(child: Text('Error: ${errorState.message}')),
        );
      },
    );
  }
}
