import 'package:flutter/material.dart';
import '../../theme/color_palette.dart';

/// Custom snackbar types
enum SnackBarType { success, error, warning, info, loading }

/// Custom snackbar configuration
class CustomSnackBar {
  final String message;
  final SnackBarType type;
  final Duration duration;
  final bool showIcon;
  final IconData? customIcon;
  final VoidCallback? onTap;
  final Widget? trailing;
  final bool showCloseButton;

  const CustomSnackBar({
    required this.message,
    this.type = SnackBarType.info,
    this.duration = const Duration(seconds: 3),
    this.showIcon = true,
    this.customIcon,
    this.onTap,
    this.trailing,
    this.showCloseButton = false,
  });

  /// Get the appropriate icon for the snackbar type
  IconData get icon {
    if (customIcon != null) return customIcon!;

    switch (type) {
      case SnackBarType.success:
        return Icons.check_circle_rounded;
      case SnackBarType.error:
        return Icons.error_rounded;
      case SnackBarType.warning:
        return Icons.warning_rounded;
      case SnackBarType.info:
        return Icons.info_rounded;
      case SnackBarType.loading:
        return Icons.hourglass_empty_rounded;
    }
  }

  /// Get the appropriate background color for the snackbar type
  Color get backgroundColor {
    switch (type) {
      case SnackBarType.success:
        return AppColors.success;
      case SnackBarType.error:
        return AppColors.error;
      case SnackBarType.warning:
        return AppColors.warning;
      case SnackBarType.info:
        return AppColors.info;
      case SnackBarType.loading:
        return AppColors.textSecondary;
    }
  }

  /// Get the appropriate icon color for the snackbar type
  Color get iconColor {
    return Colors.white;
  }

  /// Get the appropriate text color for the snackbar type
  Color get textColor {
    return Colors.white;
  }

  /// Show the snackbar
  void show(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final snackBar = SnackBar(
      content: _SnackBarContent(
        message: message,
        icon: showIcon ? icon : null,
        iconColor: iconColor,
        textColor: textColor,
        trailing: trailing,
        showCloseButton: showCloseButton,
        onClose: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      duration: type == SnackBarType.loading
          ? const Duration(days: 365) // Persistent for loading
          : duration,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      action: onTap != null
          ? SnackBarAction(
              label: 'View',
              textColor: Colors.white,
              onPressed: onTap!,
            )
          : null,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// Hide any currently showing snackbar
  static void hide(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}

/// Internal widget for snackbar content
class _SnackBarContent extends StatelessWidget {
  final String message;
  final IconData? icon;
  final Color iconColor;
  final Color textColor;
  final Widget? trailing;
  final bool showCloseButton;
  final VoidCallback onClose;

  const _SnackBarContent({
    required this.message,
    this.icon,
    required this.iconColor,
    required this.textColor,
    this.trailing,
    required this.showCloseButton,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) ...[
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(width: 12),
        ],
        Expanded(
          child: Text(
            message,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        if (trailing != null) ...[const SizedBox(width: 12), trailing!],
        if (showCloseButton) ...[
          const SizedBox(width: 12),
          GestureDetector(
            onTap: onClose,
            child: Icon(Icons.close, color: textColor, size: 20),
          ),
        ],
      ],
    );
  }
}

/// Extension for easy snackbar access
extension SnackBarExtension on BuildContext {
  /// Show a success snackbar
  void showSuccessSnackBar(
    String message, {
    Duration? duration,
    VoidCallback? onTap,
  }) {
    CustomSnackBar(
      message: message,
      type: SnackBarType.success,
      duration: duration ?? const Duration(seconds: 3),
      onTap: onTap,
    ).show(this);
  }

  /// Show an error snackbar
  void showErrorSnackBar(
    String message, {
    Duration? duration,
    VoidCallback? onTap,
  }) {
    CustomSnackBar(
      message: message,
      type: SnackBarType.error,
      duration: duration ?? const Duration(seconds: 4),
      onTap: onTap,
    ).show(this);
  }

  /// Show a warning snackbar
  void showWarningSnackBar(
    String message, {
    Duration? duration,
    VoidCallback? onTap,
  }) {
    CustomSnackBar(
      message: message,
      type: SnackBarType.warning,
      duration: duration ?? const Duration(seconds: 3),
      onTap: onTap,
    ).show(this);
  }

  /// Show an info snackbar
  void showInfoSnackBar(
    String message, {
    Duration? duration,
    VoidCallback? onTap,
  }) {
    CustomSnackBar(
      message: message,
      type: SnackBarType.info,
      duration: duration ?? const Duration(seconds: 3),
      onTap: onTap,
    ).show(this);
  }

  /// Show a loading snackbar
  void showLoadingSnackBar(String message) {
    CustomSnackBar(
      message: message,
      type: SnackBarType.loading,
      showIcon: true,
      trailing: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    ).show(this);
  }

  /// Hide the current snackbar
  void hideSnackBar() {
    CustomSnackBar.hide(this);
  }
}
