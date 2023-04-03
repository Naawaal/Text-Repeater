import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:text_reapter/views/screens/dashboard_screens/dashboard_screen.dart';
import 'package:text_reapter/views/screens/settings_screens/setting_screen.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final List<IconData> iconList = [
    Icons.dashboard_customize_rounded,
    Icons.settings,
  ];

  var currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> screenList = [
    const DashboardScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[currentIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        iconSize: 30,
        leftCornerRadius: 30,
        rightCornerRadius: 30,
        notchSmoothness: NotchSmoothness.smoothEdge,
        activeColor: Colors.green,
        shadow: const BoxShadow(
          color: Colors.grey,
          blurRadius: 5,
          spreadRadius: 2.5,
        ),
        splashColor: Colors.green,
        gapLocation: GapLocation.center,
        icons: iconList,
        activeIndex: currentIndex,
        onTap: onTap,
      ),
    );
  }
}
