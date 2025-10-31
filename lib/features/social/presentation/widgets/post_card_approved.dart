import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:microlink/core/constants/app_constants.dart';
import 'package:microlink/core/extensions/date_extensions.dart';
import 'package:microlink/core/presentation/profile_avatar.dart';
import 'package:microlink/core/presentation/spacing_widgets.dart';
import 'package:microlink/core/presentation/story_avatar_v2.dart';
import 'package:microlink/core/theme/spacing.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../domain/entities/post.dart';
import 'comments_bottom_sheet.dart';

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
        if (widget.post.status == PostStatus.approved)
          _buildApprovedPostContent()
        else
          _buildNotApprovedPostContent(),
      ],
    );
  }

  Widget _buildPostHeader() {
    return Row(
      children: [
        if (widget.isMyPost) ProfileAvatar() else StoryAvatarV2(),
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

  Widget _buildNotApprovedPostContent() {
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
            Text(
              widget.post.content,
              style: TextStyle(color: Colors.grey.shade600),
            ),

            // Media if available
            if (widget.post.mediaUrls.isNotEmpty) ...[
              SpacerV.s,
              _buildMediaSection(padding: EdgeInsetsGeometry.zero),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildApprovedPostContent() {
    return Column(
      children: [
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

  Widget _buildMediaSection({
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.screenPadding,
    ),
  }) {
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
            _buildCountBadge(context, widget.post.likesCount),
          ],
        ),
        SpacerH.xs,
        Row(
          children: [
            ScaleTransition(
              scale: _commentScaleAnimation,
              child: _buildIconButton(
                'assets/icons/ic_comment.svg',
                () => _handleCommentTap(context),
              ),
            ),
            _buildCountBadge(context, widget.post.commentsCount),
          ],
        ),
        SpacerH.xs,
        ScaleTransition(
          scale: _shareScaleAnimation,
          child: _buildIconButton('assets/icons/ic_share.svg', _handleShareTap),
        ),
      ],
    );
  }

  Widget _buildIconButton(String iconPath, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSpacing.radiusCircular),
      child: SvgPicture.asset(
        iconPath,
        width: AppConstants.iconM,
        height: AppConstants.iconM,
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
