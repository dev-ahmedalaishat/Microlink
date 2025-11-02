import 'package:flutter/material.dart';

/// Color palette based on the Figma design
class AppColors {
  AppColors._();

  // Primary Colors (Teal/Green from design)
  static const Color primary = Color(0xFF006C5D);

  // Accent Colors (Red/Coral from Add button)
  static const Color accent = Color(0xFFFF5252);
  static const Color accentLight = Color(0xFFFF8A80);
  static const Color accentDark = Color(0xFFD32F2F);

  // Background Colors
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF5F5F5);
  static const Color surfaceContainer = Color(
    0xFFEEEEEE,
  ); // Similar to grey.shade200
  static const Color surfaceContainerHigh = Color(
    0xFFE0E0E0,
  ); // Slightly darker than surfaceContainer

  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFF9E9E9E);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Border and Divider Colors
  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFEEEEEE);

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);

  // Story Border (Orange from design)
  static const Color storyBorder = Color(0xFFFF9800);

  // Interactive Elements
  static const Color liked = Color(0xFFE91E63);
  static const Color iconInactive = Color(0xFF9E9E9E);
  static const Color iconActive = Color(0xFF212121);
}

/// Dark theme color palette
class AppColorsDark {
  AppColorsDark._();

  // Primary Colors (Lighter teal for dark mode)
  static const Color primary = Color(0xFF26A69A);

  // Accent Colors (Slightly muted red for dark mode)
  static const Color accent = Color(0xFFFF5252);
  static const Color accentLight = Color(0xFFFF8A80);
  static const Color accentDark = Color(0xFFD32F2F);

  // Background Colors (Dark surfaces)
  static const Color surface = Color(0xFF1E1E1E);
  static const Color cardBackground = Color(0xFF2C2C2C);
  static const Color background = Color(0xFF121212);
  static const Color surfaceContainer = Color(
    0xFF2A2A2A,
  ); // Slightly lighter than surface
  static const Color surfaceContainerHigh = Color(
    0xFF353535,
  ); // More elevated than surfaceContainer

  // Text Colors (Light text on dark background)
  static const Color textPrimary = Color(0xFFE0E0E0);
  static const Color textSecondary = Color(0xFFB0B0B0);
  static const Color textHint = Color(0xFF757575);
  static const Color textOnPrimary = Color(0xFF000000);

  // Border and Divider Colors
  static const Color border = Color(0xFF424242);
  static const Color divider = Color(0xFF303030);

  // Status Colors (Same as light theme)
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);

  // Story Border
  static const Color storyBorder = Color(0xFFFF9800);

  // Interactive Elements
  static const Color liked = Color(0xFFE91E63);
  static const Color iconInactive = Color(0xFF757575);
  static const Color iconActive = Color(0xFFE0E0E0);
}
