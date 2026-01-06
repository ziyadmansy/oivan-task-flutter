import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/bloc/user_event.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/bloc/user_state.dart';

import '../bloc/user_bloc.dart';
import '../widgets/user_list_item.dart';


class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<UserBloc>().add(UserEvent.loadUsers(page: 1, pageSize: 30));
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
        context.read<UserBloc>().add(
          UserEvent.loadUsers(page: _currentPage, pageSize: 30),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          loading: (_) {},
          loaded: (_) {
            _isLoadingMore = false;
          },
          error: (_) {},
        );
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => const Center(child: CircularProgressIndicator()),
            loading: (_) {
              if (_currentPage == 1) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const SizedBox();
              }
            },
            loaded: (loadedState) {
              final users = loadedState.users;
              if (users.isEmpty) {
                return const Center(child: Text('No users found'));
              }
              return ListView.builder(
                controller: _scrollController,
                itemCount: users.length + (_isLoadingMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == users.length) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    );
                  }
                  return UserListItem(
                    user: users[index],
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
      ),
    );
  }
}

