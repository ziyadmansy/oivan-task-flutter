class AppConstants {
  AppConstants._();

  // API Constants
  static const String baseUrl = 'https://open.er-api.com/v6/latest';
  static const String baseCurrency = 'USD';

  // Local Storage Keys
  static const String userPrefsBoxKey = 'user_prefs_box';
  static const String currencyRatesBoxKey = 'currency_rates_box';

  // Pagination
  static const int itemsPerPage = 30;
  static const int maxRetryAttempts = 3;

  // Date Formats
  static const String dateFormat = 'yyyy-MM-dd';
  static const String displayDateFormat = 'MMM dd, yyyy';
  static const String timeFormat = 'HH:mm';

  // Error Messages
  static const String networkErrorMessage =
      'Please check your internet connection';
  static const String serverErrorMessage =
      'Server error occurred. Please try again';
  static const String cacheErrorMessage = 'Local storage error occurred';
  static const String validationErrorMessage = 'Please check your input';
  static const String unexpectedErrorMessage = 'An unexpected error occurred';

  // Image Picker
  static const double maxImageSizeMB = 5.0;
  static const int imageQuality = 80;
}
