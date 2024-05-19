import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navigation_example/bloc/navigation_bloc.dart';
import 'package:navigation_example/tabs/tab_one.dart';
import 'package:navigation_example/tabs/tab_three.dart';
import 'package:navigation_example/tabs/tab_two.dart';
import 'package:navigation_example/widgets/default_app_bar.dart';
import 'package:navigation_example/widgets/default_bottom_navigation_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> with SingleTickerProviderStateMixin {
  late final StreamSubscription<int> _currentTabSubscription;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _currentTabSubscription = NavigationBloc().currentTabStream.listen(_setCurrentTab);
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _currentTabSubscription.cancel();
    _tabController.dispose();
    super.dispose();
  }

  void _setCurrentTab(int index) {
    _tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      bottomNavigationBar: const DefaultBottomNavigationBar(),
      body: TabBarView(
        controller: _tabController,
        children: const [
          TabOne(),
          TabTwo(),
          TabThree(),
        ],
      ),
    );
  }
}
