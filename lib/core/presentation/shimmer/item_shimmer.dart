import 'package:flutter/material.dart';
import 'package:microlink/core/theme/spacing.dart';

class ItemShimmer extends StatelessWidget {
  final double height;
  final double width;
  final double borderRadius;
  const ItemShimmer({
    super.key,
    required this.height,
    this.width = double.infinity,
    this.borderRadius = AppSpacing.radiusSmall,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
