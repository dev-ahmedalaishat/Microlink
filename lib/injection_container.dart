import 'package:get_it/get_it.dart';

// Data
import 'features/social/data/repositories/mock_social_repository.dart';

// Domain
import 'features/social/domain/repositories/social_repository.dart';

// Presentation
import 'features/social/presentation/cubit/posts/posts_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Repository (Mock implementation)
  sl.registerLazySingleton<SocialRepository>(
    () => MockSocialRepository(),
  );

  //! Cubits
  sl.registerFactory(() => PostsCubit(sl()));
  sl.registerFactory(() => MyPostsCubit(sl())..loadMyPosts("1"));
  sl.registerFactory(() => PostCreationCubit(sl()));
}
