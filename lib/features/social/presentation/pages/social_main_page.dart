import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/color_palette.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/text_styles.dart';
import '../../domain/entities/post.dart';
import '../cubit/posts/posts_cubit.dart';
import '../cubit/posts/posts_state.dart';

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
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Stories Section
          _buildStoriesSection(),
          
          // Tab Bar
          _buildTabBar(),
          
          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildLatestFeed(),
                _buildMyPostsFeed(),
              ],
            ),
          ),
        ],
      ),
      
      // Bottom Navigation with FAB
      bottomNavigationBar: _buildBottomNavigation(),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Widget _buildStoriesSection() {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
        children: [
          _buildStoryItem(
            label: 'Your story',
            hasAddIcon: true,
          ),
          _buildStoryItem(
            label: 'TSC',
            color: AppColors.primary,
          ),
          _buildStoryItem(
            label: 'Micropolis',
            color: Colors.orange,
          ),
          _buildStoryItem(
            label: 'Garden',
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildStoryItem({
    required String label,
    Color? color,
    bool hasAddIcon = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: AppSpacing.md),
      width: 70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color ?? Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.storyBorder,
                width: 2,
              ),
            ),
            child: hasAddIcon
                ? const Icon(Icons.add, color: Colors.white)
                : null,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.caption,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.textSecondary,
      labelStyle: AppTextStyles.tabActive,
      unselectedLabelStyle: AppTextStyles.tabInactive,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(color: AppColors.primary, width: 3),
      ),
      tabs: const [
        Tab(text: 'Latest'),
        Tab(text: 'My posts'),
      ],
    );
  }

  Widget _buildLatestFeed() {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: Text('Welcome to Social Feed')),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (posts) => RefreshIndicator(
            onRefresh: () async {
              context.read<PostsCubit>().refreshPosts();
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(AppSpacing.screenPadding),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: AppSpacing.md),
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.cardPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Post header
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: AppColors.primary,
                              child: Text(
                                post.author.name[0].toUpperCase(),
                                style: const TextStyle(
                                  color: AppColors.textOnPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    post.author.name,
                                    style: AppTextStyles.userName,
                                  ),
                                  Text(
                                    _formatTimeAgo(post.createdAt),
                                    style: AppTextStyles.timestamp,
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.more_vert),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: AppSpacing.md),
                        
                        // Post content
                        Text(
                          post.content,
                          style: AppTextStyles.postContent,
                        ),
                        
                        // Media if available
                        if (post.mediaUrls.isNotEmpty) ...[
                          const SizedBox(height: AppSpacing.md),
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.image,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                        
                        const SizedBox(height: AppSpacing.md),
                        
                        // Post interactions
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                // Handle like toggle - using mock user ID
                                context.read<PostsCubit>().toggleLike(post.id, '1');
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    post.isLiked ? Icons.favorite : Icons.favorite_border,
                                    color: post.isLiked ? AppColors.liked : AppColors.iconInactive,
                                  ),
                                  const SizedBox(width: 4),
                                  Text('${post.likesCount}'),
                                ],
                              ),
                            ),
                            const SizedBox(width: AppSpacing.lg),
                            Row(
                              children: [
                                const Icon(Icons.chat_bubble_outline),
                                const SizedBox(width: 4),
                                Text('${post.commentsCount}'),
                              ],
                            ),
                            const Spacer(),
                            const Icon(Icons.send),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          error: (message) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: $message'),
                ElevatedButton(
                  onPressed: () => context.read<PostsCubit>().refreshPosts(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMyPostsFeed() {
    return BlocBuilder<MyPostsCubit, MyPostsState>(
      builder: (context, state) {
        return state.when(
          initial: () => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('My Posts'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Load posts for mock user ID '1'
                    context.read<MyPostsCubit>().loadMyPosts('1');
                  },
                  child: const Text('Load My Posts'),
                ),
              ],
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (posts) => posts.isEmpty
              ? const Center(child: Text('No posts yet'))
              : ListView.builder(
                  padding: const EdgeInsets.all(AppSpacing.screenPadding),
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: AppSpacing.md),
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.cardPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: post.status == PostStatus.approved
                                        ? Colors.green.withOpacity(0.1)
                                        : Colors.orange.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    post.status.name.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: post.status == PostStatus.approved
                                          ? Colors.green
                                          : Colors.orange,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  _formatTimeAgo(post.createdAt),
                                  style: AppTextStyles.timestamp,
                                ),
                              ],
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            Text(
                              post.content,
                              style: AppTextStyles.postContent,
                            ),
                            if (post.status == PostStatus.approved) ...[
                              const SizedBox(height: AppSpacing.sm),
                              Row(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    size: 16,
                                    color: AppColors.iconInactive,
                                  ),
                                  const SizedBox(width: 4),
                                  Text('${post.likesCount}'),
                                  const SizedBox(width: AppSpacing.md),
                                  Icon(
                                    Icons.chat_bubble_outline,
                                    size: 16,
                                    color: AppColors.iconInactive,
                                  ),
                                  const SizedBox(width: 4),
                                  Text('${post.commentsCount}'),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                ),
          error: (message) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: $message'),
                ElevatedButton(
                  onPressed: () => context.read<MyPostsCubit>().loadMyPosts('1'),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        );
      },
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

  String _formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
