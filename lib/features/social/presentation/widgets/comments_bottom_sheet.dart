import 'package:flutter/material.dart';
import 'package:microlink/core/extensions/widget_extensions.dart';
import 'package:microlink/core/presentation/profile_avatar.dart';
import 'package:microlink/core/presentation/spacing_widgets.dart';
import 'package:microlink/core/presentation/story_avatar_v2.dart';
import 'package:microlink/core/theme/spacing.dart';
import 'package:microlink/core/theme/text_styles.dart';
import 'package:microlink/core/extensions/date_extensions.dart';

class CommentsBottomSheet extends StatefulWidget {
  final String postId;

  const CommentsBottomSheet({super.key, required this.postId});

  @override
  State<CommentsBottomSheet> createState() => _CommentsBottomSheetState();
}

class _CommentsBottomSheetState extends State<CommentsBottomSheet> {
  final TextEditingController _commentController = TextEditingController();
  bool _hasText = false;

  final List<Comment> _comments = [
    Comment(
      id: 1,
      authorName: 'Sara Mohamed',
      authorAvatar: null,
      content: 'Saw a white cat near building 5 earlier, might be Luna.',
      createdAt: DateTime.now(),
    ),
    Comment(
      id: 2,
      authorName: 'Khalid Hassan',
      authorAvatar: null,
      content:
          'I saw her there too! Looks like she\'s been hanging around building 5.',
      createdAt: DateTime.now(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _commentController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _commentController.removeListener(_onTextChanged);
    _commentController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final hasText = _commentController.text.trim().isNotEmpty;
    if (hasText != _hasText) {
      setState(() {
        _hasText = hasText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(AppSpacing.radiusXLarge),
              ),
            ),
            child: Column(
              children: [
                _buildHeader(context),
                ListView.separated(
                  controller: scrollController,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenPadding,
                    vertical: AppSpacing.md,
                  ),
                  itemCount: _comments.length,
                  separatorBuilder: (context, index) => SpacerV.l,
                  itemBuilder: (context, index) {
                    return _buildCommentItem(_comments[index]);
                  },
                ).expanded(),
                _buildCommentInput(context),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Text(
          'Comments',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ).expanded(),
        InkWell(
          onTap: () => Navigator.of(context).pop(),
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          child: Icon(
            Icons.close,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(153),
          ).paddingAll(AppSpacing.md),
        ),
      ],
    ).paddingSymmetric(
      horizontal: AppSpacing.screenPadding,
      vertical: AppSpacing.md,
    );
  }

  Widget _buildCommentItem(Comment comment) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileAvatar(imageUrl: ''),
        SpacerH.s,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(comment.authorName, style: AppTextStyles.userName),
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
    );
  }

  Widget _buildCommentInput(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ProfileAvatar(imageUrl: '').paddingOnly(bottom: AppSpacing.md),
        SpacerH.s,
        Container(
          margin: EdgeInsets.symmetric(vertical: AppSpacing.md),
          padding: EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
              color: Theme.of(context).colorScheme.onSurface.withAlpha(51),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _commentController,
                decoration: const InputDecoration(
                  hintText: 'Add a helpful comment…',
                  border: InputBorder.none,
                  fillColor: Colors.transparent,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                ),
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 3,
                minLines: 1,
              ).expanded(),
              if (_hasText) ...[
                TextButton(
                  onPressed: () {
                    // Handle send comment
                    _commentController.clear();
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(AppSpacing.xs),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'Send',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ).expanded(),
      ],
    ).fullWidth().screenPadding();
  }
}

class Comment {
  final int id;
  final String authorName;
  final String? authorAvatar;
  final String content;
  final DateTime createdAt;

  Comment({
    required this.id,
    required this.authorName,
    this.authorAvatar,
    required this.content,
    required this.createdAt,
  });
}
