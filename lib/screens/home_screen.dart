import 'package:flutter/material.dart';
import 'package:navigation_example/widgets/default_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(),
      body: Center(
        child: Text('Hello'),
      ),
    );
  }
}
