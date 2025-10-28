import 'dart:developer';

import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

/// Extension methods for Widget to reduce boilerplate code
extension WidgetExtensions on Widget {
  /// Adds padding to all sides of the widget
  Widget paddingAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  /// Adds symmetric padding (horizontal and vertical)
  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );

  /// Adds padding only to specific sides
  Widget paddingOnly({
    double start = 0,
    double top = 0,
    double end = 0,
    double bottom = 0,
  }) => Padding(
    padding: EdgeInsetsDirectional.only(
      start: start,
      top: top,
      end: end,
      bottom: bottom,
    ),
    child: this,
  );

  /// Centers the widget
  Widget center() => Center(child: this);

  /// Expands the widget to fill available space
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  Widget maxWidth(double maxWidth) => ConstrainedBox(
    constraints: BoxConstraints(maxWidth: maxWidth),
    child: this,
  );

  Widget maxHeight(double maxHeight) => ConstrainedBox(
    constraints: BoxConstraints(maxHeight: maxHeight),
    child: this,
  );

  /// Makes the widget flexible
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(flex: flex, fit: fit, child: this);

  /// Adds a margin around the widget
  Widget marginAll(double value) =>
      Container(margin: EdgeInsets.all(value), child: this);

  /// Adds symmetric margin
  Widget marginSymmetric({double horizontal = 0, double vertical = 0}) =>
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );

  /// Adds margin only to specific sides
  Widget marginOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => Container(
    margin: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
    child: this,
  );

  Widget withAspectRatio(double ratio) {
    return AspectRatio(aspectRatio: ratio, child: this);
  }

  /// Wraps the widget in a SizedBox with specific dimensions
  Widget sized({double? width, double? height}) =>
      SizedBox(width: width, height: height, child: this);

  /// Wraps the widget in a SizedBox with specific dimensions
  Widget sizedConditional(bool condition, {double? width, double? height}) =>
      condition ? SizedBox(width: width, height: height, child: this) : this;

  /// Wraps the widget in a SizedBox with specific dimensions
  Widget square(double? dimension) =>
      SizedBox(width: dimension, height: dimension, child: this);

  /// Makes the widget take the full width
  Widget fullWidth() => SizedBox(width: double.infinity, child: this);

  /// Makes the widget take the full height
  Widget fullHeight() => SizedBox(height: double.infinity, child: this);

  /// Makes the widget take a fraction of its parent's width
  Widget fractionallyWidth(double widthFactor) =>
      FractionallySizedBox(widthFactor: widthFactor, child: this);

  /// Makes the widget take a fraction of its parent's height
  Widget fractionallyHeight(double widthFactor) =>
      FractionallySizedBox(heightFactor: widthFactor, child: this);

  /// Adds a tap gesture to the widget
  Widget onTap(VoidCallback onTap) =>
      GestureDetector(onTap: onTap, child: this);

  /// Adds a long press gesture to the widget
  Widget onLongPress(VoidCallback onLongPress) =>
      GestureDetector(onLongPress: onLongPress, child: this);

  /// Wraps the widget in a Card
  Widget card({
    Color? color,
    double? elevation,
    EdgeInsetsGeometry? margin,
    ShapeBorder? shape,
  }) => Card(
    color: color,
    elevation: elevation,
    margin: margin,
    shape: shape,
    child: this,
  );

  /// Adds a border radius to the widget
  Widget borderRadius(double radius) =>
      ClipRRect(borderRadius: BorderRadius.circular(radius), child: this);

  /// Adds custom border radius to the widget
  Widget customBorderRadius(BorderRadius borderRadius) =>
      ClipRRect(borderRadius: borderRadius, child: this);

  /// Makes the widget circular (useful for images, containers, etc.)
  Widget circular() => ClipOval(child: this);

  /// Adds opacity to the widget
  Widget opacity(double opacity) => Opacity(opacity: opacity, child: this);

  /// Rotates the widget by the specified angle (in radians)
  Widget rotate(double angle) => Transform.rotate(angle: angle, child: this);

  /// Scales the widget by the specified factor
  Widget scale(double scale) => Transform.scale(scale: scale, child: this);

  /// Adds a hero animation to the widget
  Widget hero(String tag) => Hero(tag: tag, child: this);

  /// Wraps the widget in a SafeArea
  Widget safeArea({
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) =>
      SafeArea(top: top, bottom: bottom, left: left, right: right, child: this);

  /// Adds a tooltip to the widget
  Widget tooltip(String message) => Tooltip(message: message, child: this);

  /// Wraps the widget in a SingleChildScrollView
  Widget scrollable({
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    EdgeInsetsGeometry? padding,
  }) => SingleChildScrollView(
    scrollDirection: scrollDirection,
    reverse: reverse,
    padding: padding,
    child: this,
  );

  // MARK: - Predefined Padding Extensions using AppConstants

  /// Adds extra small padding (4.0) to all sides
  Widget paddingXS() => paddingAll(AppConstants.paddingXS);

  /// Adds extra small padding (4.0) to all sides
  Widget paddingXXS() => paddingAll(AppConstants.paddingXXS);

  /// Adds small padding (8.0) to all sides
  Widget paddingS() => paddingAll(AppConstants.paddingS);

  /// Adds medium padding (12.0) to all sides
  Widget paddingM() => paddingAll(AppConstants.paddingM);

  /// Adds large padding (16.0) to all sides
  Widget paddingL() => paddingAll(AppConstants.paddingL);

  /// Adds extra large padding (20.0) to all sides
  Widget paddingXL() => paddingAll(AppConstants.paddingXL);

  /// Adds extra extra large padding (24.0) to all sides
  Widget paddingXXL() => paddingAll(AppConstants.paddingXXL);

  /// Adds extra extra extra large padding (32.0) to all sides
  Widget paddingXXXL() => paddingAll(AppConstants.paddingXXXL);

  // MARK: - Predefined Spacing Extensions

  /// Adds extra small spacing (4.0) as SizedBox
  Widget spaceXS() => Column(
    children: [
      this,
      SizedBox(height: AppConstants.spaceXS),
    ],
  );

  /// Adds small spacing (8.0) as SizedBox
  Widget spaceS() => Column(
    children: [
      this,
      SizedBox(height: AppConstants.spaceS),
    ],
  );

  /// Adds medium spacing (12.0) as SizedBox
  Widget spaceM() => Column(
    children: [
      this,
      SizedBox(height: AppConstants.spaceM),
    ],
  );

  /// Adds large spacing (16.0) as SizedBox
  Widget spaceL() => Column(
    children: [
      this,
      SizedBox(height: AppConstants.spaceL),
    ],
  );

  /// Adds extra large spacing (20.0) as SizedBox
  Widget spaceXL() => Column(
    children: [
      this,
      SizedBox(height: AppConstants.spaceXL),
    ],
  );

  // MARK: - Predefined Border Radius Extensions

  /// Adds extra small border radius (2.0)
  Widget radiusXS() => borderRadius(AppConstants.radiusXS);

  /// Adds small border radius (4.0)
  Widget radiusS() => borderRadius(AppConstants.radiusS);

  /// Adds medium border radius (8.0)
  Widget radiusM() => borderRadius(AppConstants.radiusM);

  /// Adds large border radius (12.0)
  Widget radiusL() => borderRadius(AppConstants.radiusL);

  /// Adds extra large border radius (16.0)
  Widget radiusXL() => borderRadius(AppConstants.radiusXL);

  /// Adds extra extra large border radius (20.0)
  Widget radiusXXL() => borderRadius(AppConstants.radiusXXL);

  /// Adds extra extra extra large border radius (24.0)
  Widget radiusXXXL() => borderRadius(AppConstants.radiusXXXL);

  // MARK: - Predefined Card Extensions

  /// Creates a card with no elevation
  Widget cardFlat({double? radius, Color? color, EdgeInsetsGeometry? margin}) =>
      card(
        elevation: AppConstants.elevationNone,
        color: color,
        shape: radius != null
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              )
            : null,
        margin: margin,
      );

  /// Creates a card with small elevation (2.0)
  Widget cardS({double? radius, Color? color}) => card(
    elevation: AppConstants.elevationS,
    color: color,
    shape: radius != null
        ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius))
        : null,
  );

  /// Creates a card with medium elevation (4.0)
  Widget cardM({double? radius, Color? color}) => card(
    elevation: AppConstants.elevationS,
    color: color,
    shape: radius != null
        ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius))
        : null,
  );

  /// Creates a card with large elevation (6.0)
  Widget cardL({double? radius, Color? color}) => card(
    elevation: AppConstants.elevationL,
    color: color,
    shape: radius != null
        ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius))
        : null,
  );

  /// Creates a card with extra large elevation (8.0)
  Widget cardXL({double? radius, Color? color}) => card(
    elevation: AppConstants.elevationXL,
    color: color,
    shape: radius != null
        ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius))
        : null,
  );

  // MARK: - Predefined Opacity Extensions

  /// Applies disabled opacity (0.38)
  Widget opacityDisabled() => opacity(AppConstants.opacityDisabled);

  /// Applies medium opacity (0.54)
  Widget opacityMedium() => opacity(AppConstants.opacityMedium);

  /// Applies high opacity (0.87)
  Widget opacityHigh() => opacity(AppConstants.opacityHigh);

  // MARK: - Predefined Size Extensions

  /// Sets widget to button height (48.0)
  Widget buttonHeight() => sized(height: AppConstants.buttonHeight);

  /// Sets widget to input height (56.0)
  Widget inputHeight() => sized(height: AppConstants.inputHeight);

  /// Sets widget to avatar size (40.0)
  Widget avatarSize() =>
      sized(width: AppConstants.avatarSize, height: AppConstants.avatarSize);

  /// Sets widget to large avatar size (56.0)
  Widget avatarSizeL() =>
      sized(width: AppConstants.avatarSizeL, height: AppConstants.avatarSizeL);

  /// Sets widget to extra large avatar size (72.0)
  Widget avatarSizeXL() => sized(
    width: AppConstants.avatarSizeXL,
    height: AppConstants.avatarSizeXL,
  );

  // MARK: - Icon Size Extensions

  /// Sets icon to extra small size (12.0)
  Widget iconXS() =>
      sized(width: AppConstants.iconXS, height: AppConstants.iconXS);

  /// Sets icon to small size (16.0)
  Widget iconS() =>
      sized(width: AppConstants.iconS, height: AppConstants.iconS);

  /// Sets icon to medium size (20.0)
  Widget iconM() =>
      sized(width: AppConstants.iconM, height: AppConstants.iconM);

  /// Sets icon to large size (24.0)
  Widget iconL() =>
      sized(width: AppConstants.iconL, height: AppConstants.iconL);

  /// Sets icon to extra large size (32.0)
  Widget iconXL() =>
      sized(width: AppConstants.iconXL, height: AppConstants.iconXL);

  /// Sets icon to extra extra large size (48.0)
  Widget iconXXL() =>
      sized(width: AppConstants.iconXXL, height: AppConstants.iconXXL);

  /// Sets icon to extra extra extra large size (64.0)
  Widget iconXXXL() =>
      sized(width: AppConstants.iconXXXL, height: AppConstants.iconXXXL);

  // print befor render
  Widget print(value) {
    log(value);
    return this;
  }

  /// Adds a background color to any widget
  Widget background(Color color) {
    return Container(color: color, child: this);
  }

  /// Adds a background with decoration to any widget
  Widget backgroundDecoration(BoxDecoration decoration) {
    return Container(decoration: decoration, child: this);
  }

  /// Adds a background with gradient to any widget
  Widget backgroundGradient(Gradient gradient) {
    return Container(
      decoration: BoxDecoration(gradient: gradient),
      child: this,
    );
  }

  /// Adds a background with border radius to any widget
  Widget backgroundWithRadius(Color color, BorderRadiusGeometry radius) {
    return Container(
      decoration: BoxDecoration(color: color, borderRadius: radius),
      child: this,
    );
  }

  /// Adds a background with custom border radius to any widget
  Widget backgroundWithBorderRadius(Color color, BorderRadius borderRadius) {
    return Container(
      decoration: BoxDecoration(color: color, borderRadius: borderRadius),
      child: this,
    );
  }

  Widget animatedVisibility({
    required bool isVisible,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    return AnimatedSize(
      duration: duration,
      curve: curve,
      child: isVisible ? this : const SizedBox.shrink().fullWidth(),
    );
  }
}
