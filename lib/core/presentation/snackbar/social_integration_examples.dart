import 'package:flutter/material.dart';
import '../../../../core/presentation/snackbar/custom_snackbar.dart';

/// Example of integrating custom snackbars into your social features
/// This file shows practical examples based on your Microlink app

class SocialSnackBarIntegration {
  /// Example 1: Post submission flow (like in your screenshots)
  static Future<void> submitPost({
    required BuildContext context,
    required String content,
    required Future<void> Function() submitAction,
  }) async {
    // Show loading snackbar
    context.showLoadingSnackBar('Posting...');

    try {
      // Execute the submit action
      await submitAction();

      // Hide loading
      context.hideSnackBar();

      // Show success with action button (like your screenshot)
      CustomSnackBar(
        message: 'Post submitted – pending approval',
        type: SnackBarType.success,
        duration: const Duration(seconds: 4),
        onTap: () {
          // Navigate to pending posts or my posts tab
          debugPrint('Navigate to pending posts');
        },
      ).show(context);
    } catch (e) {
      // Hide loading
      context.hideSnackBar();

      // Show error with retry option
      CustomSnackBar(
        message: 'Failed to submit post. Please try again.',
        type: SnackBarType.error,
        duration: const Duration(seconds: 5),
        onTap: () {
          // Retry submission
          submitPost(
            context: context,
            content: content,
            submitAction: submitAction,
          );
        },
      ).show(context);
    }
  }

  /// Example 2: Like/Unlike action feedback
  static void toggleLikePost({
    required BuildContext context,
    required bool isLiked,
  }) {
    if (isLiked) {
      context.showSuccessSnackBar(
        'Post liked!',
        duration: const Duration(seconds: 2),
      );
    } else {
      context.showInfoSnackBar(
        'Post unliked',
        duration: const Duration(seconds: 2),
      );
    }
  }

  /// Example 3: Delete post confirmation
  static Future<void> deletePost({
    required BuildContext context,
    required Future<void> Function() deleteAction,
  }) async {
    context.showLoadingSnackBar('Deleting post...');

    try {
      await deleteAction();
      context.hideSnackBar();
      context.showSuccessSnackBar('Post deleted successfully');
    } catch (e) {
      context.hideSnackBar();
      context.showErrorSnackBar('Failed to delete post');
    }
  }

  /// Example 4: Comment submission
  static Future<void> submitComment({
    required BuildContext context,
    required String comment,
    required Future<void> Function() submitAction,
  }) async {
    context.showLoadingSnackBar('Posting comment...');

    try {
      await submitAction();
      context.hideSnackBar();
      context.showSuccessSnackBar('Comment posted!');
    } catch (e) {
      context.hideSnackBar();
      CustomSnackBar(
        message: 'Failed to post comment',
        type: SnackBarType.error,
        onTap: () {
          submitComment(
            context: context,
            comment: comment,
            submitAction: submitAction,
          );
        },
      ).show(context);
    }
  }

  /// Example 5: Image upload feedback
  static void showImageUploadProgress({
    required BuildContext context,
    required int currentImage,
    required int totalImages,
  }) {
    context.showLoadingSnackBar(
      'Uploading images ($currentImage/$totalImages)...',
    );
  }

  /// Example 6: Network error
  static void showNetworkError(BuildContext context, {VoidCallback? onRetry}) {
    CustomSnackBar(
      message: 'No internet connection',
      type: SnackBarType.error,
      duration: const Duration(seconds: 5),
      onTap: onRetry,
      customIcon: Icons.wifi_off,
    ).show(context);
  }

  /// Example 7: Post approved notification
  static void showPostApproved({
    required BuildContext context,
    VoidCallback? onViewPost,
  }) {
    CustomSnackBar(
      message: 'Your post has been approved!',
      type: SnackBarType.success,
      duration: const Duration(seconds: 4),
      onTap: onViewPost,
      customIcon: Icons.check_circle,
    ).show(context);
  }

  /// Example 8: Post rejected notification
  static void showPostRejected({
    required BuildContext context,
    String? reason,
  }) {
    CustomSnackBar(
      message: reason ?? 'Your post was not approved',
      type: SnackBarType.warning,
      duration: const Duration(seconds: 5),
      customIcon: Icons.block,
    ).show(context);
  }

  /// Example 9: Story upload
  static Future<void> uploadStory({
    required BuildContext context,
    required Future<void> Function() uploadAction,
  }) async {
    context.showLoadingSnackBar('Uploading story...');

    try {
      await uploadAction();
      context.hideSnackBar();
      context.showSuccessSnackBar('Story uploaded successfully!');
    } catch (e) {
      context.hideSnackBar();
      CustomSnackBar(
        message: 'Failed to upload story',
        type: SnackBarType.error,
        onTap: () {
          uploadStory(context: context, uploadAction: uploadAction);
        },
      ).show(context);
    }
  }

  /// Example 10: Save post
  static void savePost(BuildContext context, {required bool isSaved}) {
    if (isSaved) {
      context.showSuccessSnackBar(
        'Post saved',
        duration: const Duration(seconds: 2),
      );
    } else {
      context.showInfoSnackBar(
        'Post removed from saved',
        duration: const Duration(seconds: 2),
      );
    }
  }

  /// Example 11: Share post
  static void sharePost(BuildContext context) {
    context.showSuccessSnackBar(
      'Link copied to clipboard',
      duration: const Duration(seconds: 2),
    );
  }

  /// Example 12: Report post
  static Future<void> reportPost({
    required BuildContext context,
    required Future<void> Function() reportAction,
  }) async {
    context.showLoadingSnackBar('Submitting report...');

    try {
      await reportAction();
      context.hideSnackBar();
      context.showSuccessSnackBar('Post reported. We will review it.');
    } catch (e) {
      context.hideSnackBar();
      context.showErrorSnackBar('Failed to report post');
    }
  }

  /// Example 13: Follow/Unfollow user
  static void toggleFollowUser({
    required BuildContext context,
    required bool isFollowing,
    required String username,
  }) {
    if (isFollowing) {
      context.showSuccessSnackBar(
        'Following $username',
        duration: const Duration(seconds: 2),
      );
    } else {
      context.showInfoSnackBar(
        'Unfollowed $username',
        duration: const Duration(seconds: 2),
      );
    }
  }
}
