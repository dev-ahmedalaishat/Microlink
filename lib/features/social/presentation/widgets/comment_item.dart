import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:microlink/core/extensions/date_extensions.dart';
import 'package:microlink/core/extensions/widget_extensions.dart';
import 'package:microlink/core/presentation/profile_avatar.dart';
import 'package:microlink/core/presentation/spacing_widgets.dart';
import 'package:microlink/core/theme/spacing.dart';
import 'package:microlink/core/theme/text_styles.dart';
import '../../domain/entities/comment.dart' as domain;

class CommentItem extends StatelessWidget {
  final domain.Comment comment;

  const CommentItem({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileAvatar(
          imageUrl: comment.author.avatarUrl ?? '',
          userId: comment.author.id,
        ),
        SpacerH.s,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(comment.author.name, style: AppTextStyles.userName),
              SpacerV.xs,
              Text(comment.createdAt.timeAgo(), style: AppTextStyles.timestamp),
              SpacerV.s,
              Text(
                comment.content,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        SpacerH.s,
        if (comment.isPending)
          Lottie.asset(
            width: 20,
            height: 20,
            "assets/lottie/dot_loading.json",
            fit: BoxFit.contain,
            repeat: true,
          ).scale(5).paddingOnly(end: AppSpacing.lg),
        if (!comment.isPending)
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).colorScheme.onSurface.withAlpha(153),
              size: 20,
            ),
            onPressed: () {
              // Show comment options
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
      ],
    ).opacity(comment.isPending ? 0.6 : 1.0);
  }
}
