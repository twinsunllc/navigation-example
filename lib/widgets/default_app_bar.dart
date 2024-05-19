import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navigation_example/bloc/navigation_bloc.dart';

class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  State<DefaultAppBar> createState() => _DefaultAppBarState();
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  late final StreamSubscription<int> _currentTabSubscription;
  late final StreamSubscription<Map<int, List<Route>>> _navigationStackSubscription;

  int _currentTab = 0;
  int _pageCount = 0;

  @override
  void initState() {
    super.initState();
    _currentTabSubscription = NavigationBloc().currentTabStream.listen(_onTabChanged);
    _navigationStackSubscription = NavigationBloc().tabStacksStream.listen(_onStackUpdated);
  }

  @override
  void dispose() {
    _currentTabSubscription.cancel();
    _navigationStackSubscription.cancel();
    super.dispose();
  }

  void _onTabChanged(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  void _onStackUpdated(Map<int, List<Route>> stacks) {
    final tab = NavigationBloc().currentTab;
    setState(() {
      _pageCount = stacks[tab]?.length ?? 0;
    });
  }

  Widget _buildBackButton() {
    return BackButton(
      onPressed: NavigationBloc().popFromStack,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _pageCount > 0 //
          ? _buildBackButton()
          : null,
      title: _pageCount > 0 //
          ? Text('Screen $_pageCount')
          : Text('Tab ${_currentTab + 1}'),
    );
  }
}
