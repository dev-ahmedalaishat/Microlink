import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:microlink/core/presentation/snackbar/custom_snackbar.dart';
import 'package:microlink/core/theme/spacing.dart';
import 'package:microlink/features/social/presentation/cubit/posts/posts_state.dart';
import 'package:microlink/features/social/presentation/widgets/stories_section.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../../../core/theme/color_palette.dart';
import '../cubit/posts/posts_cubit.dart';
import '../widgets/latest_feed_tab.dart';
import '../widgets/my_posts_feed_tab.dart';
import '../widgets/create_post_widget.dart';

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
        // title: const Text('Social Feed'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => context.go('/'),
        ),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: StoriesSection(
                stories: [
                  // Dummy stories for illustration
                  StoryItem(label: 'Your Story', imageUrl: ''),
                  StoryItem(label: "Alice", imageUrl: ''),
                  StoryItem(label: "Alice", imageUrl: ''),
                  StoryItem(label: "Alice", imageUrl: ''),
                  StoryItem(label: "Alice", imageUrl: ''),
                ],
              ).paddingOnly(top: AppSpacing.md),
            ),
            SliverToBoxAdapter(child: Divider(height: 10, thickness: 4)),
            // Create Post Widget as a sliver that scrolls away
            SliverToBoxAdapter(
              child: BlocConsumer<PostCreationCubit, PostCreationState>(
                listener: (context, state) {
                  state.when(
                    initial: () => {},
                    loading: () => {context.showLoadingSnackBar('Posting...')},
                    success: (posts) => {
                      context.showSuccessSnackBar(
                        'Post submitted – pending approval',
                        onTap: () => {
                          context.hideSnackBar(),
                          _tabController.animateTo(1),
                        },
                      ),
                      context.read<MyPostsCubit>().refreshMyPosts(),
                      context.read<MyPostsCubit>().reset(),
                    },
                    error: (message) => {
                      context.showErrorSnackBar('Post submission failed'),
                      context.read<MyPostsCubit>().reset(),
                    },
                  );
                },
                builder: (context, state) {
                  return CreatePostWidget(
                        onPostClick: (params) {
                          FocusScope.of(context).unfocus();
                          context.read<PostCreationCubit>().createPost(params);
                        },
                      )
                      .paddingSymmetric(
                        horizontal: AppSpacing.screenPadding,
                        // vertical: AppSpacing.md,
                      )
                      .paddingOnly(top: AppSpacing.md);
                },
              ),
            ),
            SliverToBoxAdapter(child: Divider(height: 1)),
            // Pinned Tab Bar
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                TabBar(
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
                  // tabAlignment: TabAlignment.center,
                  tabs: [
                    const Tab(
                      text: 'Latest',
                    ).paddingSymmetric(horizontal: AppSpacing.xxl),
                    const Tab(
                      text: 'My Posts',
                    ).paddingSymmetric(horizontal: AppSpacing.xxl),
                  ],
                ),
              ),
            ),
            // Divider
            SliverToBoxAdapter(child: Divider(height: 1)),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            LatestFeedTab(
              onPostSubmitted: () {
                _tabController.animateTo(1);
              },
            ),
            MyPostsFeedTab(),
          ],
        ),
      ),

      // Bottom Navigation with FAB
      bottomNavigationBar: _buildBottomNavigation(),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
        // Demo: Show different snackbar types
      },
      child: const Icon(Icons.add),
    );
  }
}

// Delegate for pinned tab bar in NestedScrollView
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
