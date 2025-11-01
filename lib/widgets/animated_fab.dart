import 'package:flutter/material.dart';

class AnimatedFab extends StatefulWidget {
  final VoidCallback? onTap;

  const AnimatedFab({Key? key, this.onTap}) : super(key: key);

  @override
  State<AnimatedFab> createState() => _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab>
    with SingleTickerProviderStateMixin {
  late AnimationController _fabAnimationController;
  late Animation<double> _fabRotationAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize FAB rotation animation
    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fabRotationAnimation =
        Tween<double>(
          begin: 0.0,
          end: 0.125, // 45 degrees (45/360 = 0.125)
        ).animate(
          CurvedAnimation(
            parent: _fabAnimationController,
            curve: Curves.easeInOut,
          ),
        );
  }

  @override
  void dispose() {
    _fabAnimationController.dispose();
    super.dispose();
  }

  void _handleTap() {
    // Handle FAB tap with rotation
    if (_fabAnimationController.isCompleted) {
      _fabAnimationController.reverse();
    } else {
      _fabAnimationController.forward();
    }

    // Call the external onTap if provided
    if (widget.onTap != null) {
      widget.onTap!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: 70,
      width: 70,
      right: 0,
      child: AnimatedBuilder(
        animation: _fabRotationAnimation,
        builder: (context, child) {
          return Transform.rotate(
            angle: _fabRotationAnimation.value * 2 * 3.14159,
            child: GestureDetector(
              onTap: _handleTap,
              child: Image.asset('assets/icons/ic_fabb.png', fit: BoxFit.fill),
            ),
          );
        },
      ),
    );
  }
}
