import 'package:flutter/material.dart';

/// Color palette based on the Figma design
class AppColors {
  AppColors._();

  // Primary Colors (Teal/Green from design)
  static const Color primary = Color(0xFF008080);
  static const Color primaryLight = Color(0xFF4DB6AC);
  static const Color primaryDark = Color(0xFF00695C);

  // Accent Colors (Red/Coral from Add button)
  static const Color accent = Color(0xFFFF5252);
  static const Color accentLight = Color(0xFFFF8A80);
  static const Color accentDark = Color(0xFFD32F2F);

  // Background Colors
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);

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
