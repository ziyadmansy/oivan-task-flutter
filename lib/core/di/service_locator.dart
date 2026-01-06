import 'package:get_it/get_it.dart';
import 'package:stackoverflow_users_reputation/core/network/api_service.dart';

import '../../modules/reputation/data/datasources/reputation_remote_data_source.dart';
import '../../modules/reputation/data/repositories_impl/reputation_repository_impl.dart';
import '../../modules/reputation/domain/repositories/reputation_repository.dart';
import '../../modules/reputation/domain/usecases/reputation_usecases.dart';
import '../../modules/reputation/presentation/bloc/reputation_bloc.dart';
import '../../modules/users/data/datasources/user_local_data_source.dart';
import '../../modules/users/data/datasources/user_remote_data_source.dart';
import '../../modules/users/data/repositories_impl/user_repository_impl.dart';
import '../../modules/users/domain/repositories/user_repository.dart';
import '../../modules/users/domain/usecases/user_usecases.dart';
import '../../modules/users/presentation/bloc/user_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Network
  getIt.registerSingleton<ApiService>(ApiService());

  // Users Data Sources
  getIt.registerSingleton<UserRemoteDataSource>(
    UserRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerSingleton<UserLocalDataSource>(UserLocalDataSourceImpl());

  // Users Repository
  getIt.registerSingleton<UserRepository>(
    UserRepositoryImpl(
      remoteDataSource: getIt<UserRemoteDataSource>(),
      localDataSource: getIt<UserLocalDataSource>(),
    ),
  );

  // Users Use Cases
  getIt.registerSingleton<GetUsersUseCase>(
    GetUsersUseCase(repository: getIt<UserRepository>()),
  );
  getIt.registerSingleton<BookmarkUserUseCase>(
    BookmarkUserUseCase(repository: getIt<UserRepository>()),
  );
  getIt.registerSingleton<RemoveBookmarkUseCase>(
    RemoveBookmarkUseCase(repository: getIt<UserRepository>()),
  );
  getIt.registerSingleton<GetBookmarkedUsersUseCase>(
    GetBookmarkedUsersUseCase(repository: getIt<UserRepository>()),
  );
  getIt.registerSingleton<IsUserBookmarkedUseCase>(
    IsUserBookmarkedUseCase(repository: getIt<UserRepository>()),
  );

  // Users BloC
  getIt.registerSingleton<UserBloc>(
    UserBloc(
      getUsersUseCase: getIt<GetUsersUseCase>(),
      bookmarkUserUseCase: getIt<BookmarkUserUseCase>(),
      removeBookmarkUseCase: getIt<RemoveBookmarkUseCase>(),
      getBookmarkedUsersUseCase: getIt<GetBookmarkedUsersUseCase>(),
    ),
  );

  // Reputation Data Sources
  getIt.registerSingleton<ReputationRemoteDataSource>(
    ReputationRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );

  // Reputation Repository
  getIt.registerSingleton<ReputationRepository>(
    ReputationRepositoryImpl(
      remoteDataSource: getIt<ReputationRemoteDataSource>(),
    ),
  );

  // Reputation Use Cases
  getIt.registerSingleton<GetReputationHistoryUseCase>(
    GetReputationHistoryUseCase(repository: getIt<ReputationRepository>()),
  );

  // Reputation BloC
  getIt.registerSingleton<ReputationBloc>(
    ReputationBloc(
      getReputationHistoryUseCase: getIt<GetReputationHistoryUseCase>(),
    ),
  );
}
