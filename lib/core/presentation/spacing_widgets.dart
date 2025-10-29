import 'package:flutter/material.dart';
import 'package:microlink/core/theme/spacing.dart';

/// Horizontal spacing widgets using predefined constants
class SpacerH {
  SpacerH._(); // Private constructor to prevent instantiation

  /// Extra small horizontal spacing (4.0)
  static const Widget xs = SizedBox(width: AppSpacing.xs);

  /// Small horizontal spacing (8.0)
  static const Widget s = SizedBox(width: AppSpacing.sm);

  /// Medium horizontal spacing (12.0)
  static const Widget m = SizedBox(width: AppSpacing.md);

  /// Large horizontal spacing (16.0)
  static const Widget l = SizedBox(width: AppSpacing.lg);

  /// Extra large horizontal spacing (20.0)
  static const Widget xl = SizedBox(width: AppSpacing.xl);

  /// Extra extra large horizontal spacing (24.0)
  static const Widget xxl = SizedBox(width: AppSpacing.xxl);

  /// Extra extra extra large horizontal spacing (32.0)
  static const Widget xxxl = SizedBox(width: AppSpacing.xxxl);

  /// Extra extra extra large horizontal spacing (32.0)
  static const Widget full = SizedBox(width: double.infinity);
}

/// Vertical spacing widgets using predefined constants
class SpacerV {
  SpacerV._(); // Private constructor to prevent instantiation

  /// Extra small vertical spacing (4.0)
  static const Widget xs = SizedBox(height: AppSpacing.xs);

  /// Small vertical spacing (8.0)
  static const Widget s = SizedBox(height: AppSpacing.sm);

  /// Medium vertical spacing (12.0)
  static const Widget m = SizedBox(height: AppSpacing.md);

  /// Large vertical spacing (16.0)
  static const Widget l = SizedBox(height: AppSpacing.lg);

  /// Extra large vertical spacing (20.0)
  static const Widget xl = SizedBox(height: AppSpacing.xl);

  /// Extra extra large vertical spacing (24.0)
  static const Widget xxl = SizedBox(height: AppSpacing.xxl);

  /// Extra extra extra large vertical spacing (32.0)
  static const Widget xxxl = SizedBox(height: AppSpacing.xxxl);
}
