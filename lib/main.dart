import 'package:flutter/material.dart';
import 'package:receipe/screens/home_screeen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receipe App',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

