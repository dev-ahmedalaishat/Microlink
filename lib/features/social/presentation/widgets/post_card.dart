import 'package:flutter/material.dart';
import '../../../../core/theme/color_palette.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../domain/entities/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final VoidCallback? onLikeTap;
  final VoidCallback? onCommentTap;
  final VoidCallback? onShareTap;
  final VoidCallback? onMoreTap;

  const PostCard({
    super.key,
    required this.post,
    this.onLikeTap,
    this.onCommentTap,
    this.onShareTap,
    this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Post header
        _buildPostHeader(),
        
        // Post content
        _buildPostContent().spaceM(),
        
        // Media if available
        if (post.mediaUrls.isNotEmpty) 
          _buildMediaSection().spaceM(),
        
        // Post interactions
        _buildInteractionRow(),
      ],
    ).paddingL().cardM(radius: 12.0).marginOnly(bottom: 12.0);
  }

  Widget _buildPostHeader() {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.primary,
          child: Text(
            post.author.name[0].toUpperCase(),
            style: const TextStyle(
              color: AppColors.textOnPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.author.name,
                style: AppTextStyles.userName,
              ),
              Text(
                _formatTimeAgo(post.createdAt),
                style: AppTextStyles.timestamp,
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: onMoreTap,
        ),
      ],
    );
  }

  Widget _buildPostContent() {
    return Text(
      post.content,
      style: AppTextStyles.postContent,
    );
  }

  Widget _buildMediaSection() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        Icons.image,
        size: 50,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildInteractionRow() {
    return Row(
      children: [
        InkWell(
          onTap: onLikeTap,
          child: Row(
            children: [
              Icon(
                post.isLiked ? Icons.favorite : Icons.favorite_border,
                color: post.isLiked ? AppColors.liked : AppColors.iconInactive,
              ),
              const SizedBox(width: 4),
              Text('${post.likesCount}'),
            ],
          ),
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: onCommentTap,
          child: Row(
            children: [
              const Icon(Icons.chat_bubble_outline),
              const SizedBox(width: 4),
              Text('${post.commentsCount}'),
            ],
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: onShareTap,
          child: const Icon(Icons.send),
        ),
      ],
    );
  }

  String _formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
