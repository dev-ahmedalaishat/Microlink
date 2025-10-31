import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:microlink/core/extensions/widget_extensions.dart';

/// Custom snackbar types
enum SnackBarType { success, error, warning, info, loading }

/// Custom snackbar configuration
class CustomSnackBar {
  final String message;
  final SnackBarType type;
  final VoidCallback? onTap;
  final Widget? leading;
  final Widget? trailing;
  final Duration duration;
  final bool showCloseButton;

  const CustomSnackBar({
    required this.message,
    this.type = SnackBarType.info,
    this.onTap,
    this.leading,
    this.trailing,
    this.duration = const Duration(seconds: 3),
    this.showCloseButton = false,
  });

  /// Get the appropriate background color for the snackbar type
  Color get backgroundColor {
    return Color(0XFF2B2B31);
    // switch (type) {
    //   case SnackBarType.success:
    //     return AppColors.success;
    //   case SnackBarType.error:
    //     return AppColors.error;
    //   case SnackBarType.warning:
    //     return AppColors.warning;
    //   case SnackBarType.info:
    //     return AppColors.info;
    //   case SnackBarType.loading:
    //     return AppColors.textSecondary;
    // }
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
        iconColor: iconColor,
        textColor: textColor,
        leading: leading,
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
  final Color iconColor;
  final Color textColor;
  final Widget? leading;
  final Widget? trailing;
  final bool showCloseButton;
  final VoidCallback onClose;

  const _SnackBarContent({
    required this.message,
    required this.iconColor,
    required this.textColor,
    this.leading,
    this.trailing,
    required this.showCloseButton,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (leading != null) ...[leading!, const SizedBox(width: 12)],
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
      leading: SizedBox(
        width: 32,
        height: 32,
        child: Lottie.asset(
          "assets/lottie/success.json",
          fit: BoxFit.contain,
          repeat: false,
        ),
      ),
      trailing: InkWell(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        onTap: () => onTap?.call(),
        child: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 10,
        ).paddingAll(11),
      ),
      duration: duration ?? const Duration(seconds: 3),
      // onTap: onTap,
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
      leading: SizedBox(
        width: 32,
        height: 32,
        child: Lottie.asset(
          "assets/lottie/error.json",
          fit: BoxFit.contain,
          repeat: false,
        ).scale(2),
      ),
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
      leading: SizedBox(
        width: 32,
        height: 32,
        child: Lottie.asset(
          "assets/lottie/warning.json",
          fit: BoxFit.contain,
          repeat: false,
        ),
      ),
      onTap: onTap,
    ).show(this);
  }

  /// Show a no internet snackbar
  void showNoInternetSnackBar(
    String message, {
    Duration? duration,
    VoidCallback? onTap,
  }) {
    CustomSnackBar(
      message: message,
      type: SnackBarType.warning,
      duration: const Duration(days: 365),
      leading: SizedBox(
        width: 32,
        height: 32,
        child: Lottie.asset(
          "assets/lottie/no_internet.json",
          fit: BoxFit.contain,
          repeat: false,
        ),
      ),
      onTap: onTap,
      showCloseButton: true,
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
      leading: SizedBox(
        width: 32,
        height: 32,
        child: Lottie.asset(
          "assets/lottie/loading.json",
          fit: BoxFit.contain,
        ).scale(2),
      ),
      // trailing: SizedBox(
      //   width: 20,
      //   height: 20,
      //   child: CircularProgressIndicator(
      //     strokeWidth: 2,
      //     valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      //   ),
      // ),
    ).show(this);
  }

  /// Hide the current snackbar
  void hideSnackBar() {
    CustomSnackBar.hide(this);
  }
}
