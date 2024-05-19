import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navigation_example/bloc/navigation_bloc.dart';

class DefaultBottomNavigationBar extends StatefulWidget {
  const DefaultBottomNavigationBar({super.key});

  @override
  State<DefaultBottomNavigationBar> createState() => _DefaultBottomNavigationBarState();
}

class _DefaultBottomNavigationBarState extends State<DefaultBottomNavigationBar> {
  late final StreamSubscription<int> _currentTabSubscription;

  int _currentTab = 0;

  @override
  void initState() {
    super.initState();
    NavigationBloc().currentTabStream.listen(_onTabChanged);
  }

  @override
  void dispose() {
    _currentTabSubscription.cancel();
    super.dispose();
  }

  void _onTabChanged(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentTab,
      onTap: NavigationBloc().setCurrentTab,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.align_horizontal_left),
          label: 'test',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time),
          label: 'test',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time),
          label: 'test',
        ),
      ],
    );
  }
}
