import 'package:flutter/material.dart';
import 'package:navigation_example/bloc/navigation_bloc.dart';

class PopAllButton extends StatelessWidget {
  const PopAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: NavigationBloc().clearStack,
      child: const Text('Pop All Screens'),
    );
  }
}
