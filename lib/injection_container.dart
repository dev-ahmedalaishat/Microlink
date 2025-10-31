import 'package:get_it/get_it.dart';

// Core
import 'core/network/api_client.dart';

// Data
import 'features/social/data/datasources/social_remote_datasource.dart';
import 'features/social/data/repositories/social_repository_impl.dart';
// import 'features/social/data/repositories/mock_social_repository.dart';

// Domain
import 'features/social/domain/repositories/social_repository.dart';

// Presentation
import 'features/social/presentation/cubit/posts/posts_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Core - Network
  sl.registerLazySingleton<ApiClient>(() => ApiClient());

  //! Data Sources
  sl.registerLazySingleton<SocialRemoteDataSource>(
    () => SocialRemoteDataSource(sl()),
  );

  //! Repository (Real implementation)
  // Use SocialRepositoryImpl for real API calls
  sl.registerLazySingleton<SocialRepository>(() => SocialRepositoryImpl(sl()));

  // Uncomment below to use mock implementation instead
  // sl.registerLazySingleton<SocialRepository>(
  //   () => MockSocialRepository(),
  // );

  //! Cubits
  sl.registerFactory(() => PostsCubit(sl()));
  sl.registerFactory(() => MyPostsCubit(sl())..loadMyPosts());
  sl.registerFactory(() => PostCreationCubit(sl()));
}
