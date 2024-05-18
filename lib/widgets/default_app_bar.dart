import 'package:flutter/material.dart';
import 'package:navigation_example/bloc/navigation_bloc.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Object>>(
      stream: NavigationBloc().stackStream,
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        final stack = snapshot.data!;
        final pageCount = stack.length;

        return AppBar(
          title: Text('$pageCount Pages'),
        );
      },
    );
  }
}
