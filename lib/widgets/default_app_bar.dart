import 'package:flutter/material.dart';
import 'package:navigation_example/bloc/navigation_bloc.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  Widget _buildBackButton(BuildContext context) {
    return BackButton(
      onPressed: () {
        NavigationBloc().popFromStack();
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Object>>(
      stream: NavigationBloc().stackStream,
      initialData: const [],
      builder: (_, AsyncSnapshot snapshot) {
        final stack = snapshot.data!;
        final pageCount = stack.length;

        return AppBar(
          leading: pageCount > 0 //
              ? _buildBackButton(context)
              : null,
          title: pageCount > 0 //
              ? Text('Screen $pageCount')
              : const Text('Home Screen'),
        );
      },
    );
  }
}
