# Quick Setup Guide

## Step-by-Step Setup Instructions

### 1. Install Dependencies
```bash
cd /Users/ziyadmansy/flutter_projects/oivan_task
flutter pub get
```

### 2. Generate Code
Run the build runner to generate code for Freezed, JSON serialization, and Hive:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

This will generate:
- `user_model.freezed.dart` and `user_model.g.dart`
- `reputation_model.freezed.dart` and `reputation_model.g.dart`
- `bookmarked_user_model.g.dart` (Hive adapter)
- Event and State freezed classes

### 3. Run the App
```bash
flutter run
```

## Project Structure Overview

### Modules

#### Users Module
Handles fetching, displaying, and bookmarking StackOverflow users.

**Key Files:**
- `lib/modules/users/presentation/screens/users_list_screen.dart` - Main UI
- `lib/modules/users/presentation/bloc/user_bloc.dart` - State management
- `lib/modules/users/domain/usecases/user_usecases.dart` - Business logic

#### Reputation Module
Handles displaying user reputation history.

**Key Files:**
- `lib/modules/reputation/presentation/screens/reputation_detail_screen.dart` - Detail view
- `lib/modules/reputation/presentation/bloc/reputation_bloc.dart` - State management
- `lib/modules/reputation/domain/usecases/reputation_usecases.dart` - Business logic

### Core Module
Contains shared functionality:
- **DI (Dependency Injection)**: `core/di/service_locator.dart`
- **Routing**: `core/routes/app_routes.dart`
- **Storage**: `core/storage/hive_service.dart`
- **Network**: `core/network/dio_client.dart`

## Running Tests

### Unit Tests
```bash
# Run all unit tests
flutter test test/unit/

# Run specific test
flutter test test/unit/user_bloc_test.dart

# Run with verbose output
flutter test test/unit/ -v
```

### Test Files
- `test/unit/user_bloc_test.dart` - UserBloc state management tests
- `test/unit/user_usecases_test.dart` - Use case logic tests
- `test/unit/reputation_bloc_test.dart` - ReputationBloc tests
- `test/unit/reputation_usecases_test.dart` - Reputation use case tests

## Troubleshooting

### Issue: Build runner errors
```bash
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

### Issue: Hive adapter not found
Make sure `bookmarked_user_model.g.dart` is generated:
```bash
flutter pub run build_runner build
```

### Issue: Models not generating
Check that files have correct Freezed annotations:
```dart
@freezed
class UserModel with _$UserModel {
  const factory UserModel({...}) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) => 
    _$UserModelFromJson(json);
}
```

## Key Features Implemented

### ✅ User List Screen
- Infinite scrolling pagination
- Bookmark/unbookmark functionality
- Filter by bookmarked users
- Display user reputation and profile image

### ✅ Reputation Detail Screen
- Click user to view reputation history
- Show reputation changes over time
- Display reputation type and amount changed
- Pagination support

### ✅ Data Persistence
- Bookmarks saved using Hive
- Automatically persisted across app restarts
- Fast local access

### ✅ Clean Architecture
- Domain, Data, and Presentation layers
- Repository pattern for data abstraction
- Use cases for business logic
- BLoC for state management

### ✅ Testing
- Unit tests for BLoCs
- Unit tests for use cases
- Mock repositories using Mockito
- Test event-state scenarios

## Architecture Diagram

```
Presentation Layer (Screens, Widgets, BLoCs)
        ↓
Domain Layer (Use Cases, Entities, Repositories)
        ↓
Data Layer (Repositories, Data Sources, Models)
        ↓
External Services (API, Local Storage)
```

## API Endpoints

### Get Users
```
GET https://api.stackexchange.com/2.2/users?page=1&pagesize=30&site=stackoverflow
```

### Get Reputation History
```
GET https://api.stackexchange.com/2.2/users/{userId}/reputation-history?page=1&pagesize=30&site=stackoverflow
```

## Dependencies

Key packages used:
- `flutter_bloc: ^8.1.3` - State management
- `freezed_annotation: ^2.4.1` - Code generation
- `dio: ^5.9.0` - HTTP client
- `hive: ^2.2.3` - Local storage
- `get_it: ^7.6.4` - Dependency injection
- `bloc_test: ^9.1.4` - BLoC testing
- `mockito: ^5.4.2` - Mocking for tests

## Next Steps

1. ✅ Generate code with build_runner
2. ✅ Run the app
3. ✅ Test bookmark functionality
4. ✅ Click users to see reputation
5. ✅ Run unit tests

## Support

For issues or questions, refer to:
- PROJECT_DOCUMENTATION.md - Comprehensive guide
- Test files - Implementation examples
- Code comments - Inline documentation
