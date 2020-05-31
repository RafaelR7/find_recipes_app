import 'package:find_recipes/ui/home/home.dart';
import 'package:find_recipes/ui/styles/styles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Styles.customTheme,
      home: Home(),
    );
  }
}
