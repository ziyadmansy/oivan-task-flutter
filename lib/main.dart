import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/service_locator.dart';
import 'core/routes/app_routes.dart';
import 'core/storage/hive_service.dart';
import 'core/styles/app_theme.dart';
import 'modules/reputation/presentation/bloc/reputation_bloc.dart';
import 'modules/users/presentation/bloc/user_bloc.dart';

/// Generating internalization files (messages) for the app:
/// dart pub global run intl_utils:generate
///
/// Generating build files for the app:
/// dart run build_runner build --delete-conflicting-outputs

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await HiveService.init();

  // Setup dependency injection
  await setupServiceLocator();

  runApp(const StackOverflowUsersApp());
}

class StackOverflowUsersApp extends StatelessWidget {
  const StackOverflowUsersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(create: (context) => getIt<UserBloc>()),
        BlocProvider<ReputationBloc>(
          create: (context) => getIt<ReputationBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'StackOverflow Users',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        onGenerateRoute: AppRouter.onGenerateRoute,
        home: const Scaffold(body: SizedBox()),
        initialRoute: '/',
      ),
    );
  }
}
