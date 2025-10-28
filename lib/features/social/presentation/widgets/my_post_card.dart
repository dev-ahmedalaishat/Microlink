import 'package:flutter/material.dart';
import '../../../../core/theme/color_palette.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../domain/entities/post.dart';

class MyPostCard extends StatelessWidget {
  final Post post;
  final VoidCallback? onTap;

  const MyPostCard({
    super.key,
    required this.post,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStatusHeader(),
        _buildContent().spaceS(),
        if (post.status == PostStatus.approved)
          _buildInteractionStats().spaceS(),
      ],
    ).paddingL().onTap(onTap ?? () {}).cardM(radius: 12.0).marginOnly(bottom: 12.0);
  }

  Widget _buildStatusHeader() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: _getStatusColor().withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            post.status.name.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: _getStatusColor(),
            ),
          ),
        ),
        const Spacer(),
        Text(
          _formatTimeAgo(post.createdAt),
          style: AppTextStyles.timestamp,
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Text(
      post.content,
      style: AppTextStyles.postContent,
    );
  }

  Widget _buildInteractionStats() {
    return Row(
      children: [
        Icon(
          Icons.favorite,
          size: 16,
          color: AppColors.iconInactive,
        ),
        const SizedBox(width: 4),
        Text('${post.likesCount}'),
        const SizedBox(width: 12),
        Icon(
          Icons.chat_bubble_outline,
          size: 16,
          color: AppColors.iconInactive,
        ),
        const SizedBox(width: 4),
        Text('${post.commentsCount}'),
      ],
    );
  }

  Color _getStatusColor() {
    switch (post.status) {
      case PostStatus.approved:
        return Colors.green;
      case PostStatus.rejected:
        return Colors.red;
      case PostStatus.pending:
      default:
        return Colors.orange;
    }
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
