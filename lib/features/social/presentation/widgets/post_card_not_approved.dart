import 'package:flutter/material.dart';
import 'package:microlink/core/presentation/wrapper/app_svg_picture.dart';
import 'package:microlink/core/presentation/spacing_widgets.dart';
import 'package:microlink/core/theme/spacing.dart';
import 'package:microlink/features/social/presentation/widgets/media_item_widget.dart';
import 'package:microlink/features/social/presentation/widgets/svg_icon_button.dart';
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
        _buildPostHeader(context).screenPadding(),
        _buildNotApprovedPostContent(context),
      ],
    );
  }

  Widget _buildPostHeader(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        _buildIcon(
          context,
          iconAssetPath: post.status == PostStatus.rejected
              ? "assets/icons/ic_close.svg"
              : "assets/icons/ic_time.svg",
          color: post.status == PostStatus.rejected
              ? (isDark ? const Color(0xFFFF5E7A) : const Color(0xFFFF375F))
              : (isDark ? const Color(0xFF409CFF) : const Color(0xFF007AFF)),
        ),
        SpacerH.s,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.status == PostStatus.pending
                  ? "Under review..."
                  : "Post Not Approved",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              post.status == PostStatus.pending
                  ? "Usually approved within minutes"
                  : "Unfortunately, your post didn't pass the review",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ).expanded(),
        SvgIconButton(
          assetPath: 'assets/icons/ic_more_vert.svg',
          tintColor: Theme.of(context).colorScheme.onSurface,
          onPressed: () {},
        ),
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
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(
          color:
              Theme.of(context).dividerTheme.color ??
              Theme.of(context).colorScheme.outlineVariant,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post content
          Text(
            post.content,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),

          // Media if available
          if (post.mediaUrls.isNotEmpty) ...[
            SpacerV.s,
            _buildMediaSection(context),
          ],
        ],
      ).fullWidth().opacity(0.5),
    ).fullWidth();
  }

  Widget _buildMediaSection(BuildContext context) {
    final imageHeight = MediaQuery.of(context).size.width * 0.3;
    final imageWidth = imageHeight * 0.9;

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: post.mediaUrls.length,
      separatorBuilder: (context, index) => SpacerH.xs,
      padding: EdgeInsetsGeometry.zero,
      itemBuilder: (context, index) {
        final mediaUrl = post.mediaUrls[index];
        return MediaItemWidget(
          mediaUrl: mediaUrl,
          width: imageWidth,
          height: imageHeight,
        );
      },
    ).sized(height: imageHeight, width: double.infinity);
  }

  /// Returns an SVG icon widget with white icon on colored background with stroke
  Widget _buildIcon(
    BuildContext context, {
    required String iconAssetPath,
    required Color color,
    double size = 48.0,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Theme.of(context).colorScheme.surface.withAlpha(150),
          width: 3.0,
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
      ),
      child: AppSvgPicture.colored(
        assetPath: iconAssetPath,
        color: Colors.white,
      ).paddingAll(size * 0.2),
    );
  }
}
