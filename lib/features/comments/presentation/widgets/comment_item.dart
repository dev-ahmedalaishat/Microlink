import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:microlink/core/extensions/date_extensions.dart';
import 'package:microlink/core/extensions/widget_extensions.dart';
import 'package:microlink/core/presentation/expandable_text.dart';
import 'package:microlink/core/presentation/profile_avatar.dart';
import 'package:microlink/core/presentation/spacing_widgets.dart';
import 'package:microlink/core/theme/spacing.dart';
import 'package:microlink/core/theme/text_styles.dart';
import 'package:microlink/features/social/presentation/widgets/svg_icon_button.dart';
import '../../domain/entities/comment.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;

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
              Text(
                comment.author.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SpacerV.xs,
              Text(
                comment.createdAt.timeAgo(),
                style: Theme.of(context).textTheme.labelSmall,
              ),
              SpacerV.s,
              ExpandableText(text: comment.content, maxLines: 3),
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
          SvgIconButton(
            assetPath: 'assets/icons/ic_more_vert.svg',
            tintColor: Theme.of(context).colorScheme.onSurface,
            onPressed: () {
              // Show comment options
            },
          ),
      ],
    ).opacity(comment.isPending ? 0.6 : 1.0);
  }
}
