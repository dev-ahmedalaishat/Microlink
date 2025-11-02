import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIconButton extends StatelessWidget {
  final String assetPath;
  final Color? tintColor;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final double? size;

  const SvgIconButton({
    super.key,
    required this.assetPath,
    this.tintColor,
    this.onPressed,
    this.padding,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: padding,
      icon: SvgPicture.asset(
        assetPath,
        width: size,
        height: size,
        colorFilter: tintColor != null
            ? ColorFilter.mode(tintColor!, BlendMode.srcIn)
            : null,
      ),
      onPressed: onPressed ?? () {},
    );
  }
}
