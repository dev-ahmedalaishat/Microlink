import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// A wrapper widget for SvgPicture.asset to provide consistent SVG handling across the app
class AppSvgPicture extends StatelessWidget {
  final String assetPath;
  final ColorFilter? colorFilter;
  final double? width;
  final double? height;
  final BoxFit fit;
  final bool matchTextDirection;

  const AppSvgPicture({
    super.key,
    required this.assetPath,
    this.colorFilter,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.matchTextDirection = true,
  });

  /// Factory constructor for creating SVG with a color filter
  AppSvgPicture.colored({
    super.key,
    required this.assetPath,
    required Color color,
    BlendMode blendMode = BlendMode.srcIn,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.matchTextDirection = true,
  }) : colorFilter = ColorFilter.mode(color, blendMode);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      colorFilter: colorFilter,
      width: width,
      height: height,
      fit: fit,
      matchTextDirection: matchTextDirection,
    );
  }
}
