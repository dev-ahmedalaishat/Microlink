import 'dart:io';

import 'package:flutter/material.dart';
import 'package:microlink/core/presentation/wrapper/app_svg_picture.dart';
import 'package:microlink/core/presentation/spacing_widgets.dart';
import 'package:microlink/core/theme/spacing.dart';
import 'package:microlink/features/social/presentation/widgets/svg_icon_button.dart';
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
        SvgIconButton(
          assetPath: 'assets/icons/ic_more_vert.svg',
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
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post content
          Text(post.content, style: TextStyle(color: Colors.grey.shade600)),

          // Media if available
          if (post.mediaUrls.isNotEmpty) ...[
            SpacerV.s,
            _buildMediaSection(context),
          ],
        ],
      ).fullWidth().opacity(0.6),
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

        // Check if it's a network URL
        if (mediaUrl.startsWith('http://') || mediaUrl.startsWith('https://')) {
          return Image.network(
                mediaUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.image,
                    size: 50,
                    color: Colors.grey,
                  ).center();
                },
              )
              .sized(width: imageWidth, height: imageHeight)
              .backgroundWithBorderRadius(
                Colors.grey.shade200,
                BorderRadius.all(Radius.circular(AppSpacing.postImageRadius)),
              );
        }

        // Check if it's a file path
        try {
          final file = File(mediaUrl);
          if (file.existsSync()) {
            return Image.file(
                  file,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.grey,
                    ).center();
                  },
                )
                .sized(width: imageWidth, height: imageHeight)
                .backgroundWithBorderRadius(
                  Colors.grey.shade200,
                  BorderRadius.all(Radius.circular(AppSpacing.postImageRadius)),
                );
          }
        } catch (e) {
          // If file check fails, fall through to show icon
        }

        // Default: show image icon
        return Icon(Icons.image, size: 50, color: Colors.grey)
            .center()
            .sized(width: imageWidth, height: imageHeight)
            .backgroundWithBorderRadius(
              Colors.grey.shade200,
              BorderRadius.all(Radius.circular(AppSpacing.postImageRadius)),
            );
      },
    ).sized(height: imageHeight, width: double.infinity);
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
      child: AppSvgPicture.colored(
        assetPath: iconAssetPath,
        color: Colors.white,
      ).paddingAll(size * 0.2),
    );
  }
}
