import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:microlink/core/extensions/date_extensions.dart';
import 'package:microlink/core/presentation/profile_avatar.dart';
import 'package:microlink/core/presentation/spacing_widgets.dart';
import 'package:microlink/core/theme/spacing.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../domain/entities/post.dart';

class PostCardNotApproved extends StatelessWidget {
  final Post post;
  final VoidCallback? onLikeTap;
  final VoidCallback? onCommentTap;
  final VoidCallback? onShareTap;

  const PostCardNotApproved({
    super.key,
    required this.post,
    this.onLikeTap,
    this.onCommentTap,
    this.onShareTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post header
        SpacerV.l,
        _buildPostHeader().screenPadding(),
        _buildNotApprovedPostContent(context),
      ],
    );
  }

  Widget _buildPostHeader() {
    return Row(
      children: [
        _buildIcon(
          iconAssetPath: post.status == PostStatus.rejected
              ? "assets/icons/ic_close.svg"
              : "assets/icons/ic_time.svg",
          color: post.status == PostStatus.rejected ? Colors.red : Colors.blue,
        ),
        SpacerH.s,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.status == PostStatus.pending
                  ? "Under review..."
                  : "Post Not Approved",
              style: AppTextStyles.userName,
            ),
            Text(
              post.status == PostStatus.pending
                  ? "Usually approved within minutes"
                  : "Unfortunately, your post didn't pass the review",
              style: AppTextStyles.timestamp,
            ),
          ],
        ).expanded(),
      ],
    );
  }

  Widget _buildNotApprovedPostContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.screenPadding,
        vertical: AppSpacing.md,
      ),
      padding: EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
      ),
      child: Opacity(
        opacity: 0.6,
        child: Column(
          children: [
            // Post content
            Text(post.content, style: TextStyle(color: Colors.grey.shade600)),

            // Media if available
            if (post.mediaUrls.isNotEmpty) ...[
              SpacerV.s,
              _buildMediaSection(context, padding: EdgeInsetsGeometry.zero),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMediaSection(
    BuildContext context, {
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.screenPadding,
    ),
  }) {
    final imageHeight = MediaQuery.of(context).size.width * 0.3;
    final imageWidth = imageHeight * 0.9;

    return SizedBox(
      height: imageHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: post.mediaUrls.length,
        separatorBuilder: (context, index) => SpacerH.xs,
        padding: padding,
        itemBuilder: (context, index) {
          return Container(
            width: imageWidth,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(AppSpacing.postImageRadius),
            ),
            child: const Icon(Icons.image, size: 50, color: Colors.grey),
          );
        },
      ),
    );
  }

  /// Returns an SVG icon widget with white icon on colored background with stroke
  Widget _buildIcon({
    required String iconAssetPath,
    required Color color,
    double size = 48.0,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.white.withAlpha(150), width: 3.0),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
      ),
      child: Padding(
        padding: EdgeInsets.all(size * 0.2),
        child: SvgPicture.asset(
          iconAssetPath,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}
