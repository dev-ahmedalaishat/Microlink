import 'dart:math';

import 'package:flutter/material.dart';
import 'package:microlink/core/extensions/widget_extensions.dart';
import 'package:microlink/core/presentation/shimmer/item_shimmer.dart';
import 'package:microlink/core/presentation/shimmer/shimmer_wrapper.dart';
import 'package:microlink/core/presentation/spacing_widgets.dart';
import 'package:microlink/core/theme/spacing.dart';

class CommentsShimmer extends StatelessWidget {
  final int count;

  const CommentsShimmer({super.key, this.count = 4});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpacerV.l,
          ...List.generate(
            count,
            (index) => _buildCommentShimmerItem(context, index),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentShimmerItem(BuildContext context, int index) {
    return ShimmerWrapper(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar shimmer
          _buildAvatarShimmer(),
          SpacerH.s,
          // Content shimmer
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Author name
              _buildTextShimmer(
                height: 16,
                width: 120 + (Random().nextDouble() * 50),
              ),
              SpacerV.xs,
              // Unit details (optional line)
              _buildTextShimmer(
                height: 14,
                width:
                    50 +
                    (Random().nextDouble() * 50), // Random width between 50-100
              ),
              SpacerV.s,
              // Comment content (multiple lines)
              _buildTextShimmer(height: 16, width: double.infinity),
              SpacerV.xs,
              _buildTextShimmer(
                height: 16,
                width:
                    MediaQuery.of(context).size.width *
                    (0.4 + Random().nextDouble() * 0.3),
              ),
            ],
          ).expanded(),
        ],
      ),
    ).screenPadding().paddingOnly(bottom: AppSpacing.lg);
  }

  Widget _buildTextShimmer({required double height, required double width}) {
    return ItemShimmer(height: height, width: width);
  }

  Widget _buildAvatarShimmer() {
    return ItemShimmer(
      height: 40,
      width: 40,
      borderRadius: AppSpacing.radiusCircular,
    );
  }
}
