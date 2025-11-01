import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:microlink/core/extensions/widget_extensions.dart';
import 'package:microlink/core/presentation/spacing_widgets.dart';
import 'package:microlink/core/theme/spacing.dart';

class EmptyStateWidget extends StatelessWidget {
  /// The image to display - can be an asset path, network URL, or null for default icon
  final String? imagePath;

  /// The main title/heading of the error
  final String? title;

  /// Optional description text providing more details
  final String? description;

  /// Optional callback for refresh/retry action
  final VoidCallback? onActionButtonPressed;

  /// Custom action button text (defaults to 'retry')
  final String? actionButtonText;

  final Widget? actionButtonIcon;

  /// Image size (defaults to 120x120)
  final double? imageSize;

  /// Whether to show the default error icon when no image is provided
  final bool showDefaultIcon;

  const EmptyStateWidget({
    super.key,
    this.imagePath,
    this.title,
    this.description,
    this.onActionButtonPressed,
    this.actionButtonText,
    this.actionButtonIcon,
    this.imageSize = 160.0,
    this.showDefaultIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildImageOrIcon(context),
          if (title != null) ...[
            SpacerV.l,
            Text(
              title!,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
          if (description != null) ...[
            SpacerV.m,
            Text(
              description!,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],

          // Action Button (if callback provided)
          if (onActionButtonPressed != null) ...[
            SpacerV.l,
            ElevatedButton.icon(
              onPressed: onActionButtonPressed,
              icon: actionButtonIcon ?? const SizedBox.shrink(),
              label: Text(actionButtonText ?? 'Retry'),
            ).fractionallyWidth(.7),
          ],
        ],
      ),
    );
  }

  Widget _buildImageOrIcon(BuildContext context) {
    if (imagePath != null && imagePath!.isNotEmpty) {
      return _buildImage();
    } else if (showDefaultIcon) {
      return _buildDefaultIcon(context);
    }
    return const SizedBox.shrink();
  }

  Widget _buildImage() {
    final size = imageSize ?? 120.0;

    // Check if it's a network URL or asset path
    if (imagePath!.startsWith('http')) {
      return Image.network(
        imagePath!,
        width: size,
        height: size,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) =>
            _buildDefaultIcon(context),
      );
    } else {
      // return SvgPicture.asset(
      //   imagePath!,
      //   width: size,
      //   height: size,
      //   // color: Colors.blue, // optional
      // );
      return Image.asset(
        imagePath!,
        width: size,
        height: size,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) =>
            _buildDefaultIcon(context),
      );
    }
  }

  Widget _buildDefaultIcon(BuildContext context) {
    return Container(
      width: imageSize ?? 120.0,
      height: imageSize ?? 120.0,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.error_outline_rounded,
        size: (imageSize ?? 120.0) * 0.5,
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }
}

// Convenience constructors for common error scenarios
extension EmptyStateWidgetExt on EmptyStateWidget {
  /// Creates a network error widget
  static EmptyStateWidget networkError({
    Key? key,
    String? customTitle,
    String? customDescription,
    VoidCallback? onActionButtonPressed,
  }) {
    return EmptyStateWidget(
      key: key,
      title: customTitle ?? 'network_error_title',
      description: customDescription ?? 'network_error_description',
      onActionButtonPressed: onActionButtonPressed,
      imagePath:
          'assets/illustrations/ill_no_network_connection.svg', // Could add a network error image asset
    );
  }

  /// Creates an empty state widget (no data found)
  static EmptyStateWidget empty({
    Key? key,
    String? customTitle,
    String? customDescription,
    String? imagePath,
    String? actionButtonText,
    Widget? actionButtonIcon,
    VoidCallback? onActionButtonPressed,
  }) {
    return EmptyStateWidget(
      key: key,
      title: customTitle,
      description: customDescription ?? 'no_data_description',
      imagePath: imagePath,
      actionButtonText: actionButtonText,
      actionButtonIcon: actionButtonIcon,
      onActionButtonPressed: onActionButtonPressed,
      showDefaultIcon: imagePath == null,
    );
  }

  static EmptyStateWidget emptySearch({
    Key? key,
    String? customTitle,
    String? customDescription,
  }) {
    return EmptyStateWidget(
      key: key,
      title: customTitle ?? 'no_data_title',
      description: customDescription ?? 'no_search_results_description',
      imagePath: 'assets/illustrations/ill_no_search_results.svg',
      showDefaultIcon: false,
    );
  }

  /// Creates a coming soon widget
  static EmptyStateWidget comingSoon({
    Key? key,
    String? customTitle,
    String? customDescription,
    String? imagePath,
  }) {
    return EmptyStateWidget(
      key: key,
      title: customTitle ?? 'Coming Soon',
      description: customDescription ?? 'This feature is under development and will be available soon.',
      imagePath: imagePath,
      showDefaultIcon: imagePath == null,
    );
  }
}

/// Standalone Coming Soon Widget with custom styling
class ComingSoonWidget extends StatelessWidget {
  final String? title;
  final String? description;
  final String? imagePath;
  final double? imageSize;

  const ComingSoonWidget({
    super.key,
    this.title,
    this.description,
    this.imagePath,
    this.imageSize = 200.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image or Icon
            _buildImageOrIcon(context),
            SpacerV.xl,
            
            // Title
            Text(
              title ?? 'Coming Soon',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
            SpacerV.m,
            
            // Description
            Text(
              description ?? 'This feature is under development\nand will be available soon.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            SpacerV.xl,
            
            // Decorative element
            _buildDecorativeElement(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImageOrIcon(BuildContext context) {
    if (imagePath != null && imagePath!.isNotEmpty) {
      return Image.asset(
        imagePath!,
        width: imageSize,
        height: imageSize,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => _buildDefaultIcon(context),
      );
    }
    return _buildDefaultIcon(context);
  }

  Widget _buildDefaultIcon(BuildContext context) {
    return Container(
      width: imageSize ?? 200.0,
      height: imageSize ?? 200.0,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withAlpha(51),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.rocket_launch_rounded,
        size: (imageSize ?? 200.0) * 0.5,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _buildDecorativeElement(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withAlpha(128),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
