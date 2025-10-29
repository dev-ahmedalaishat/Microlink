import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:microlink/core/constants/app_constants.dart';
import 'package:microlink/core/extensions/date_extensions.dart';
import 'package:microlink/core/presentation/spacing_widgets.dart';
import 'package:microlink/core/presentation/story_avatar_v2.dart';
import 'package:microlink/core/theme/spacing.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../domain/entities/post.dart';

class PostCard extends StatefulWidget {
  final Post post;
  final VoidCallback? onLikeTap;
  final VoidCallback? onCommentTap;
  final VoidCallback? onShareTap;

  const PostCard({
    super.key,
    required this.post,
    this.onLikeTap,
    this.onCommentTap,
    this.onShareTap,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _likeAnimationController;
  late Animation<double> _likeScaleAnimation;

  @override
  void initState() {
    super.initState();
    _likeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _likeScaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _likeAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _likeAnimationController.dispose();
    super.dispose();
  }

  void _handleLikeTap() {
    _likeAnimationController.forward().then((_) {
      _likeAnimationController.reverse();
    });
    widget.onLikeTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post header
        SpacerV.l,
        _buildPostHeader().screenPadding(),
        SpacerV.l,
        // Post content
        Text(widget.post.content).screenPadding(),
        SpacerV.l,

        // Media if available
        if (widget.post.mediaUrls.isNotEmpty) ...[
          _buildMediaSection(),
          SpacerV.l,
        ],

        // Post interactions
        _buildInteractionRow(context).screenPadding(),
        SpacerV.l,
      ],
    );
  }

  Widget _buildPostHeader() {
    return Row(
      children: [
        StoryAvatarV2(),
        SpacerH.s,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.post.author.name, style: AppTextStyles.userName),
            Text(
              widget.post.createdAt.timeAgo(),
              style: AppTextStyles.timestamp,
            ),
          ],
        ).expanded(),
      ],
    );
  }

  Widget _buildMediaSection() {
    final imageHeight = MediaQuery.of(context).size.width * 1.05;

    if (widget.post.mediaUrls.length == 1) {
      return Container(
        width: double.infinity,
        height: imageHeight,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.image, size: 50, color: Colors.grey),
      ).screenPadding();
    }
    final imageWidth = imageHeight * 0.7;

    return SizedBox(
      height: imageHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.post.mediaUrls.length,
        separatorBuilder: (context, index) => SpacerH.xs,
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
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

  Widget _buildInteractionRow(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            ScaleTransition(
              scale: _likeScaleAnimation,
              child: _buildIconButton(
                widget.post.isLiked
                    ? 'assets/icons/ic_like.svg'
                    : 'assets/icons/ic_unlike.svg',
                _handleLikeTap,
              ),
            ),
            SpacerH.xs,
            _buildCountBadge(context, widget.post.likesCount),
          ],
        ),
        SpacerH.m,
        Row(
          children: [
            _buildIconButton(
              'assets/icons/ic_comment.svg',
              widget.onCommentTap,
            ),
            SpacerH.xs,
            _buildCountBadge(context, widget.post.commentsCount),
          ],
        ),
        SpacerH.m,
        _buildIconButton('assets/icons/ic_share.svg', widget.onShareTap),
      ],
    );
  }

  Widget _buildIconButton(String iconPath, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
      child: SvgPicture.asset(
        iconPath,
        width: AppConstants.iconM,
        height: AppConstants.iconM,
        matchTextDirection: false,
      ),
    );
  }

  Widget _buildCountBadge(BuildContext context, int count) {
    return Text(
          '$count',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        )
        .sized(height: AppConstants.iconM)
        .paddingSymmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xs)
        .background(Theme.of(context).colorScheme.onSurface.withAlpha(13))
        .radiusXL();
  }
}
