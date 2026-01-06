# StackOverflow Users App

A modern Flutter application built with **Clean Architecture**, **Domain-Driven Design (DDD)**, and **BLoC** pattern for state management. This app allows users to browse StackOverflow users, bookmark their favorites, and view detailed reputation history.

## Features

### 1. StackOverflow User List
- ✅ Fetch and display all StackOverflow users with pagination
- ✅ Smooth infinite scrolling for better UX
- ✅ Bookmark/unbookmark users with persistent storage
- ✅ Filter view to show only bookmarked users
- ✅ All bookmarks are maintained across app restarts

### 2. User Reputation Details
- ✅ Click on any user to view their reputation history
- ✅ View reputation changes over time
- ✅ See reputation type, change amount, and date created
- ✅ Pagination support for large reputation histories

## Project Structure

```
lib/
├── main.dart
├── core/
│   ├── di/
│   │   └── service_locator.dart          # Dependency injection setup
│   ├── error/
│   │   ├── exceptions.dart
│   │   └── failures.dart
│   ├── extensions/
│   │   └── media_query_extension.dart
│   ├── network/
│   │   ├── dio_client.dart
│   │   └── network_info.dart
│   ├── routes/
│   │   └── app_routes.dart               # Navigation routing
│   ├── storage/
│   │   └── hive_service.dart             # Local storage setup
│   ├── styles/
│   │   ├── app_colors.dart
│   │   ├── app_text_styles.dart
│   │   └── app_theme.dart
│   └── utils/
│       ├── constants.dart
│       ├── formatters.dart
│       └── validators.dart
│
├── modules/
│   ├── users/                            # Users Module
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── user_remote_data_source.dart
│   │   │   │   └── user_local_data_source.dart
│   │   │   ├── models/
│   │   │   │   ├── user_model.dart
│   │   │   │   └── bookmarked_user_model.dart
│   │   │   └── repositories_impl/
│   │   │       └── user_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── user_entity.dart
│   │   │   ├── repositories/
│   │   │   │   └── user_repository.dart
│   │   │   └── usecases/
│   │   │       └── user_usecases.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── user_bloc.dart
│   │       │   ├── user_event.dart
│   │       │   └── user_state.dart
│   │       ├── screens/
│   │       │   └── users_list_screen.dart
│   │       └── widgets/
│   │           └── user_list_item.dart
│   │
│   └── reputation/                       # Reputation Module
│       ├── data/
│       │   ├── datasources/
│       │   │   └── reputation_remote_data_source.dart
│       │   ├── models/
│       │   │   └── reputation_model.dart
│       │   └── repositories_impl/
│       │       └── reputation_repository_impl.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   └── reputation_history_entity.dart
│       │   ├── repositories/
│       │   │   └── reputation_repository.dart
│       │   └── usecases/
│       │       └── reputation_usecases.dart
│       └── presentation/
│           ├── bloc/
│           │   ├── reputation_bloc.dart
│           │   ├── reputation_event.dart
│           │   └── reputation_state.dart
│           └── screens/
│               └── reputation_detail_screen.dart
│
└── shared/
    ├── data/
    │   ├── datasources/
    │   ├── models/
    │   └── repositories_impl/
    ├── domain/
    │   ├── entities/
    │   └── repositories/
    └── widgets/
        ├── app_button.dart
        ├── app_card.dart
        ├── app_text_field.dart
        ├── empty_state_widget.dart
        ├── loading_widget.dart
        └── widgets.dart

test/
├── unit/
│   ├── user_bloc_test.dart
│   ├── user_usecases_test.dart
│   ├── reputation_bloc_test.dart
│   └── reputation_usecases_test.dart
└── integration/
```

## Architecture Overview

### Clean Architecture Layers

1. **Presentation Layer**
   - BLoCs for state management
   - Screens and Widgets
   - User interaction handling

2. **Domain Layer**
   - Use Cases (business logic)
   - Entities (business models)
   - Repository Interfaces

3. **Data Layer**
   - Repositories Implementation
   - Data Sources (Remote & Local)
   - Models (API response models)

### Design Patterns Used

- **BLoC Pattern**: For state management
- **Freezed**: For immutable models and code generation
- **Repository Pattern**: For data abstraction
- **Dependency Injection**: Using GetIt
- **Service Locator**: For centralizing dependencies

## Getting Started

### Prerequisites

- Flutter SDK >= 3.7.2
- Dart SDK >= 3.7.2

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd oivan_task
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code** (for Freezed, JSON serialization, Hive)
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## API Integration

### StackOverflow API Endpoints Used

#### 1. Get Users List
```
GET https://api.stackexchange.com/2.2/users
Parameters:
  - page: int
  - pagesize: int
  - site: 'stackoverflow'
  - order: 'desc'
  - sort: 'reputation'
```

#### 2. Get User Reputation History
```
GET https://api.stackexchange.com/2.2/users/{userId}/reputation-history
Parameters:
  - page: int
  - pagesize: int
  - site: 'stackoverflow'
```

## State Management (BLoC)

### UserBloc Events
- `LoadUsers(page, pageSize)` - Fetch users from API
- `LoadBookmarkedUsers()` - Load bookmarked users from local storage
- `ToggleBookmark(user)` - Add/remove bookmark for a user
- `FilterByBookmark(showOnlyBookmarked)` - Toggle bookmark filter

### UserBloc States
- `Initial()` - Initial state
- `Loading()` - Loading data
- `Loaded(users, showOnlyBookmarked)` - Data loaded successfully
- `Error(message)` - Error occurred

### ReputationBloc Events
- `LoadReputationHistory(userId, page, pageSize)` - Fetch reputation history

### ReputationBloc States
- `Initial()` - Initial state
- `Loading()` - Loading data
- `Loaded(reputations)` - Data loaded successfully
- `Error(message)` - Error occurred

## Local Storage

The app uses **Hive** for persistent storage:
- **Box Name**: `bookmarked_users`
- **Model**: `BookmarkedUserModel`
- **Type ID**: 1

Bookmarks are automatically saved and restored on app restart.

## Testing

### Running Unit Tests

```bash
# Run all unit tests
flutter test test/unit/

# Run specific test file
flutter test test/unit/user_bloc_test.dart

# Run with coverage
flutter test --coverage
```

### Test Coverage

The project includes comprehensive unit tests for:
- **BLoCs**: User and Reputation BLoCs with various event scenarios
- **Use Cases**: All user and reputation use cases
- **Mock Objects**: Using Mockito for dependency mocking

#### Test Files
- `test/unit/user_bloc_test.dart` - UserBloc tests
- `test/unit/user_usecases_test.dart` - User use cases tests
- `test/unit/reputation_bloc_test.dart` - ReputationBloc tests
- `test/unit/reputation_usecases_test.dart` - Reputation use cases tests

## Key Features Implementation

### 1. Pagination
Both user list and reputation history support pagination with infinite scroll:
```dart
void _onScroll() {
  if (_scrollController.position.pixels ==
      _scrollController.position.maxScrollExtent) {
    _currentPage++;
    // Load next page
  }
}
```

### 2. Bookmark Persistence
Bookmarks are stored locally using Hive and automatically loaded on app startup:
```dart
// Add bookmark
await localDataSource.addBookmark(user);

// Get all bookmarks
List<BookmarkedUserModel> bookmarks = await localDataSource.getAllBookmarks();
```

### 3. State Management
BLoC pattern ensures clean separation of concerns and testability:
```dart
BlocBuilder<UserBloc, UserState>(
  builder: (context, state) {
    if (state is _LoadedState) {
      return ListView(/* ... */);
    }
  },
)
```

## Dependency Injection Setup

All dependencies are registered in `service_locator.dart`:

```dart
// Network
getIt.registerSingleton<Dio>(dioClient.dio);

// Data Sources
getIt.registerSingleton<UserRemoteDataSource>(
  UserRemoteDataSourceImpl(dio: getIt<Dio>()),
);

// Repositories
getIt.registerSingleton<UserRepository>(
  UserRepositoryImpl(
    remoteDataSource: getIt<UserRemoteDataSource>(),
    localDataSource: getIt<UserLocalDataSource>(),
  ),
);

// BLoCs
getIt.registerSingleton<UserBloc>(
  UserBloc(
    getUsersUseCase: getIt<GetUsersUseCase>(),
    // ...
  ),
);
```

## Error Handling

The app implements comprehensive error handling:
- Network errors are caught and displayed to users
- Local storage errors are logged
- BLoC errors emit error states for UI handling

## Code Generation

The project uses code generation for:

### 1. Freezed (Models)
```bash
flutter pub run build_runner build
```

Generates:
- Immutable model classes
- `.copyWith()` methods
- `==` and `hashCode` implementations

### 2. JSON Serialization
Automatically generates `.fromJson()` and `.toJson()` methods

### 3. Hive (Local Storage)
Generates type adapters for Hive models

## Best Practices Implemented

✅ **Clean Architecture** - Separation of concerns into layers
✅ **DDD** - Domain-Driven Design principles
✅ **SOLID Principles** - Single responsibility, Dependency inversion
✅ **Testability** - Mockable dependencies, pure business logic
✅ **Code Generation** - Using Freezed and JSON serializable
✅ **Error Handling** - Comprehensive exception handling
✅ **State Management** - BLoC pattern with proper separation
✅ **Performance** - Efficient pagination and list rendering
✅ **Persistence** - Hive for reliable local storage

## Troubleshooting

### Build Issues
```bash
# Clean and rebuild
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Hive Issues
```bash
# If Hive adapter errors occur, regenerate:
flutter pub run build_runner clean
flutter pub run build_runner build
```

## Future Enhancements

- [ ] Offline support with cached data
- [ ] User profile customization
- [ ] Search functionality
- [ ] Advanced filtering options
- [ ] Export bookmarks
- [ ] Dark theme support
- [ ] Localization (i18n)
- [ ] Analytics integration

## Contributing

Feel free to submit issues and enhancement requests!

## License

This project is open source and available under the MIT License.

## Support

For support, contact the development team or check the project documentation.
