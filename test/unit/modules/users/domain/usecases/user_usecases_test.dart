import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:stackoverflow_users_reputation/modules/users/domain/entities/badge_counts_entity.dart';
import 'package:stackoverflow_users_reputation/modules/users/domain/entities/user_entity.dart';
import 'package:stackoverflow_users_reputation/modules/users/domain/repositories/user_repository.dart';
import 'package:stackoverflow_users_reputation/modules/users/domain/usecases/user_usecases.dart';

import 'user_usecases_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<UserRepository>(),
])
void main() {
  group('User Use Cases', () {
    late MockUserRepository mockUserRepository;

    // Sample data
    final sampleUser = UserEntity(
      userId: 1,
      displayName: 'John Doe',
      profileImage: 'https://example.com/john.jpg',
      reputation: 5000,
      badgeCounts: const BadgeCountsEntity(
        bronze: 10,
        silver: 5,
        gold: 2,
      ),
      location: 'New York',
      websiteUrl: 'https://johndoe.com',
      isBookmarked: false,
    );

    final sampleUsers = [
      sampleUser,
      UserEntity(
        userId: 2,
        displayName: 'Jane Smith',
        profileImage: 'https://example.com/jane.jpg',
        reputation: 7500,
        badgeCounts: const BadgeCountsEntity(
          bronze: 15,
          silver: 10,
          gold: 5,
        ),
        location: 'San Francisco',
        websiteUrl: 'https://janesmith.com',
        isBookmarked: false,
      ),
    ];

    setUp(() {
      mockUserRepository = MockUserRepository();
    });

    group('GetUsersUseCase', () {
      test('should call repository.getUsers with correct parameters', () async {
        // Arrange
        when(
          mockUserRepository.getUsers(page: 1, pageSize: 30),
        ).thenAnswer((_) async => sampleUsers);

        final useCase = GetUsersUseCase(repository: mockUserRepository);

        // Act
        final result = await useCase(page: 1, pageSize: 30);

        // Assert
        expect(result, sampleUsers);
        verify(mockUserRepository.getUsers(page: 1, pageSize: 30)).called(1);
      });

      test('should return empty list when no users are found', () async {
        // Arrange
        when(
          mockUserRepository.getUsers(page: 2, pageSize: 30),
        ).thenAnswer((_) async => []);

        final useCase = GetUsersUseCase(repository: mockUserRepository);

        // Act
        final result = await useCase(page: 2, pageSize: 30);

        // Assert
        expect(result, isEmpty);
      });

      test('should propagate repository exception', () async {
        // Arrange
        when(
          mockUserRepository.getUsers(page: 1, pageSize: 30),
        ).thenThrow(Exception('Network error'));

        final useCase = GetUsersUseCase(repository: mockUserRepository);

        // Act & Assert
        expect(
          () => useCase(page: 1, pageSize: 30),
          throwsException,
        );
      });

      test('should support different page sizes', () async {
        // Arrange
        when(
          mockUserRepository.getUsers(page: 1, pageSize: 50),
        ).thenAnswer((_) async => sampleUsers);

        final useCase = GetUsersUseCase(repository: mockUserRepository);

        // Act
        await useCase(page: 1, pageSize: 50);

        // Assert
        verify(mockUserRepository.getUsers(page: 1, pageSize: 50)).called(1);
      });
    });

    group('BookmarkUserUseCase', () {
      test('should call repository.bookmarkUser with correct user', () async {
        // Arrange
        when(
          mockUserRepository.bookmarkUser(sampleUser),
        ).thenAnswer((_) async {});

        final useCase = BookmarkUserUseCase(repository: mockUserRepository);

        // Act
        await useCase(sampleUser);

        // Assert
        verify(mockUserRepository.bookmarkUser(sampleUser)).called(1);
      });

      test('should bookmark user without errors', () async {
        // Arrange
        when(
          mockUserRepository.bookmarkUser(sampleUser),
        ).thenAnswer((_) async {});

        final useCase = BookmarkUserUseCase(repository: mockUserRepository);

        // Act & Assert
        expect(useCase(sampleUser), completes);
      });

      test('should propagate repository exception when bookmark fails', () async {
        // Arrange
        when(
          mockUserRepository.bookmarkUser(sampleUser),
        ).thenThrow(Exception('Bookmark failed'));

        final useCase = BookmarkUserUseCase(repository: mockUserRepository);

        // Act & Assert
        expect(
          () => useCase(sampleUser),
          throwsException,
        );
      });

      test('should handle already bookmarked users', () async {
        // Arrange
        final bookmarkedUser = sampleUser.copyWith(isBookmarked: true);
        when(
          mockUserRepository.bookmarkUser(bookmarkedUser),
        ).thenAnswer((_) async {});

        final useCase = BookmarkUserUseCase(repository: mockUserRepository);

        // Act
        await useCase(bookmarkedUser);

        // Assert
        verify(mockUserRepository.bookmarkUser(bookmarkedUser)).called(1);
      });
    });

    group('RemoveBookmarkUseCase', () {
      test('should call repository.removeBookmark with correct userId', () async {
        // Arrange
        when(mockUserRepository.removeBookmark(1))
            .thenAnswer((_) async {});

        final useCase = RemoveBookmarkUseCase(repository: mockUserRepository);

        // Act
        await useCase(1);

        // Assert
        verify(mockUserRepository.removeBookmark(1)).called(1);
      });

      test('should remove bookmark without errors', () async {
        // Arrange
        when(mockUserRepository.removeBookmark(1))
            .thenAnswer((_) async {});

        final useCase = RemoveBookmarkUseCase(repository: mockUserRepository);

        // Act & Assert
        expect(useCase(1), completes);
      });

      test('should propagate repository exception when removal fails', () async {
        // Arrange
        when(mockUserRepository.removeBookmark(1))
            .thenThrow(Exception('Removal failed'));

        final useCase = RemoveBookmarkUseCase(repository: mockUserRepository);

        // Act & Assert
        expect(
          () => useCase(1),
          throwsException,
        );
      });

      test('should handle non-existent user ids', () async {
        // Arrange
        when(mockUserRepository.removeBookmark(999))
            .thenAnswer((_) async {});

        final useCase = RemoveBookmarkUseCase(repository: mockUserRepository);

        // Act
        await useCase(999);

        // Assert
        verify(mockUserRepository.removeBookmark(999)).called(1);
      });
    });

    group('GetBookmarkedUsersUseCase', () {
      test('should call repository.getBookmarkedUsers', () async {
        // Arrange
        final bookmarkedUsers = [
          sampleUser.copyWith(isBookmarked: true),
        ];
        when(mockUserRepository.getBookmarkedUsers())
            .thenAnswer((_) async => bookmarkedUsers);

        final useCase = GetBookmarkedUsersUseCase(repository: mockUserRepository);

        // Act
        final result = await useCase();

        // Assert
        expect(result, bookmarkedUsers);
        verify(mockUserRepository.getBookmarkedUsers()).called(1);
      });

      test('should return empty list when no bookmarks exist', () async {
        // Arrange
        when(mockUserRepository.getBookmarkedUsers())
            .thenAnswer((_) async => []);

        final useCase = GetBookmarkedUsersUseCase(repository: mockUserRepository);

        // Act
        final result = await useCase();

        // Assert
        expect(result, isEmpty);
      });

      test('should propagate repository exception', () async {
        // Arrange
        when(mockUserRepository.getBookmarkedUsers())
            .thenThrow(Exception('Load failed'));

        final useCase = GetBookmarkedUsersUseCase(repository: mockUserRepository);

        // Act & Assert
        expect(
          () => useCase(),
          throwsException,
        );
      });

      test('should return multiple bookmarked users', () async {
        // Arrange
        final bookmarkedUsers = [
          sampleUser.copyWith(isBookmarked: true),
          sampleUsers[1].copyWith(isBookmarked: true),
        ];
        when(mockUserRepository.getBookmarkedUsers())
            .thenAnswer((_) async => bookmarkedUsers);

        final useCase = GetBookmarkedUsersUseCase(repository: mockUserRepository);

        // Act
        final result = await useCase();

        // Assert
        expect(result, hasLength(2));
        expect(result.every((u) => u.isBookmarked), true);
      });
    });
  });
}
