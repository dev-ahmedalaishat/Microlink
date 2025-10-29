import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:microlink/core/theme/spacing.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../../../core/theme/color_palette.dart';
import '../../../../core/theme/text_styles.dart';
import '../cubit/posts/posts_cubit.dart';
import '../widgets/latest_feed_view.dart';
import '../widgets/my_posts_feed_view.dart';
import '../widgets/stories_section.dart';

class SocialMainPage extends StatefulWidget {
  const SocialMainPage({super.key});

  @override
  State<SocialMainPage> createState() => _SocialMainPageState();
}

class _SocialMainPageState extends State<SocialMainPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Load initial data
    context.read<PostsCubit>().loadLatestPosts();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Feed'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // // Stories Section
          // StoriesSection(
          //   stories: const [
          //     StoryItem(label: 'TSC'),
          //     StoryItem(label: 'Micropolis'),
          //     StoryItem(label: 'Garden'),
          //   ],
          //   onAddStory: () {
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       const SnackBar(content: Text('Add story coming soon!')),
          //     );
          //   },
          // ),

          // Tab Bar
          _buildTabBar(),

          Divider(height: 1),

          // Tab Content
          TabBarView(
            controller: _tabController,
            children: const [LatestFeedView(), MyPostsFeedView()],
          ).expanded(),
        ],
      ),

      // Bottom Navigation with FAB
      bottomNavigationBar: _buildBottomNavigation(),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      labelColor: Theme.of(context).colorScheme.onSurface,
      unselectedLabelColor: Theme.of(
        context,
      ).colorScheme.onSurface.withAlpha(154),
      labelStyle: Theme.of(
        context,
      ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w800),
      unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(color: AppColors.primary, width: 3),
      ),
      dividerColor: Colors.transparent,
      dividerHeight: 1,
      tabAlignment: TabAlignment.center,
      tabs: [
        const Tab(text: 'Latest').paddingSymmetric(horizontal: AppSpacing.xxxl),
        const Tab(
          text: 'My Posts',
        ).paddingSymmetric(horizontal: AppSpacing.xxl),
      ],
    );
  }

  Widget _buildBottomNavigation() {
    return BottomAppBar(
      color: AppColors.surface,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.map, 'Map', false),
          _buildNavItem(Icons.people, 'Socials', true),
          _buildNavItem(Icons.home, 'My Unit', false),
          const SizedBox(width: 48), // Space for FAB
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive ? AppColors.primary : AppColors.iconInactive,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? AppColors.primary : AppColors.iconInactive,
          ),
        ),
      ],
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Post creation coming soon!')),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
