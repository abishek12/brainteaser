import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bottom_nav_provider.dart';
import '../utils/screen_list.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/custom_drawer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(builder: (context, value, child) {
      return Scaffold(
        appBar: customAppBar(
          title: screenList[value.currentIndex]['title'],
        ),
        drawer: const CustomDrawer(),
        body: screenList[value.currentIndex]['screen'],
        bottomNavigationBar: const CustomBottomNav(),
      );
    });
  }
}
