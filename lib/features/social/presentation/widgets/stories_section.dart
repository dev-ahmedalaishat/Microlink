import 'package:flutter/material.dart';
import 'package:microlink/core/presentation/story_avatar_v2.dart';

import '../../../../core/presentation/spacing_widgets.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/text_styles.dart';
import 'add_story_widget.dart';

class StoriesSection extends StatelessWidget {
  final List<StoryItem> stories;
  final VoidCallback? onAddStory;

  const StoriesSection({super.key, required this.stories, this.onAddStory});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenPadding,
        ),
        child: Row(
          children: [
            // Your Story (Add story button)
            AddStoryWidget(onTap: onAddStory),
            // Other stories
            ...stories.map(
              (story) => _StoryItemWidget(
                label: story.label,
                imageUrl: story.imageUrl,
                onTap: story.onTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StoryItemWidget extends StatelessWidget {
  final String label;
  final String? imageUrl;
  final VoidCallback? onTap;

  const _StoryItemWidget({required this.label, this.imageUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: AppSpacing.md),
        width: 90,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            StoryAvatarV2(imageUrl: imageUrl, onTap: onTap, size: 80),
            SpacerV.xs,
            Text(
              label,
              style: AppTextStyles.caption,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

/// Data model for a story item
class StoryItem {
  final String label;
  final String? imageUrl;
  final VoidCallback? onTap;

  const StoryItem({required this.label, this.imageUrl, this.onTap});
}
