import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theme/color_palette.dart';

/// A reusable story avatar widget that displays a circular avatar
/// with an optional image, icon, or custom child widget
class StoryAvatar extends StatelessWidget {
  final double size;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final String? imageUrl;
  final Widget? child;
  final VoidCallback? onTap;

  const StoryAvatar({
    super.key,
    this.size = 60,
    this.borderColor = AppColors.storyBorder,
    this.borderWidth = 2,
    this.borderRadius = 12,
    this.imageUrl,
    this.child,
    this.onTap,
  });

  /// Factory constructor for creating an "Add Story" avatar
  factory StoryAvatar.add({
    double size = 60,
    Color borderColor = AppColors.storyBorder,
    VoidCallback? onTap,
  }) {
    return StoryAvatar(
      size: size,
      borderColor: borderColor,
      onTap: onTap,
      child: const Icon(Icons.add, color: Colors.white, size: 24),
    );
  }

  /// Factory constructor for creating a story avatar with initials
  factory StoryAvatar.initials({
    required String name,
    double size = 60,
    Color borderColor = AppColors.storyBorder,
    VoidCallback? onTap,
  }) {
    return StoryAvatar(
      size: size,
      borderColor: borderColor,
      onTap: onTap,
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : '?',
        style: const TextStyle(
          color: AppColors.textOnPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    // Determine content: custom child, image, or fallback icon
    if (child != null) {
      content = child!;
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      content = ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          imageUrl: imageUrl!,
          width: size,
          height: size,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.apartment, // ic_micropolis placeholder
            color: AppColors.iconInactive,
          ),
        ),
      );
    } else {
      // Fallback to ic_micropolis icon
      content = const Icon(
        Icons.apartment, // Using apartment icon as placeholder for ic_micropolis
        color: AppColors.iconInactive,
      );
    }

    final avatar = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: content,
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: avatar,
      );
    }

    return avatar;
  }
}
