import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microlink/core/extensions/widget_extensions.dart';
import 'package:microlink/core/theme/spacing.dart';
import '../cubit/posts/posts_cubit.dart';
import '../widgets/create_post_widget.dart';

/// Full-screen page for creating a post
/// This can be used as an alternative to the bottom sheet modal
class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: CreatePostWidget(
        onPostCreated: () {
          Navigator.of(context).pop();
          // Optionally refresh posts if the cubit is available
          try {
            context.read<PostsCubit>().refreshPosts();
          } catch (e) {
            // Cubit not available in this context
          }
        },
      ).paddingOnly(top: AppSpacing.md),
    );
  }
}
