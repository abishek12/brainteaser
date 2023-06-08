import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant/my_icon.dart';
import '../providers/bottom_nav_provider.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(builder: (context, value, child) {
      return BottomNavigationBar(
        currentIndex: value.currentIndex,
        onTap: (index) => value.currentIndex = index,
        items: const [
          BottomNavigationBarItem(
            icon: MyIconOutlined.home,
            activeIcon: MyIcon.home,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: MyIconOutlined.dashboard,
            activeIcon: MyIcon.dashboard,
            label: 'Dashboard',
          ),
        ],
      );
    });
  }
}
