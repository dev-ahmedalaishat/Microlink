import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Core
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'injection_container.dart' as di;

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<PostsCubit>()),
        BlocProvider(create: (_) => di.sl<MyPostsCubit>()),
        BlocProvider(create: (_) => di.sl<PostCreationCubit>()),
      ],
      child: MaterialApp.router(
        title: 'MicroLink',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
