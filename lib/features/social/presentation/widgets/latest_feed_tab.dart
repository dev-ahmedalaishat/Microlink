import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microlink/core/extensions/widget_extensions.dart';
import 'package:microlink/core/presentation/empty_state_widget.dart';
import 'package:microlink/core/presentation/shimmer/posts_shimmer.dart';
import 'package:microlink/core/presentation/snackbar/custom_snackbar.dart';
import 'package:share_plus/share_plus.dart';

import '../../domain/entities/post.dart';
import '../cubit/posts/posts_cubit.dart';
import '../cubit/posts/posts_state.dart';
import 'post_card_approved.dart';

class LatestFeedTab extends StatelessWidget {
  final VoidCallback onPostSubmitted;
  const LatestFeedTab({super.key, required this.onPostSubmitted});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: Text('Welcome to Social Feed')),
          loading: () => const PostsShimmer(),
          success: (posts) => _buildFeedContent(posts),
          error: (message) => _LatestFeedError(message: message),
        );
      },
    );
  }

  Widget _buildFeedContent(List<Post> posts) {
    if (posts.isEmpty) {
      return _LatestFeedEmpty();
    }
    return _LatestFeedSuccess(posts: posts, onPostSubmitted: onPostSubmitted);
  }
}

class _LatestFeedSuccess extends StatelessWidget {
  final List<Post> posts;
  final VoidCallback onPostSubmitted;

  const _LatestFeedSuccess({
    required this.posts,
    required this.onPostSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        context.read<PostsCubit>().refreshPosts();
      },
      child: ListView.separated(
        itemCount: posts.length + 1,
        separatorBuilder: (context, index) =>
            const Divider(height: 1).screenPadding(),
        itemBuilder: (context, index) {
          if (index == posts.length) {
            return const Text(
              "That's all",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ).center().paddingAll(32).paddingOnly(bottom: 70);
          }

          final post = posts[index];
          return PostCardApproved(
            post: post,
            onLikeTap: () {
              context.read<PostsCubit>().toggleLike(post.id);
            },
            onShareTap: () {
              Share.share('${post.content}\n\n— ${post.author.name}');
            },
          );
        },
      ),
    );
  }
}

class _LatestFeedError extends StatelessWidget {
  final String message;

  const _LatestFeedError({required this.message});

  @override
  Widget build(BuildContext context) {
    return EmptyStateWidgetExt.empty(
      customTitle: 'Error Loading Posts',
      customDescription: 'Failed to load posts. Please try again.',
      imagePath: context.themedImage('assets/images/ill_no_posts.png'),
      onActionButtonPressed: () {
        context.read<PostsCubit>().refreshPosts();
      },
    ).center();
  }
}

class _LatestFeedEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EmptyStateWidgetExt.empty(
      customTitle: 'No Posts Yet',
      customDescription: 'No posts available. Be the first to share!',
      imagePath: context.themedImage('assets/images/ill_no_posts.png'),
      onActionButtonPressed: () {
        context.read<PostsCubit>().refreshPosts();
      },
    ).center();
  }
}
