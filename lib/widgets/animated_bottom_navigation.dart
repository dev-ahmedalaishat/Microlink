import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedBottomNavigation extends StatelessWidget {
  final int currentPage;
  final Function(int) onPageChanged;
  final TabController? tabController;

  const AnimatedBottomNavigation({
    super.key,
    required this.currentPage,
    required this.onPageChanged,
    this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      dividerColor: Colors.transparent,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      indicatorColor: Colors.transparent,
      onTap: (index) {
        // Prevent tapping on the fourth tab (index 3)
        if (index == 3) {
          return;
        }
        onPageChanged(index);
      },
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Colors.black, width: 3),
        insets: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      ),
      tabs: [
        SizedBox(
          height: 70,
          width: 70,
          child: Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: currentPage == 0 ? 1.0 : 0.5,
              child: SvgPicture.asset('assets/icons/ic_map.svg'),
            ),
          ),
        ),
        SizedBox(
          height: 70,
          width: 70,
          child: Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: currentPage == 1 ? 1.0 : 0.5,
              child: SvgPicture.asset('assets/icons/ic_people.svg'),
            ),
          ),
        ),
        SizedBox(
          height: 70,
          width: 70,
          child: Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: currentPage == 2 ? 1.0 : 0.5,
              child: SvgPicture.asset('assets/icons/ic_folder.svg'),
            ),
          ),
        ),
        // Fourth tab - disabled but takes space
        IgnorePointer(
          child: SizedBox(
            height: 70,
            width: 70,
            child: Center(
              child: Icon(
                Icons.favorite,
                color: Colors.transparent, // Make it invisible
              ),
            ),
          ),
        ),
      ],
    );
  }
}
