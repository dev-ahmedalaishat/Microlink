import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microlink/core/extensions/widget_extensions.dart';

import '../../../../core/theme/spacing.dart';
import '../../domain/entities/post.dart';
import '../cubit/posts/posts_cubit.dart';
import '../cubit/posts/posts_state.dart';
import 'post_card.dart';

class LatestFeedView extends StatelessWidget {
  const LatestFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(height: 1),
        BlocBuilder<PostsCubit, PostsState>(
          builder: (context, state) {
            return state.when(
              initial: () =>
                  const Center(child: Text('Welcome to Social Feed')),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (posts) => _LatestFeedSuccess(posts: posts),
              error: (message) => _LatestFeedError(message: message),
            );
          },
        ).expanded(),
      ],
    ).expanded();
  }
}

class _LatestFeedSuccess extends StatelessWidget {
  final List<Post> posts;

  const _LatestFeedSuccess({required this.posts});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        context.read<PostsCubit>().refreshPosts();
      },

      child: ListView.separated(
        itemCount: posts.length,
        separatorBuilder: (context, index) =>
            const Divider(height: 1).screenPadding(),
        itemBuilder: (context, index) {
          final post = posts[index];
          return PostCard(
            post: post,
            onLikeTap: () {
              context.read<PostsCubit>().toggleLike(post.id, '1');
            },
            onCommentTap: () {
              // TODO: Navigate to comments
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Comments coming soon!')),
              );
            },
            onShareTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Share coming soon!')),
              );
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
    return Center(
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
    );
  }
}
