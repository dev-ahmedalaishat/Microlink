import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microlink/core/extensions/widget_extensions.dart';
import 'package:microlink/core/presentation/empty_state_widget.dart';
import 'package:microlink/core/presentation/shimmer/posts_shimmer.dart';
import 'package:microlink/core/theme/spacing.dart';
import 'package:microlink/features/social/presentation/widgets/post_card_approved.dart';
import 'package:microlink/features/social/presentation/widgets/post_card_not_approved.dart';
import '../../domain/entities/post.dart';
import '../cubit/posts/posts_cubit.dart';
import '../cubit/posts/posts_state.dart';

class MyPostsFeedTab extends StatelessWidget {
  const MyPostsFeedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyPostsCubit, MyPostsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const _MyPostsInitial(),
          loading: () => const PostsShimmer(),
          success: (posts) => _MyPostsSuccess(posts: posts),
          error: (message) => _MyPostsError(message: message),
        );
      },
    );
  }
}

class _MyPostsInitial extends StatelessWidget {
  const _MyPostsInitial();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('My Posts'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.read<MyPostsCubit>().loadMyPosts();
            },
            child: const Text('Load My Posts'),
          ),
        ],
      ),
    );
  }
}

class _MyPostsSuccess extends StatelessWidget {
  final List<Post> posts;

  const _MyPostsSuccess({required this.posts});

  @override
  Widget build(BuildContext context) {
    if (posts.isEmpty) {
      return _MyPostsEmpty();
    }

    return RefreshIndicator.adaptive(
      onRefresh: () async {
        context.read<MyPostsCubit>().refreshMyPosts();
      },
      child: ListView.separated(
        itemCount: posts.length + 1,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          if (index == posts.length) {
            return Text(
              "That's all",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ).center().paddingAll(AppSpacing.lg);
          }

          final post = posts[index];
          if (post.status == PostStatus.approved) {
            return PostCardApproved(post: post, isMyPost: true);
          } else {
            return PostCardNotApproved(post: post);
          }
        },
      ),
    );
  }
}

class _MyPostsError extends StatelessWidget {
  final String message;

  const _MyPostsError({required this.message});

  @override
  Widget build(BuildContext context) {
    return EmptyStateWidgetExt.empty(
      // customTitle: 'Error Loading Posts',
      customDescription: 'Failed to load posts. Please try again.',
      imagePath: 'assets/images/ill_no_posts.png',
      onActionButtonPressed: () {
        context.read<PostsCubit>().refreshPosts();
      },
    ).center();
  }
}

class _MyPostsEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EmptyStateWidgetExt.empty(
      customDescription: 'You have not created any posts yet.',
      imagePath: 'assets/images/ill_no_posts.png',
    ).center();
  }
}
