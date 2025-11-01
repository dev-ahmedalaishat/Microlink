import 'dart:ui';

/// App-wide constants for consistent design system
class AppConstants {
  // Private constructor to prevent instantiation
  AppConstants._();

  /// Icon sizes
  static const double iconXS = 12.0;
  static const double iconS = 16.0;
  static const double iconM = 20.0;
  static const double iconL = 24.0;
  static const double iconXL = 32.0;
  static const double iconXXL = 48.0;
  static const double iconXXXL = 64.0;

  /// Elevation constants
  static const double elevationNone = 0.0;
  static const double elevationXS = 1.0;
  static const double elevationS = 2.0;
  static const double elevationM = 4.0;
  static const double elevationL = 6.0;
  static const double elevationXL = 8.0;
  static const double elevationXXL = 12.0;

  /// Font size constants
  static const double fontXS = 10.0;
  static const double fontS = 12.0;
  static const double fontM = 14.0;
  static const double fontL = 16.0;
  static const double fontXL = 18.0;
  static const double fontXXL = 20.0;
  static const double fontXXXL = 24.0;
  static const double fontTitle = 28.0;
  static const double fontHeading = 32.0;

  /// Animation duration constants
  static const int animationFast = 150;
  static const int animationNormal = 300;
  static const int animationSlow = 500;

  /// Opacity constants
  static const double opacityDisabled = 0.38;
  static const double opacityMedium = 0.54;
  static const double opacityHigh = 0.87;
  static const double opacityFull = 1.0;

  /// Common dimensions
  static const double buttonHeight = 48.0;
  static const double inputHeight = 56.0;
  static const double appBarHeight = 56.0;
  static const double bottomNavHeight = 60.0;
  static const double cardMinHeight = 80.0;
  static const double avatarSize = 40.0;
  static const double avatarSizeL = 56.0;
  static const double avatarSizeXL = 72.0;

  /// Grid and layout constants
  static const int gridColumns = 12;
  static const double maxContentWidth = 1200.0;
  static const double sidebarWidth = 280.0;
  static const double drawerWidth = 304.0;

  /// Breakpoints for responsive design
  static const double breakpointMobile = 600.0;
  static const double breakpointTablet = 900.0;
  static const double breakpointDesktop = 1200.0;
  static const double breakpointLargeDesktop = 1800.0;

  static const Color pendingColor = Color(0xFFD9A956);
  static const Color inProgressColor = Color(0xFF2A479C);
  static const Color approvedColor = Color(0xFF34C759);

  static const String contactUsPhone = '+971 6 561 0111';
  static const String contactUsEmail = 'Shjeng@eim.ae';

  /// File size limits
  static const int maxFileSizeBytes = 5 * 1024 * 1024; // 5MB in bytes
  static const double maxFileSizeMB = 5.0;

  static List<String> avatars = [
    'assets/images/img_micropolis.png',
    'assets/images/img_tsc.png',
    // 'assets/images/img_garden.png',
  ];

  static final Map<String, String> avatarMap = {};

  static String getRandomAvatar(String userId) {
    if (avatarMap.containsKey(userId)) {
      return avatarMap[userId]!;
    }

    final shuffled = List<String>.from(avatars)..shuffle();
    final avatar = shuffled.first;
    avatarMap[userId] = avatar;
    return avatar;
  }
}
