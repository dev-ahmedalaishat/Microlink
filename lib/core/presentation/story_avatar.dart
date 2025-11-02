import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class StoryAvatar extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final VoidCallback? onTap;

  const StoryAvatar({super.key, this.imageUrl, this.size = 50, this.onTap});

  @override
  Widget build(BuildContext context) {
    final content = Image.asset(
      imageUrl ?? 'assets/images/img_micropolis.png',
      fit: BoxFit.cover,
    );
    // final content = imageUrl != null && imageUrl!.isNotEmpty
    //     ? CachedNetworkImage(
    //         imageUrl: imageUrl!,
    //         fit: BoxFit.cover,
    //         placeholder: (context, url) =>
    //             const Center(child: CircularProgressIndicator(strokeWidth: 2)),
    //         errorWidget: (context, url, error) => Image.asset(
    //           'assets/images/img_micropolis.png',
    //           fit: BoxFit.cover,
    //         ),
    //       )
    //     : Image.asset('assets/images/img_micropolis.png', fit: BoxFit.cover);

    final avatar = Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange, width: 2),
      ),
      child: ClipRRect(borderRadius: BorderRadius.circular(10), child: content),
    );

    if (onTap != null) {
      return GestureDetector(onTap: onTap, child: avatar);
    }

    return avatar;
  }
}
