import 'package:flutter/material.dart';
import 'package:navigation_example/bloc/navigation_bloc.dart';
import 'package:navigation_example/widgets/push_screen_button.dart';

class TabOne extends StatelessWidget {
  const TabOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: NavigationBloc().tabNavigatorKeys[0],
      onGenerateRoute: (_) {
        return MaterialPageRoute(
          builder: (_) {
            return const Padding(
              padding: EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PushScreenButton(),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
