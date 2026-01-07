import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/bloc/user_bloc.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/bloc/user_event.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/screens/bookmarks_page.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/screens/users_list_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    // Load users on initial app load
    context.read<UserBloc>().add(const UserEvent.fetchNextPage(pageKey: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StackOverflow Users')),
      body: IndexedStack(
        index: _selectedTabIndex,
        children: const [UsersPage(), BookmarksPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
          });
          // Load appropriate data when tab is switched
          if (index == 0) {
            // Users tab
            context.read<UserBloc>().add(const UserEvent.refreshUsers());
          } else if (index == 1) {
            // Bookmarks tab
            context.read<UserBloc>().add(const UserEvent.loadBookmarkedUsers());
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Users'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmarks',
          ),
        ],
      ),
    );
  }
}
