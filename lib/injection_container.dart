import 'package:get_it/get_it.dart';

// Core
import 'core/network/api_client.dart';

// Social Feature
import 'features/social/data/datasources/social_remote_datasource.dart';
import 'features/social/data/repositories/social_repository_impl.dart';
import 'features/social/domain/repositories/social_repository.dart';
import 'features/social/presentation/cubit/posts/posts_cubit.dart';

// Comments Feature
import 'features/comments/data/datasources/comments_remote_datasource.dart';
import 'features/comments/data/repositories/comments_repository_impl.dart';
import 'features/comments/domain/repositories/comments_repository.dart';
import 'features/comments/presentation/cubit/comments_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Core - Network
  sl.registerLazySingleton<ApiClient>(() => ApiClient());

  //! Social Feature
  // Data Sources
  sl.registerLazySingleton<SocialRemoteDataSource>(
    () => SocialRemoteDataSource(sl()),
  );

  // Repository
  sl.registerLazySingleton<SocialRepository>(() => SocialRepositoryImpl(sl()));

  // Uncomment below to use mock implementation instead
  // sl.registerLazySingleton<SocialRepository>(
  //   () => MockSocialRepository(),
  // );

  // Cubits
  sl.registerFactory(() => PostsCubit(sl()));
  sl.registerFactory(() => MyPostsCubit(sl())..loadMyPosts());
  sl.registerFactory(() => PostCreationCubit(sl()));

  //! Comments Feature
  // Data Sources
  sl.registerLazySingleton<CommentsRemoteDataSource>(
    () => CommentsRemoteDataSource(sl()),
  );

  // Repository
  sl.registerLazySingleton<CommentsRepository>(
    () => CommentsRepositoryImpl(sl()),
  );

  // Cubits
  sl.registerFactory(() => CommentsCubit(sl()));
}
