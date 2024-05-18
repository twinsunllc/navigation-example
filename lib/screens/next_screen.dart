import 'package:flutter/material.dart';
import 'package:navigation_example/widgets/default_app_bar.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(),
      body: Center(
        child: Text('Next Screen'),
      ),
    );
  }
}