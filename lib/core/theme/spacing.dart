/// Consistent spacing values based on 4dp grid system
class AppSpacing {
  AppSpacing._();

  // Base spacing unit (4dp)
  static const double base = 4.0;

  // Common spacing values
  static const double xs = base; // 4dp
  static const double sm = base * 2; // 8dp
  static const double md = base * 3; // 12dp
  static const double lg = base * 4; // 16dp
  static const double xl = base * 5; // 20dp
  static const double xxl = base * 6; // 24dp
  static const double xxxl = base * 8; // 32dp

  // Specific UI spacing
  static const double screenPadding = lg; // 16dp
  static const double cardPadding = lg; // 16dp
  static const double elementSpacing = md; // 12dp
  static const double sectionSpacing = xxl; // 24dp

  // Post-specific spacing
  static const double postPadding = lg; // 16dp
  static const double postImageSpacing = sm; // 8dp
  static const double interactionSpacing = lg; // 16dp

  // Form spacing
  static const double formFieldSpacing = lg; // 16dp
  static const double buttonPadding = lg; // 16dp

  // Navigation spacing
  static const double navBarHeight = 60.0;
  static const double fabSize = 56.0;
  static const double tabHeight = 48.0;

  // Story section
  static const double storyItemSize = 70.0;
  static const double storySpacing = md; // 12dp

  // Avatar sizes
  static const double avatarSmall = 32.0;
  static const double avatarMedium = 40.0;
  static const double avatarLarge = 56.0;

  // Border radius
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;
  static const double radiusXLarge = 24.0;
  static const double radiusCircular = 50.0;

  // Story and post image radius
  static const double storyRadius = radiusMedium;
  static const double postImageRadius = radiusSmall;
  static const double cardRadius = radiusMedium;
}
