import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microlink/core/extensions/widget_extensions.dart';
import 'package:microlink/core/presentation/empty_state_widget.dart';
import 'package:microlink/core/presentation/profile_avatar.dart';
import 'package:microlink/core/presentation/shimmer/comments_shimmer.dart';
import 'package:microlink/core/presentation/spacing_widgets.dart';
import 'package:microlink/core/theme/spacing.dart';
import 'package:microlink/features/social/domain/repositories/social_repository.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/comment.dart';
import '../cubit/comments/comments_cubit.dart';
import '../cubit/comments/comments_state.dart';
import 'comment_item.dart';

class CommentsBottomSheet extends StatelessWidget {
  final String postId;

  const CommentsBottomSheet({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CommentsCubit>(
      create: (context) => sl<CommentsCubit>()..loadComments(postId),
      child: CommentsBottomSheetContent(postId: postId),
    );
  }
}

class CommentsBottomSheetContent extends StatefulWidget {
  final String postId;

  const CommentsBottomSheetContent({super.key, required this.postId});

  @override
  State<CommentsBottomSheetContent> createState() =>
      _CommentsBottomSheetContentState();
}

class _CommentsBottomSheetContentState
    extends State<CommentsBottomSheetContent> {
  final TextEditingController _commentController = TextEditingController();
  bool _hasText = false;

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
        bottom:
            MediaQuery.of(context).viewInsets.bottom +
            MediaQuery.of(context).padding.bottom,
      ),
      child: DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
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
                SizedBox(height: MediaQuery.viewPaddingOf(context).top),
                _buildHeader(context),
                BlocBuilder<CommentsCubit, CommentsState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox.shrink(),
                      loading: () => const CommentsShimmer().expanded(),
                      success: (comments) =>
                          _buildCommentsContent(comments, scrollController),
                      error: (message) => _CommentsError(
                        onRetryButtonPressed: () {
                          context.read<CommentsCubit>().refreshComments(
                            widget.postId,
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCommentsContent(
    List<Comment> comments,
    ScrollController scrollController,
  ) {
    final content = comments.isEmpty
        ? const _CommentsEmpty()
        : ListView.separated(
            controller: scrollController,
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.screenPadding,
              vertical: AppSpacing.md,
            ),
            itemCount: comments.length,
            separatorBuilder: (_, __) => SpacerV.l,
            itemBuilder: (_, index) => CommentItem(comment: comments[index]),
          );

    return Column(
      children: [content.expanded(), _buildCommentInput(context)],
    ).expanded();
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
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
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

  Widget _buildCommentInput(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ProfileAvatar(
          imageUrl: '',
          userId: loggedUserId,
        ).paddingOnly(bottom: AppSpacing.md),
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
                  onPressed: () async {
                    final content = _commentController.text.trim();
                    if (content.isNotEmpty) {
                      // Hide keyboard
                      FocusScope.of(context).unfocus();

                      // Get current user ID (in a real app, this would come from auth)
                      final commentsCubit = context.read<CommentsCubit>();

                      _commentController.clear();

                      commentsCubit.tryAddComment(
                        postId: widget.postId,
                        content: content,
                      );
                    }
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

class _CommentsEmpty extends StatelessWidget {
  const _CommentsEmpty();

  @override
  Widget build(BuildContext context) {
    return EmptyStateWidgetExt.empty(
      customDescription: 'No comments yet. Be the first to comment!',
      imagePath: 'assets/images/ill_no_comments.png',
    ).center();
  }
}

class _CommentsError extends StatelessWidget {
  final VoidCallback? onRetryButtonPressed;

  const _CommentsError({this.onRetryButtonPressed});

  @override
  Widget build(BuildContext context) {
    return EmptyStateWidgetExt.empty(
      customDescription: 'Error loading comments. Please try again later.',
      imagePath: 'assets/images/ill_no_comments.png',
      onActionButtonPressed: onRetryButtonPressed,
    ).center();
  }
}
