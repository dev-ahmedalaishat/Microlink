import 'package:flutter/material.dart';
import 'package:microlink/features/social/domain/repositories/social_repository.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? userId;
  // final double size;

  const ProfileAvatar({super.key, this.imageUrl, this.userId});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundImage: AssetImage(
        loggedUserId == userId
            ? 'assets/images/ahmad_avatar.jpg'
            : 'assets/images/user_avatar.png',
      ),
    );
  }
}
