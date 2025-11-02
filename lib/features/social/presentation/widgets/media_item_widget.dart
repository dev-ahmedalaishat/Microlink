import 'dart:io';

import 'package:flutter/material.dart';
import 'package:microlink/core/theme/spacing.dart';
import '../../../../core/extensions/widget_extensions.dart';

/// A widget that displays a media item (network image, local file, or placeholder)
class MediaItemWidget extends StatelessWidget {
  final String mediaUrl;
  final double width;
  final double height;

  const MediaItemWidget({
    super.key,
    required this.mediaUrl,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final placeholderIcon = Icon(
      Icons.image,
      size: 50,
      color: Theme.of(context).colorScheme.onSurface.withAlpha(128),
    ).center();

    // Check if it's a network URL
    if (mediaUrl.startsWith('http://') || mediaUrl.startsWith('https://')) {
      return Image.network(
            mediaUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) => placeholderIcon,
          )
          .sized(width: width, height: height)
          .backgroundWithBorderRadius(
            Theme.of(context).colorScheme.surfaceContainer,
            BorderRadius.all(Radius.circular(AppSpacing.postImageRadius)),
          );
    }

    // Check if it's a file path
    try {
      final file = File(mediaUrl);
      if (file.existsSync()) {
        return Image.file(
              file,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (context, error, stackTrace) => placeholderIcon,
            )
            .sized(width: width, height: height)
            .backgroundWithBorderRadius(
              Theme.of(context).colorScheme.surfaceContainer,
              BorderRadius.all(Radius.circular(AppSpacing.postImageRadius)),
            );
      }
    } catch (e) {
      // If file check fails, fall through to show icon
    }

    // Default: show image icon
    return placeholderIcon
        .sized(width: width, height: height)
        .backgroundWithBorderRadius(
          Theme.of(context).colorScheme.surfaceContainer,
          BorderRadius.all(Radius.circular(AppSpacing.postImageRadius)),
        );
  }
}
