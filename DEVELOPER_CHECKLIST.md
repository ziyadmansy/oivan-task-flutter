# Developer Checklist & Getting Started

## 🚀 Initial Setup

### Prerequisites
- [ ] Flutter SDK >= 3.7.2
- [ ] Dart SDK >= 3.7.2
- [ ] VS Code or Android Studio
- [ ] Understanding of BLoC pattern (recommended)

### First Time Setup
```bash
# 1. Navigate to project
cd /Users/ziyadmansy/flutter_projects/oivan_task

# 2. Get dependencies
flutter pub get

# 3. Generate code
flutter pub run build_runner build --delete-conflicting-outputs

# 4. Run the app
flutter run
```

## 📋 Pre-Development Checklist

- [ ] All dependencies installed via `flutter pub get`
- [ ] Code generated via `build_runner`
- [ ] No analysis errors via `flutter analyze`
- [ ] App runs without crashes via `flutter run`

## 🎯 Feature Checklist

### Users List Feature
- [ ] User list loads from API
- [ ] Pagination works (scroll to load more)
- [ ] Bookmark button appears for each user
- [ ] Bookmark toggles between filled/unfilled state
- [ ] Filter button shows in app bar
- [ ] Filter switch works (All Users ↔ Bookmarked Only)
- [ ] User taps navigates to reputation screen
- [ ] Bookmarks persist after app restart

### Reputation History Feature
- [ ] Clicking user navigates to detail screen
- [ ] User header displays correctly
- [ ] Total reputation shows in header
- [ ] Reputation list loads from API
- [ ] Pagination works for reputation history
- [ ] Reputation change colors (green/red) show correctly
- [ ] Date format displays properly
- [ ] Back button works (navigation)

### Data Persistence
- [ ] Hive service initializes without errors
- [ ] BookmarkedUserModel registers with Hive
- [ ] Bookmarks save to local storage
- [ ] Bookmarks load on app startup
- [ ] Bookmarks survive app restart
- [ ] Clear bookmarks works (if implemented)

## 🧪 Testing Checklist

### Run Tests
```bash
# All tests
flutter test test/unit/

# Specific test file
flutter test test/unit/user_bloc_test.dart
flutter test test/unit/reputation_bloc_test.dart
flutter test test/unit/user_usecases_test.dart
flutter test test/unit/reputation_usecases_test.dart

# With coverage
flutter test --coverage
```

### Test Results Expected
- [ ] UserBloc: 7+ test scenarios passing
- [ ] ReputationBloc: 5+ test scenarios passing
- [ ] User Use Cases: 5 test groups passing
- [ ] Reputation Use Cases: 5 test groups passing
- [ ] No test failures or warnings
- [ ] Code coverage > 70% for business logic

## 🔍 Code Quality Checklist

### Analysis
- [ ] Run `flutter analyze` - no errors or critical warnings
- [ ] Check for unused imports
- [ ] Check for unused variables
- [ ] Code follows Dart conventions

### Code Generation
- [ ] All `.freezed.dart` files exist
- [ ] All `.g.dart` files exist
- [ ] No missing imports in generated files
- [ ] Generated code compiles without errors

### BLoCs
- [ ] UserBloc initializes correctly
- [ ] ReputationBloc initializes correctly
- [ ] BloCs disposed properly
- [ ] Events handled without errors
- [ ] States emitted correctly
- [ ] No BLoC listener memory leaks

## 🎨 UI/UX Checklist

### Users List Screen
- [ ] App bar displays correctly
- [ ] Filter button positions in app bar
- [ ] User cards display with proper spacing
- [ ] Profile images load or show default icon
- [ ] User names are readable
- [ ] Reputation score displays
- [ ] Bookmark icon is clickable
- [ ] Loading spinner appears during fetch
- [ ] Error messages display when API fails
- [ ] Empty state shows when no users

### Reputation Detail Screen
- [ ] App bar shows user name
- [ ] Back button works
- [ ] User header displays with avatar
- [ ] Total reputation shows
- [ ] Reputation list displays correctly
- [ ] Colors for positive/negative changes visible
- [ ] Dates format correctly
- [ ] Loading spinner appears
- [ ] Error messages display properly
- [ ] Empty state shows when no history

## 🔧 API Integration Checklist

### StackOverflow API
- [ ] Users endpoint `/users` works
- [ ] Pagination parameters work (page, pagesize)
- [ ] Response parsing works
- [ ] Reputation endpoint `/users/{id}/reputation-history` works
- [ ] Date conversion from Unix timestamp works
- [ ] API errors handled gracefully
- [ ] Network errors show proper messages

## 💾 Data Storage Checklist

### Hive Setup
- [ ] HiveService.init() completes without errors
- [ ] BookmarkedUserModel adapter registers
- [ ] Hive box opens successfully
- [ ] Data saves to Hive box
- [ ] Data retrieves from Hive box
- [ ] Data persists after app restart

### Bookmark Operations
- [ ] Add bookmark saves to Hive
- [ ] Remove bookmark deletes from Hive
- [ ] Check if bookmarked queries Hive correctly
- [ ] Get all bookmarks returns correct list
- [ ] Hive box closes properly on exit

## 🔐 Error Handling Checklist

### Network Errors
- [ ] API timeout handled
- [ ] Connection error handled
- [ ] Invalid response handled
- [ ] 400/500 errors handled
- [ ] User sees error message

### Data Errors
- [ ] Missing fields handled
- [ ] Invalid data types handled
- [ ] Empty responses handled
- [ ] Null safety respected

### Local Storage Errors
- [ ] Hive initialization errors caught
- [ ] Box open errors caught
- [ ] Write errors caught
- [ ] Read errors caught

## 📱 Device Testing Checklist

### Different Screen Sizes
- [ ] Phone (small) - layout responsive
- [ ] Tablet (large) - layout responsive
- [ ] Landscape orientation works
- [ ] Portrait orientation works

### Different API Responses
- [ ] Works with empty user list
- [ ] Works with single user
- [ ] Works with many users (100+)
- [ ] Works with users having no profile image
- [ ] Works with reputation having no post ID

### Performance
- [ ] Scrolling is smooth (60 fps)
- [ ] No jank during pagination
- [ ] Memory usage reasonable
- [ ] No crashes with large lists

## 🚀 Deployment Checklist

### Before Release
- [ ] All tests passing
- [ ] No console errors or warnings
- [ ] No debug prints left in code
- [ ] Version numbers updated
- [ ] Release notes prepared
- [ ] API keys are production (not debug)

### Build Checklist
- [ ] Debug build: `flutter build apk`
- [ ] Release build: `flutter build apk --release`
- [ ] iOS build: `flutter build ios`
- [ ] Web build: `flutter build web`

## 📚 Documentation Checklist

### Code Documentation
- [ ] Major classes documented with comments
- [ ] Complex logic explained
- [ ] TODO items noted where needed

### Project Documentation
- [ ] README.md complete
- [ ] PROJECT_DOCUMENTATION.md complete
- [ ] SETUP_GUIDE.md complete
- [ ] IMPLEMENTATION_SUMMARY.md complete

### API Documentation
- [ ] API endpoints documented
- [ ] Response formats documented
- [ ] Error codes documented

## 🐛 Debugging Tips

### Common Issues & Solutions

**Issue**: Build runner errors
```bash
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

**Issue**: Hive adapter not found
- Ensure `bookmarked_user_model.g.dart` is generated
- Check Hive type ID doesn't conflict

**Issue**: BLoC not emitting states
- Check BloC is provided in MultiBlocProvider
- Verify events are being added to BLoC
- Check state conditions in listeners/builders

**Issue**: API returning 403
- Check internet connection
- Verify StackOverflow API is accessible
- Check for API rate limiting

**Issue**: Images not loading
- Check URL is valid
- Verify https is used
- Check network connectivity

## ✅ Final Verification

Run this final checklist before considering project complete:

```bash
# 1. Clean everything
flutter clean

# 2. Get dependencies
flutter pub get

# 3. Generate code
flutter pub run build_runner build --delete-conflicting-outputs

# 4. Analyze
flutter analyze

# 5. Run tests
flutter test test/unit/

# 6. Run app
flutter run
```

All steps should complete without errors!

## 📞 Support Resources

- Flutter Documentation: https://flutter.dev/docs
- BLoC Library: https://bloclibrary.dev
- Freezed Package: https://pub.dev/packages/freezed
- StackOverflow API Docs: https://api.stackexchange.com/docs
- Hive Documentation: https://docs.hivedb.dev

## 🎉 Success!

When all checks pass, your Flutter project is ready for:
- ✅ Development
- ✅ Testing
- ✅ Code Review
- ✅ Deployment

Happy coding! 🚀
