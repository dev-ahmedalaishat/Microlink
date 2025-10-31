import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microlink/features/social/presentation/widgets/post_card_approved.dart';
import 'package:microlink/features/social/presentation/widgets/post_card_not_approved.dart';
import '../../domain/entities/post.dart';
import '../cubit/posts/posts_cubit.dart';
import '../cubit/posts/posts_state.dart';

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

    return RefreshIndicator.adaptive(
      onRefresh: () async {
        context.read<MyPostsCubit>().refreshMyPosts('1');
      },
      child: ListView.separated(
        itemCount: posts.length + 1,
        separatorBuilder: (context, index) => const Divider(height: 1),
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
