import 'package:flutter/material.dart';
import 'package:microlink/core/presentation/profile_avatar.dart';
import 'package:microlink/features/social/domain/repositories/social_repository.dart';
import '../../../../core/presentation/spacing_widgets.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/text_styles.dart';

class AddStoryWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String? userImageUrl;

  const AddStoryWidget({super.key, this.onTap, this.userImageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: AppSpacing.md),
        width: 90,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Avatar with add button
            Stack(
              children: [
                // User avatar
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                    image: userImageUrl != null
                        ? DecorationImage(
                            image: NetworkImage(userImageUrl!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: userImageUrl == null
                      ? ProfileAvatar(userId: loggedUserId)
                      : null,
                ),
                // Add button
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(
                        0xFFD97D54,
                      ), // Orange color from design
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
            SpacerV.xs,
            Text(
              'Your story',
              style: AppTextStyles.caption.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
