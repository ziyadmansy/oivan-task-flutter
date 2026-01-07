import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:stackoverflow_users_reputation/modules/users/domain/entities/badge_counts_entity.dart';
import 'package:stackoverflow_users_reputation/modules/users/domain/entities/user_entity.dart';
import 'package:stackoverflow_users_reputation/modules/users/presentation/widgets/user_list_item.dart';

void main() {
  group('UserListItem Widget Tests', () {
    final testUser = UserEntity(
      userId: 1,
      displayName: 'John Doe',
      profileImage: null,
      reputation: 5000,
      badgeCounts: const BadgeCountsEntity(bronze: 10, silver: 5, gold: 2),
      location: 'New York',
      websiteUrl: 'https://johndoe.com',
      isBookmarked: false,
    );

    testWidgets('renders Card widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserListItem(
              user: testUser,
              onBookmarkToggle: (_) {},
              onUserTap: (_) {},
            ),
          ),
        ),
      );
      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets('renders ListTile widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserListItem(
              user: testUser,
              onBookmarkToggle: (_) {},
              onUserTap: (_) {},
            ),
          ),
        ),
      );
      expect(find.byType(ListTile), findsOneWidget);
    });

    testWidgets('renders user display name', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserListItem(
              user: testUser,
              onBookmarkToggle: (_) {},
              onUserTap: (_) {},
            ),
          ),
        ),
      );
      expect(find.text('John Doe'), findsOneWidget);
    });

    testWidgets('renders CircleAvatar widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserListItem(
              user: testUser,
              onBookmarkToggle: (_) {},
              onUserTap: (_) {},
            ),
          ),
        ),
      );
      expect(find.byType(CircleAvatar), findsOneWidget);
    });

    testWidgets('renders default person icon when no profile image', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserListItem(
              user: testUser,
              onBookmarkToggle: (_) {},
              onUserTap: (_) {},
            ),
          ),
        ),
      );
      expect(find.byIcon(Icons.person), findsOneWidget);
    });

    testWidgets('toggles bookmark button correctly', (
      WidgetTester tester,
    ) async {
      UserEntity? toggledUser;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserListItem(
              user: testUser,
              onBookmarkToggle: (user) {
                toggledUser = user;
              },
              onUserTap: (_) {},
            ),
          ),
        ),
      );
      final bookmarkButton = find.byIcon(Icons.bookmark_border);
      expect(bookmarkButton, findsOneWidget);
      await tester.tap(bookmarkButton);
      await tester.pumpAndSettle();
      expect(toggledUser, testUser);
    });

    testWidgets('shows filled bookmark icon when bookmarked', (
      WidgetTester tester,
    ) async {
      final bookmarkedUser = testUser.copyWith(isBookmarked: true);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserListItem(
              user: bookmarkedUser,
              onBookmarkToggle: (_) {},
              onUserTap: (_) {},
            ),
          ),
        ),
      );
      expect(find.byIcon(Icons.bookmark), findsOneWidget);
    });

    testWidgets('triggers onUserTap when tapping list item', (
      WidgetTester tester,
    ) async {
      UserEntity? tappedUser;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserListItem(
              user: testUser,
              onBookmarkToggle: (_) {},
              onUserTap: (user) {
                tappedUser = user;
              },
            ),
          ),
        ),
      );
      final listTile = find.byType(ListTile);
      await tester.tap(listTile);
      await tester.pumpAndSettle();
      expect(tappedUser, testUser);
    });

    testWidgets('renders IconButton for bookmark', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UserListItem(
              user: testUser,
              onBookmarkToggle: (_) {},
              onUserTap: (_) {},
            ),
          ),
        ),
      );
      expect(find.byType(IconButton), findsOneWidget);
    });
  });
}
