import 'package:flutter/material.dart';
import 'package:navigation_example/widgets/default_app_bar.dart';
import 'package:navigation_example/widgets/pop_all_button.dart';
import 'package:navigation_example/widgets/push_screen_button.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(),
      body: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PushScreenButton(),
            PopAllButton(),
          ],
        ),
      ),
    );
  }
}
