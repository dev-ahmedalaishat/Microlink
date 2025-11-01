import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:microlink/core/presentation/empty_state_widget.dart';
import 'package:microlink/core/theme/spacing.dart';
import 'package:microlink/features/social/presentation/pages/social_main_page.dart';
import 'package:microlink/navigation/navigation_controller.dart';
import 'package:microlink/widgets/animated_bottom_navigation.dart';
import 'package:microlink/widgets/animated_fab.dart';

class AppRouterV2 extends StatefulWidget {
  const AppRouterV2({super.key});

  @override
  State<AppRouterV2> createState() => _AppRouterV2State();
}

class _AppRouterV2State extends State<AppRouterV2>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  @override
  void initState() {
    currentPage = 1;
    tabController = TabController(
      length: 4,
      initialIndex: 1,
      vsync: this,
    ); // Back to 4 tabs
    tabController.animation?.addListener(() {
      final value = tabController.animation!.value.round();
      if (value != currentPage && mounted && value != 3) {
        // Prevent navigation to tab 3 (fourth tab)
        changePage(value);
      }
    });

    super.initState();
  }

  void changePage(int newPage) {
    // Use navigation controller to validate page
    if (!NavigationController.isValidPageIndex(newPage)) {
      return;
    }
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomBar(
      borderRadius: BorderRadius.circular(AppSpacing.radiusCircular),
      curve: Curves.decelerate,
      width: 280,
      barColor: Colors.white,
      barDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSpacing.radiusCircular),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(64),
            blurRadius: 8,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          AnimatedBottomNavigation(
            currentPage: currentPage,
            onPageChanged: changePage,
            tabController: tabController,
          ),
          AnimatedFab(
            onTap: () {
              print("Custom FAB tapped!");
            },
          ),
        ],
      ),
      body: (context, controller) => TabBarView(
        controller: tabController,
        dragStartBehavior: DragStartBehavior.down,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildComingSoonPage('assets/images/ill_no_map.png'),
          SocialMainPage(),
          _buildComingSoonPage('assets/images/ill_no_folder.png'),
          _buildComingSoonPage('assets/images/ill_no_folder.png'),
        ],
      ),
    );
  }

  Widget _buildComingSoonPage(String imagePath) {
    return Scaffold(
      body: ComingSoonWidget(
        title: 'Coming Soon', // optional
        description:
            'This feature is under development\nand will be available soon.', // optional
        imagePath: imagePath, // optional
        imageSize: 200.0, // optional
      ),
    );
  }
}
