import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microlink/core/extensions/widget_extensions.dart';
import 'package:share_plus/share_plus.dart';

import '../../domain/entities/post.dart';
import '../cubit/posts/posts_cubit.dart';
import '../cubit/posts/posts_state.dart';
import 'post_card_approved.dart';

class LatestFeedView extends StatelessWidget {
  const LatestFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: Text('Welcome to Social Feed')),
          loading: () => const Center(child: CircularProgressIndicator()),
          success: (posts) => _LatestFeedSuccess(posts: posts),
          error: (message) => _LatestFeedError(message: message),
        );
      },
    );
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
        itemCount: posts.length + 1,
        separatorBuilder: (context, index) =>
            const Divider(height: 1).screenPadding(),
        itemBuilder: (context, index) {
          if (index == posts.length) {
            return const Padding(
              padding: EdgeInsets.all(32.0),
              child: Center(
                child: Text(
                  "That's all",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
            );
          }

          final post = posts[index];
          return PostCardApproved(
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
