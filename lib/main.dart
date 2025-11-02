import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microlink/core/router/app_router_v2.dart';
import 'package:microlink/features/comments/presentation/cubit/comments_cubit.dart';
import 'package:provider/provider.dart';

// Core
import 'core/theme/app_theme.dart';
import 'injection_container.dart' as di;

// Domain
import 'features/social/domain/repositories/social_repository.dart';

// Features
import 'features/social/presentation/cubit/posts/posts_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  await di.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Repository providers
        Provider<SocialRepository>(create: (_) => di.sl<SocialRepository>()),
        // Bloc providers
        BlocProvider(create: (_) => di.sl<PostsCubit>()),
        BlocProvider(create: (_) => di.sl<MyPostsCubit>()),
        BlocProvider(create: (_) => di.sl<PostCreationCubit>()),
        BlocProvider(create: (_) => di.sl<CommentsCubit>()),
      ],
      child: MaterialApp(
        title: 'MicroLink',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        // routerConfig: AppRouter.router,
        home: AppRouterV2(),
      ),
    );
  }
}
