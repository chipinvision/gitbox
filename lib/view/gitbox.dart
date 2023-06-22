import 'package:flutter/material.dart';
import 'package:gitbox/utils/appcolors.dart';
import 'package:gitbox/view/homeview.dart';
import 'package:gitbox/view/trendingview.dart';

class GitBox extends StatefulWidget {
  const GitBox({super.key});

  @override
  State<GitBox> createState() => _GitBoxState();
}

class _GitBoxState extends State<GitBox> {
  int selected = 0;

  List views = const [
    HomeView(),
    TrendingView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          selected == 0 ?'GitBox' : 'Trending',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ),
      body: views[selected],
      bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              selected = index;
            });
          },
          selectedIndex: selected,
          backgroundColor: AppColors.bgColor,
          indicatorColor: AppColors.primary,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.search, color: AppColors.primary,),
              selectedIcon: Icon(Icons.search, color: AppColors.bgColor,),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Icon(Icons.whatshot, color: AppColors.primary,),
              selectedIcon: Icon(Icons.whatshot, color: AppColors.bgColor,),
              label: 'Trending',
            ),
          ]),
    );
  }
}
