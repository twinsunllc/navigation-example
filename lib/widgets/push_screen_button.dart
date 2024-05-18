import 'package:flutter/material.dart';
import 'package:navigation_example/bloc/navigation_bloc.dart';
import 'package:navigation_example/screens/next_screen.dart';

class PushScreenButton extends StatelessWidget {
  const PushScreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final route = MaterialPageRoute(builder: (_) => const NextScreen());
        NavigationBloc().pushToStack(route);
        Navigator.of(context).push(route);
      },
      child: const Text('Push Next Screen'),
    );
  }
}
