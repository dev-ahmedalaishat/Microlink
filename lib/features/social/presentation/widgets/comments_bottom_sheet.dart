import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:microlink/core/extensions/widget_extensions.dart';
import 'package:microlink/core/presentation/empty_state_widget.dart';
import 'package:microlink/core/presentation/profile_avatar.dart';
import 'package:microlink/core/presentation/shimmer/comments_shimmer.dart';
import 'package:microlink/core/presentation/spacing_widgets.dart';
import 'package:microlink/core/theme/spacing.dart';
import 'package:microlink/core/theme/text_styles.dart';
import 'package:microlink/core/extensions/date_extensions.dart';
import '../../domain/entities/comment.dart' as domain;
import '../../domain/repositories/social_repository.dart';
import '../cubit/comments/comments_cubit.dart';
import '../cubit/comments/comments_state.dart';

class CommentsBottomSheet extends StatelessWidget {
  final String postId;

  const CommentsBottomSheet({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CommentsCubit>(
          create: (context) =>
              CommentsCubit(context.read<SocialRepository>())
                ..loadComments(postId),
        ),
      ],
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
  final ScrollController _scrollController = ScrollController();
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
    _scrollController.dispose();
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

  void _scrollToEnd() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Widget _buildCommentsContent(List<domain.Comment> comments) {
    if (comments.isEmpty) {
      return Column(
        children: [_CommentsEmpty().expanded(), _buildCommentInput(context)],
      ).expanded();
    }

    return Column(
      children: [
        ListView.separated(
          controller: _scrollController,
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.screenPadding,
            vertical: AppSpacing.md,
          ),
          itemCount: comments.length,
          separatorBuilder: (context, index) => SpacerV.l,
          itemBuilder: (context, index) {
            return _buildCommentItem(comments[index]);
          },
        ).expanded(),
        _buildCommentInput(context),
      ],
    ).expanded();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        bottom:
            MediaQuery.of(context).viewInsets.bottom +
            MediaQuery.of(context).padding.bottom,
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
                BlocBuilder<CommentsCubit, CommentsState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox.shrink(),
                      loading: () => const CommentsShimmer().expanded(),
                      success: (comments) => _buildCommentsContent(comments),
                      error: (message) => Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Error loading comments: $message'),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<CommentsCubit>().refreshComments(
                                    widget.postId,
                                  );
                                },
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        ),
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

  Widget _buildCommentItem(domain.Comment comment) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileAvatar(imageUrl: comment.author.avatarUrl ?? ''),
        SpacerH.s,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(comment.author.name, style: AppTextStyles.userName),
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
        if (comment.isPending)
          Lottie.asset(
            width: 20,
            height: 20,
            "assets/lottie/dot_loading.json",
            fit: BoxFit.contain,
            repeat: true,
          ).scale(5).paddingOnly(end: AppSpacing.lg),
        if (!comment.isPending)
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
    ).opacity(comment.isPending ? 0.6 : 1.0);
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
                  onPressed: () async {
                    final content = _commentController.text.trim();
                    if (content.isNotEmpty) {
                      // Hide keyboard
                      FocusScope.of(context).unfocus();
                      // Scroll to the end of the list
                      _scrollToEnd();

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
  @override
  Widget build(BuildContext context) {
    return EmptyStateWidgetExt.empty(
      customDescription: 'No comments yet. Be the first to comment!',
      imagePath: 'assets/images/ill_no_comments.png',
    ).center();
  }
}
