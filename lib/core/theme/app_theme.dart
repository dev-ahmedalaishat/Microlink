import 'package:flutter/material.dart';
import 'color_palette.dart';
import 'text_styles.dart';
import 'spacing.dart';

/// Main theme configuration for the app
class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    // Color scheme
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.accent,
      surface: AppColors.background,
      surfaceContainer: AppColors.surfaceContainer,
      surfaceContainerHigh: AppColors.surfaceContainerHigh,
      error: AppColors.error,
      onPrimary: AppColors.textOnPrimary,
      onSecondary: AppColors.textOnPrimary,
      onSurface: AppColors.textPrimary,
    ),

    // App Bar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surface,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyles.heading3,
      iconTheme: IconThemeData(color: AppColors.textPrimary),
    ),

    // Card Theme
    cardTheme: CardThemeData(
      color: AppColors.cardBackground,
      elevation: 2,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenPadding,
        vertical: AppSpacing.sm,
      ),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        textStyle: AppTextStyles.buttonLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.buttonPadding,
          vertical: AppSpacing.md,
        ),
        elevation: 2,
      ),
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: AppTextStyles.buttonMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.buttonPadding,
          vertical: AppSpacing.sm,
        ),
      ),
    ),

    // Floating Action Button Theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textOnPrimary,
      elevation: 6,
      shape: CircleBorder(),
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      hintStyle: AppTextStyles.inputHint,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
        borderSide: const BorderSide(color: AppColors.error),
      ),
    ),

    // Tab Bar Theme
    tabBarTheme: const TabBarThemeData(
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.textSecondary,
      labelStyle: AppTextStyles.tabActive,
      unselectedLabelStyle: AppTextStyles.tabInactive,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: AppColors.primary, width: 3),
      ),
    ),

    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.iconInactive,
      elevation: 8,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: AppTextStyles.caption,
      unselectedLabelStyle: AppTextStyles.caption,
    ),

    // Icon Theme
    iconTheme: const IconThemeData(color: AppColors.iconActive, size: 24),

    // Divider Theme
    dividerTheme: const DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
      space: 1,
    ),

    // Text Theme (using our custom text styles)
    textTheme: const TextTheme(
      displayLarge: AppTextStyles.heading1,
      displayMedium: AppTextStyles.heading2,
      displaySmall: AppTextStyles.heading3,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,
      labelLarge: AppTextStyles.buttonLarge,
      labelMedium: AppTextStyles.buttonMedium,
      titleMedium: AppTextStyles.userName,
      labelSmall: AppTextStyles.timestamp,
    ),

    // Scaffold background color
    scaffoldBackgroundColor: AppColors.background,

    // Use Material 3
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    // Color scheme
    colorScheme: const ColorScheme.dark(
      primary: AppColorsDark.primary,
      secondary: AppColorsDark.accent,
      surface: AppColorsDark.surface,
      surfaceContainer: AppColorsDark.surfaceContainer,
      surfaceContainerHigh: AppColorsDark.surfaceContainerHigh,
      error: AppColorsDark.error,
      onPrimary: AppColorsDark.textOnPrimary,
      onSecondary: AppColorsDark.textOnPrimary,
      onSurface: AppColorsDark.textPrimary,
    ),

    // App Bar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorsDark.surface,
      foregroundColor: AppColorsDark.textPrimary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyles.heading3.copyWith(
        color: AppColorsDark.textPrimary,
      ),
      iconTheme: const IconThemeData(color: AppColorsDark.textPrimary),
    ),

    // Card Theme
    cardTheme: CardThemeData(
      color: AppColorsDark.cardBackground,
      elevation: 2,
      shadowColor: Colors.black54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenPadding,
        vertical: AppSpacing.sm,
      ),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorsDark.primary,
        foregroundColor: AppColorsDark.textOnPrimary,
        textStyle: AppTextStyles.buttonLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.buttonPadding,
          vertical: AppSpacing.md,
        ),
        elevation: 2,
      ),
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColorsDark.primary,
        textStyle: AppTextStyles.buttonMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.buttonPadding,
          vertical: AppSpacing.sm,
        ),
      ),
    ),

    // Floating Action Button Theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColorsDark.primary,
      foregroundColor: AppColorsDark.textOnPrimary,
      elevation: 6,
      shape: CircleBorder(),
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColorsDark.surface,
      hintStyle: AppTextStyles.inputHint.copyWith(
        color: AppColorsDark.textHint,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
        borderSide: const BorderSide(color: AppColorsDark.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
        borderSide: const BorderSide(color: AppColorsDark.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
        borderSide: const BorderSide(color: AppColorsDark.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
        borderSide: const BorderSide(color: AppColorsDark.error),
      ),
    ),

    // Tab Bar Theme
    tabBarTheme: const TabBarThemeData(
      labelColor: AppColorsDark.primary,
      unselectedLabelColor: AppColorsDark.textSecondary,
      labelStyle: AppTextStyles.tabActive,
      unselectedLabelStyle: AppTextStyles.tabInactive,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: AppColorsDark.primary, width: 3),
      ),
    ),

    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColorsDark.surface,
      selectedItemColor: AppColorsDark.primary,
      unselectedItemColor: AppColorsDark.iconInactive,
      elevation: 8,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: AppTextStyles.caption,
      unselectedLabelStyle: AppTextStyles.caption,
    ),

    // Icon Theme
    iconTheme: const IconThemeData(color: AppColorsDark.iconActive, size: 24),

    // Divider Theme
    dividerTheme: const DividerThemeData(
      color: AppColorsDark.divider,
      thickness: 1,
      space: 1,
    ),

    // Text Theme (using our custom text styles with dark colors)
    textTheme: TextTheme(
      displayLarge: AppTextStyles.heading1.copyWith(
        color: AppColorsDark.textPrimary,
      ),
      displayMedium: AppTextStyles.heading2.copyWith(
        color: AppColorsDark.textPrimary,
      ),
      displaySmall: AppTextStyles.heading3.copyWith(
        color: AppColorsDark.textPrimary,
      ),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(
        color: AppColorsDark.textPrimary,
      ),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(
        color: AppColorsDark.textPrimary,
      ),
      bodySmall: AppTextStyles.bodySmall.copyWith(
        color: AppColorsDark.textPrimary,
      ),
      labelLarge: AppTextStyles.buttonLarge,
      labelMedium: AppTextStyles.buttonMedium,
      titleMedium: AppTextStyles.userName.copyWith(
        color: AppColorsDark.textPrimary,
      ),
      labelSmall: AppTextStyles.timestamp.copyWith(
        color: AppColorsDark.textSecondary,
      ),
    ),

    // Scaffold background color
    scaffoldBackgroundColor: AppColorsDark.background,

    // Use Material 3
    useMaterial3: true,
  );
}
