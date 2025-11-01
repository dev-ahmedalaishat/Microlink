import 'dart:math';

import 'package:flutter/material.dart';
import 'package:microlink/core/extensions/widget_extensions.dart';
import 'package:microlink/core/presentation/shimmer/item_shimmer.dart';
import 'package:microlink/core/presentation/shimmer/shimmer_wrapper.dart';
import 'package:microlink/core/presentation/spacing_widgets.dart';
import 'package:microlink/core/theme/spacing.dart';

class PostsShimmer extends StatelessWidget {
  final int count;

  const PostsShimmer({super.key, this.count = 5});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpacerV.l,
          ...List.generate(
            count,
            (index) => _buildPostShimmerItem(context, index),
          ),
        ],
      ),
    );
  }

  Widget _buildPostShimmerItem(BuildContext context, int index) {
    return ShimmerWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Author info row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar shimmer
              _buildAvatarShimmer(),
              SpacerH.s,
              // Author details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Author name
                  _buildTextShimmer(
                    height: 16,
                    width: 100 + (Random().nextDouble() * 60),
                  ),
                  SpacerV.xs,
                  // Timestamp
                  _buildTextShimmer(
                    height: 12,
                    width: 60 + (Random().nextDouble() * 40),
                  ),
                ],
              ).expanded(),
            ],
          ),
          SpacerV.m,
          // Post content preview (2-3 lines)
          _buildTextShimmer(height: 16, width: double.infinity),
          SpacerV.xs,
          _buildTextShimmer(
            height: 16,
            width:
                MediaQuery.of(context).size.width *
                (0.5 + Random().nextDouble() * 0.4),
          ),
          SpacerV.m,
          // Post image placeholder (randomly show image)
          if (Random().nextBool()) _buildImageShimmer(context),
          SpacerV.m,
          _buildActionButtonShimmer(),
        ],
      ),
    ).screenPadding().paddingOnly(bottom: AppSpacing.xl);
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

  Widget _buildImageShimmer(BuildContext context) {
    return ItemShimmer(
      height: 200,
      width: double.infinity,
      borderRadius: AppSpacing.postImageRadius,
    );
  }

  Widget _buildActionButtonShimmer() {
    return
    // Action buttons row
    Row(
      children: [
        _buildTextShimmer(height: 20, width: 40),
        SpacerH.m,
        _buildTextShimmer(height: 20, width: 40),
        SpacerH.m,
        // Share button
        _buildTextShimmer(height: 20, width: 30),
      ],
    );
  }
}
