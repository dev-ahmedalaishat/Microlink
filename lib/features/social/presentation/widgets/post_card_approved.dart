import 'dart:math';

import 'package:flutter/material.dart';
import 'package:microlink/core/constants/app_constants.dart';
import 'package:microlink/core/extensions/date_extensions.dart';
import 'package:microlink/core/presentation/wrapper/app_svg_picture.dart';
import 'package:microlink/core/presentation/profile_avatar.dart';
import 'package:microlink/core/presentation/spacing_widgets.dart';
import 'package:microlink/core/presentation/story_avatar.dart';
import 'package:microlink/core/theme/spacing.dart';
import 'package:microlink/features/social/domain/repositories/social_repository.dart';
import 'package:microlink/features/comments/presentation/pages/comments_bottom_sheet.dart';
import 'package:microlink/features/social/presentation/widgets/media_item_widget.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../../../core/presentation/expandable_text.dart';
import '../../domain/entities/post.dart';

class PostCardApproved extends StatefulWidget {
  final Post post;
  final bool isMyPost;
  final VoidCallback? onLikeTap;
  final VoidCallback? onCommentTap;
  final VoidCallback? onShareTap;

  const PostCardApproved({
    super.key,
    required this.post,
    this.isMyPost = false,
    this.onLikeTap,
    this.onCommentTap,
    this.onShareTap,
  });

  @override
  State<PostCardApproved> createState() => _PostCardApprovedState();
}

class _PostCardApprovedState extends State<PostCardApproved>
    with TickerProviderStateMixin {
  late AnimationController _likeAnimationController;
  late AnimationController _commentAnimationController;
  late AnimationController _shareAnimationController;
  late Animation<double> _likeScaleAnimation;
  late Animation<double> _commentScaleAnimation;
  late Animation<double> _shareScaleAnimation;

  @override
  void initState() {
    super.initState();
    _likeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _commentAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _shareAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _likeScaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _likeAnimationController,
        curve: Curves.easeInOut,
      ),
    );
    _commentScaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _commentAnimationController,
        curve: Curves.easeInOut,
      ),
    );
    _shareScaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _shareAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _likeAnimationController.dispose();
    _commentAnimationController.dispose();
    _shareAnimationController.dispose();
    super.dispose();
  }

  void _handleLikeTap() {
    _likeAnimationController.forward().then((_) {
      _likeAnimationController.reverse();
    });
    widget.onLikeTap?.call();
  }

  void _handleCommentTap(BuildContext context) {
    _commentAnimationController.forward().then((_) {
      _commentAnimationController.reverse();
    });
    _showCommentsBottomSheet(context);
  }

  void _handleShareTap() {
    _shareAnimationController.forward().then((_) {
      _shareAnimationController.reverse();
    });
    widget.onShareTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post header
        SpacerV.l,
        _buildPostHeader().screenPadding(),
        _buildApprovedPostContent(),
      ],
    ).background(Colors.transparent).onTap(() {
      _showCommentsBottomSheet(context);
    });
  }

  Widget _buildPostHeader() {
    return Row(
      children: [
        if (widget.isMyPost)
          ProfileAvatar(userId: loggedUserId)
        else
          StoryAvatar(),
        SpacerH.s,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.post.author.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              widget.post.createdAt.timeAgo(),
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ).expanded(),
      ],
    );
  }

  Widget _buildApprovedPostContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpacerV.l,
        // Post content
        ExpandableText(text: widget.post.content).screenPadding(),
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

  Widget _buildMediaSection({
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.screenPadding,
    ),
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageHeight = min(screenWidth, 400) * 1.05;

    if (widget.post.mediaUrls.length == 1) {
      final mediaUrl = widget.post.mediaUrls.first;
      return MediaItemWidget(
        mediaUrl: mediaUrl,
        width: screenWidth > 500 ? 400.0 : double.infinity,
        height: imageHeight,
      ).screenPadding();
    }
    final imageWidth = imageHeight * 0.7;

    return SizedBox(
      height: imageHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.post.mediaUrls.length,
        separatorBuilder: (context, index) => SpacerH.xs,
        padding: padding,
        itemBuilder: (context, index) {
          final mediaUrl = widget.post.mediaUrls[index];
          return MediaItemWidget(
            mediaUrl: mediaUrl,
            width: imageWidth,
            height: imageHeight,
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
              child: _buildInteractionButton(
                widget.post.isLiked
                    ? 'assets/icons/ic_like.svg'
                    : 'assets/icons/ic_unlike.svg',
                widget.post.isLiked
                    ? null
                    : Theme.of(context).colorScheme.onSurface,
                _handleLikeTap,
              ),
            ),
            _buildCountBadge(context, widget.post.likesCount),
          ],
        ),
        SpacerH.xs,
        Row(
          children: [
            ScaleTransition(
              scale: _commentScaleAnimation,
              child: _buildInteractionButton(
                'assets/icons/ic_comment.svg',
                Theme.of(context).colorScheme.onSurface,
                () => _handleCommentTap(context),
              ),
            ),
            _buildCountBadge(context, widget.post.commentsCount),
          ],
        ),
        SpacerH.xs,
        ScaleTransition(
          scale: _shareScaleAnimation,
          child: _buildInteractionButton(
            'assets/icons/ic_share.svg',
            Theme.of(context).colorScheme.onSurface,
            _handleShareTap,
          ),
        ),
      ],
    );
  }

  Widget _buildInteractionButton(
    String iconPath,
    Color? tint,
    VoidCallback? onTap,
  ) {
    // return SvgIconButton(
    //   padding: EdgeInsets.zero,
    //   size: AppConstants.iconM,
    //   assetPath: iconPath,
    //   onPressed: onTap,
    // );

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusCircular),
      child: AppSvgPicture(
        assetPath: iconPath,
        width: AppConstants.iconM,
        height: AppConstants.iconM,
        colorFilter: tint != null
            ? ColorFilter.mode(tint, BlendMode.srcIn)
            : null,
        matchTextDirection: false,
      ).paddingAll(AppSpacing.sm),
    );
  }

  Widget _buildCountBadge(BuildContext context, int count) {
    return Transform.translate(
      offset: const Offset(-4, 0),
      child:
          Text(
                '$count',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              )
              .sized(height: AppConstants.iconM)
              .paddingSymmetric(
                horizontal: AppSpacing.sm,
                vertical: AppSpacing.xs,
              )
              .background(Theme.of(context).colorScheme.onSurface.withAlpha(13))
              .radiusXL(),
    );
  }

  void _showCommentsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      builder: (context) => CommentsBottomSheet(postId: widget.post.id),
    );
  }
}
