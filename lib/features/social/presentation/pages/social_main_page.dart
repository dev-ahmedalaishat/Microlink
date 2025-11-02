import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microlink/core/presentation/snackbar/custom_snackbar.dart';
import 'package:microlink/core/theme/spacing.dart';
import 'package:microlink/features/social/presentation/cubit/posts/posts_state.dart';
import 'package:microlink/features/social/presentation/widgets/stories_section.dart';
import '../../../../core/extensions/widget_extensions.dart';
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: StoriesSection(
                stories: [
                  // Dummy stories for illustration
                  StoryItem(
                    label: "TSC",
                    imageUrl: 'assets/images/img_tsc.png',
                  ),
                  StoryItem(
                    label: "Micropolis",
                    imageUrl: 'assets/images/img_micropolis.png',
                  ),
                  StoryItem(
                    label: "Garden",
                    imageUrl: 'assets/images/img_garden.png',
                  ),
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
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 3,
                    ),
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
      // bottomNavigationBar: _buildBottomNavigation(),
      // floatingActionButton: _buildFloatingActionButton(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
      color: Theme.of(context).colorScheme.surface,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return true;
  }
}

// Static Top Bar Profiles Widget
class StaticTopBarProfiles extends StatelessWidget {
  const StaticTopBarProfiles({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 145,
      height: 32,
      child: Stack(
        children: [
          // First Avatar with 'A'
          Positioned(
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.surface,
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                radius: 14,
                backgroundColor: Color(0xFF5B7FE5),
                child: Text(
                  'A',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          // Second Avatar with profile image (overlapping)
          Positioned(
            left: 22,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.surface,
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                radius: 14,
                backgroundImage: AssetImage('assets/images/img_tsc.png'),
              ),
            ),
          ),
          // Add button (overlapping)
          Positioned(
            left: 44,
            child: Container(
              height: 32,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.surface,
                  width: 2,
                ),
                gradient: LinearGradient(
                  colors: [Color(0xFFFF375F), Color(0xFFFF375F)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // Handle add action
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 6,
                      top: 4,
                      bottom: 4,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Icon(Icons.add, color: Colors.white, size: 12)
                            .paddingAll(4)
                            .background(Color(0xFF787880).withAlpha(82))
                            .radiusXL(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
