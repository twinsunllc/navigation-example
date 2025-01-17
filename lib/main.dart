import 'package:flutter/material.dart';
import 'package:navigation_example/screens/navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // [MaterialApp] provides our top level [Navigator].
    return MaterialApp(
      title: 'Navigation Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).primaryColorDark,
          foregroundColor: Colors.white70,
        ),
      ),
      home: const NavigationScreen(),
    );
  }
}
