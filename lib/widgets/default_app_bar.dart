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
  late final StreamSubscription<List<Route>> _navigationStackSubscription;

  int _pageCount = 0;

  @override
  void initState() {
    super.initState();
    _navigationStackSubscription = NavigationBloc().stackStream.listen(_onStackUpdated);
  }

  @override
  void dispose() {
    _navigationStackSubscription.cancel();
    super.dispose();
  }

  void _onStackUpdated(List<Route> stack) {
    setState(() {
      _pageCount = stack.length;
    });
  }

  Widget _buildBackButton() {
    return BackButton(
      onPressed: () {
        NavigationBloc().popFromStack();
        Navigator.of(context).pop();
      },
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
          : const Text('Home Screen'),
    );
  }
}
