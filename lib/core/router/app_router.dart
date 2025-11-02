import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:microlink/core/presentation/empty_state_widget.dart';
import 'package:microlink/core/theme/spacing.dart';
import 'package:microlink/core/theme/theme_cubit.dart';
import 'package:microlink/features/social/presentation/pages/social_main_page.dart';
import 'package:microlink/features/social/presentation/widgets/svg_icon_button.dart';
import 'package:microlink/navigation/navigation_controller.dart';
import 'package:microlink/widgets/animated_bottom_navigation.dart';
import 'package:microlink/widgets/animated_fab.dart';

class AppRouter extends StatefulWidget {
  const AppRouter({super.key});

  @override
  State<AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  @override
  void initState() {
    currentPage = 1;
    tabController = TabController(
      length: 4,
      initialIndex: 1,
      vsync: this,
    ); // Back to 4 tabs
    tabController.animation?.addListener(() {
      final value = tabController.animation!.value.round();
      if (value != currentPage && mounted && value != 3) {
        // Prevent navigation to tab 3 (fourth tab)
        changePage(value);
      }
    });

    super.initState();
  }

  void changePage(int newPage) {
    // Use navigation controller to validate page
    if (!NavigationController.isValidPageIndex(newPage)) {
      return;
    }
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // title: const Text('Social Feed'),
        leading: Builder(
          builder: (context) => SvgIconButton(
            assetPath: 'assets/icons/ic_menu.svg',
            tintColor: Theme.of(context).colorScheme.onSurface,
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.surface,
        title: const StaticTopBarProfiles(),
        actions: [
          SvgIconButton(
            assetPath: 'assets/icons/ic_notification.svg',
            tintColor: Theme.of(context).colorScheme.onSurface,
            onPressed: () {},
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: BottomBar(
        borderRadius: BorderRadius.circular(AppSpacing.radiusCircular),
        curve: Curves.decelerate,
        width: 280,
        barColor: Theme.of(context).colorScheme.surface,
        barDecoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(AppSpacing.radiusCircular),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(64),
              blurRadius: 8,
              offset: const Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            AnimatedBottomNavigation(
              currentPage: currentPage,
              onPageChanged: changePage,
              tabController: tabController,
            ),
            AnimatedFab(
              onTap: () {
                print("Custom FAB tapped!");
              },
            ),
          ],
        ),
        body: (context, controller) => TabBarView(
          controller: tabController,
          dragStartBehavior: DragStartBehavior.down,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _buildComingSoonPage('assets/images/ill_no_map.png'),
            SocialMainPage(),
            _buildComingSoonPage('assets/images/ill_no_folder.png'),
            _buildComingSoonPage('assets/images/ill_no_folder.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildComingSoonPage(String imagePath) {
    return Scaffold(
      body: ComingSoonWidget(
        title: 'Coming Soon', // optional
        description:
            'This feature is under development\nand will be available soon.', // optional
        imagePath: imagePath, // optional
        imageSize: 200.0, // optional
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'MicroLink',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Social Feed',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              final isDark =
                  themeMode == ThemeMode.dark ||
                  (themeMode == ThemeMode.system &&
                      MediaQuery.of(context).platformBrightness ==
                          Brightness.dark);
              return ListTile(
                leading: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                title: Text(isDark ? 'Light Mode' : 'Dark Mode'),
                onTap: () {
                  context.read<ThemeCubit>().toggleTheme();
                  Navigator.pop(context);
                },
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              // TODO: Navigate to settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              // TODO: Show about dialog
            },
          ),
        ],
      ),
    );
  }
}
