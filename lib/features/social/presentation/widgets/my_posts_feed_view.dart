import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/spacing.dart';
import '../../domain/entities/post.dart';
import '../cubit/posts/posts_cubit.dart';
import '../cubit/posts/posts_state.dart';
import 'my_post_card.dart';

class MyPostsFeedView extends StatelessWidget {
  const MyPostsFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyPostsCubit, MyPostsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const _MyPostsInitial(),
          loading: () => const Center(child: CircularProgressIndicator()),
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
              // Load posts for mock user ID '1'
              context.read<MyPostsCubit>().loadMyPosts('1');
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
      return const Center(child: Text('No posts yet'));
    }

    return ListView.separated(
      padding: const EdgeInsets.all(AppSpacing.screenPadding),
      itemCount: posts.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final post = posts[index];
        return MyPostCard(
          post: post,
          onTap: () {
            // TODO: Navigate to post details or edit
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Tapped on ${post.status.name} post')),
            );
          },
        );
      },
    );
  }
}

class _MyPostsError extends StatelessWidget {
  final String message;

  const _MyPostsError({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
