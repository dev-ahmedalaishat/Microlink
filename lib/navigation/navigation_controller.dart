import 'package:flutter/material.dart';

class NavigationController {
  static const List<Color> colors = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ];

  /// Validates if the page index is allowed for navigation
  static bool isValidPageIndex(int pageIndex) {
    // Don't allow changing to the fourth tab (index 3)
    return pageIndex != 3 && pageIndex >= 0 && pageIndex < colors.length;
  }

  /// Gets the appropriate color for the current page
  static Color getPageColor(int currentPage) {
    if (currentPage >= 0 && currentPage < colors.length) {
      return colors[currentPage];
    }
    return colors[0]; // Default to first color
  }

  /// Gets all available colors
  static List<Color> getAllColors() {
    return colors;
  }

  /// Gets the number of active tabs (excluding the disabled fourth tab)
  static int getActiveTabCount() {
    return 3; // Only first 3 tabs are active
  }
}
