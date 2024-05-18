import 'package:flutter/material.dart';
import 'package:navigation_example/bloc/navigation_bloc.dart';
import 'package:navigation_example/screens/next_screen.dart';
import 'package:navigation_example/widgets/default_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home'),
            ElevatedButton(
              onPressed: () {
                final route = MaterialPageRoute(builder: (_) => const NextScreen());
                NavigationBloc().pushToStack(route);
                Navigator.of(context).push(route);
              },
              child: const Text('Push Next Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
