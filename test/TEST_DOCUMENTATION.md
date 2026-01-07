# Unit Tests Documentation

This document describes the comprehensive unit testing strategy implemented in the StackOverflow Users & Reputation app, showcasing clean code principles and domain-driven design.

## Overview

The test suite is organized following the project's clean architecture structure, with tests for:
- **BLoCs** (State Management Layer)
- **Use Cases** (Domain Business Logic Layer)
- **Repositories** (Data Layer)

## Test Structure

```
test/
├── unit/
│   └── modules/
│       ├── users/
│       │   ├── presentation/
│       │   │   └── bloc/
│       │   │       └── user_bloc_test.dart
│       │   └── domain/
│       │       └── usecases/
│       │           └── user_usecases_test.dart
│       └── reputation/
│           └── presentation/
│               └── bloc/
│                   └── reputation_bloc_test.dart
└── integration/
```

## Testing Dependencies

- **bloc_test: ^9.1.4** - BLoC testing framework for predictable testing
- **mockito: ^5.4.2** - Mocking library for creating mock objects
- **flutter_test** - Flutter's testing framework

## Test Coverage

### 1. UserBloc Tests (`user_bloc_test.dart`)

#### Purpose
Tests the state management logic for user listing, bookmarking, and filtering.

#### Test Groups

**FetchNextPage Event Tests**
- Tests successful pagination with user list
- Validates loading states and error handling
- Ensures last page detection works correctly
- Verifies multiple page accumulation

```dart
blocTest<UserBloc, UserState>(
  'emits [loading, success] when fetching users succeeds',
  // Verifies state transitions and proper use case invocation
)
```

**ToggleBookmark Event Tests**
- Tests bookmarking a non-bookmarked user
- Tests removing bookmark from bookmarked user
- Tests list reload when removing bookmark while filtering
- Validates error handling during bookmark operations

```dart
blocTest<UserBloc, UserState>(
  'bookmarks a user when not bookmarked',
  // Verifies bookmark state changes and repository calls
)
```

**FilterByBookmark Event Tests**
- Tests loading filtered bookmarked users
- Tests returning to full list when filter is disabled
- Validates error handling during filter operations

**RefreshUsers Event Tests**
- Tests complete user list refresh
- Tests state reset on refresh
- Validates error handling during refresh

**LoadBookmarkedUsers Event Tests**
- Tests loading all bookmarked users
- Validates error handling

#### Key Assertions

- State transitions (loading → success/error)
- Correct use case invocations with proper parameters
- Error propagation from use cases
- Bookmark state persistence across operations
- Filter state management

### 2. ReputationBloc Tests (`reputation_bloc_test.dart`)

#### Purpose
Tests the state management logic for user reputation history pagination and refresh.

#### Test Groups

**FetchNextPage Event Tests**
- Tests successful reputation history pagination
- Validates multi-page loading
- Tests last page detection with empty results
- Error handling for failed requests

**RefreshReputationHistory Event Tests**
- Tests successful refresh operation
- Tests reset to first page on refresh
- Validates error handling

**Edge Cases Tests**
- Tests that loading state prevents duplicate requests
- Tests correct page appending to existing pages
- Validates proper state accumulation

#### Key Assertions

- Proper pagination state management
- Correct use case parameters
- State transitions and error handling
- Duplicate request prevention during loading

### 3. User Use Cases Tests (`user_usecases_test.dart`)

#### Purpose
Tests domain business logic layer, demonstrating domain-driven design principles.

#### Test Groups

**GetUsersUseCase Tests**
- Tests successful user retrieval
- Tests empty result handling
- Tests exception propagation
- Tests multiple page size support

**BookmarkUserUseCase Tests**
- Tests user bookmarking
- Tests already bookmarked user handling
- Tests error handling

**RemoveBookmarkUseCase Tests**
- Tests bookmark removal
- Tests non-existent user handling
- Tests error propagation

**GetBookmarkedUsersUseCase Tests**
- Tests bookmarked user retrieval
- Tests empty bookmarks handling
- Tests multiple bookmarked user retrieval
- Tests error propagation

#### Key Assertions

- Correct repository method invocation
- Parameter validation
- Exception propagation
- Business logic correctness

## Running Tests

### Run All Tests
```bash
flutter test
```

### Run Unit Tests Only
```bash
flutter test test/unit
```

### Run Specific Test File
```bash
flutter test test/unit/modules/users/presentation/bloc/user_bloc_test.dart
```

### Run Tests with Coverage
```bash
flutter test --coverage
```

### View Coverage Report
```bash
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## Testing Best Practices Demonstrated

### 1. Clean Code Principles

**Single Responsibility**
- Each test focuses on one specific behavior
- Test names clearly describe what is being tested

**Test Names Follow AAA Pattern**
- **Arrange**: Setup test data and mocks
- **Act**: Perform the action being tested
- **Assert**: Verify expected outcomes

```dart
test('should call repository.getUsers with correct parameters', () async {
  // Arrange
  when(mockUserRepository.getUsers(page: 1, pageSize: 20))
      .thenAnswer((_) async => sampleUsers);

  // Act
  final result = await useCase(page: 1, pageSize: 20);

  // Assert
  expect(result, sampleUsers);
});
```

### 2. Domain-Driven Design

**Use Case Testing**
- Tests focus on business domain logic
- Repository abstraction is mocked, isolating domain layer
- Use cases are verified to call repositories correctly

```dart
// Testing domain business logic in isolation
test('should call repository.bookmarkUser with correct user', () async {
  when(mockUserRepository.bookmarkUser(sampleUser))
      .thenAnswer((_) async {});
  
  final useCase = BookmarkUserUseCase(repository: mockUserRepository);
  await useCase(sampleUser);
  
  verify(mockUserRepository.bookmarkUser(sampleUser)).called(1);
});
```

### 3. BLoC Testing with bloc_test

**Event-State Verification**
- Tests verify that events produce expected state transitions
- Uses `blocTest` for comprehensive BLoC testing

```dart
blocTest<UserBloc, UserState>(
  'emits [loading, success] when fetching users succeeds',
  setUp: () {
    // Mock dependencies
  },
  build: () => userBloc,
  act: (bloc) => bloc.add(event),
  expect: () => [expectedState1, expectedState2],
  verify: (_) {
    // Verify mock invocations
  },
)
```

### 4. Mock Management

**Proper Mock Isolation**
- Uses `@GenerateNiceMocks` for compile-time mock generation
- Mocks are reset between tests via `setUp`
- Verifies exact method invocations with `verify`

### 5. Test Data Management

**Reusable Sample Data**
- Sample entities defined once and reused across tests
- Data variations created using `copyWith` for specific test scenarios

```dart
final sampleUser = UserEntity(...);
final bookmarkedUser = sampleUser.copyWith(isBookmarked: true);
```

### 6. Edge Case Testing

**Comprehensive Scenario Coverage**
- Empty result handling
- Error conditions
- State prevention (loading state prevents duplicate requests)
- Multiple page accumulation
- Filter state persistence

## Code Quality Metrics

### Test Organization
✅ Tests are organized by feature module and layer
✅ Clear separation between unit and integration tests
✅ Test names describe behavior, not implementation

### Coverage Areas
✅ Happy path scenarios
✅ Error handling and exceptions
✅ Edge cases and boundary conditions
✅ State transitions and side effects
✅ Integration between layers (BLoC ↔ Use Cases)

### Testing Principles Applied
✅ **DRY** - Sample data defined once, reused across tests
✅ **AAA Pattern** - Arrange, Act, Assert structure
✅ **Single Assertion** - Each test validates one behavior (primary assertion)
✅ **No Implementation Details** - Tests focus on behavior, not internals
✅ **Isolated Tests** - Each test is independent with proper setup/teardown

## Interview Highlights

This test suite demonstrates:

1. **Clean Code** - Well-organized, readable, maintainable tests following SOLID principles
2. **Domain-Driven Design** - Tests focus on business logic at domain layer
3. **Proper Mocking** - Isolation of layers using mocks and verifying interactions
4. **BLoC Pattern Mastery** - Comprehensive state management testing
5. **Error Handling** - Proper exception propagation and error state testing
6. **Professional Practices** - Following industry-standard testing patterns and conventions

## Running Tests in CI/CD

```yaml
# Example GitHub Actions workflow
- name: Run unit tests
  run: flutter test test/unit

- name: Generate coverage
  run: flutter test --coverage

- name: Upload coverage
  run: bash <(curl -s https://codecov.io/bash)
```

## Future Test Enhancements

- [ ] Add repository layer tests
- [ ] Add data source tests (remote/local)
- [ ] Add widget/UI tests
- [ ] Add integration tests
- [ ] Setup code coverage monitoring (>80% target)
- [ ] Add performance benchmarks
