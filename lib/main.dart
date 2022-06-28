import 'package:flutter/material.dart';
import 'package:flutter_tip_calculator/screens/home_screen.dart';
import 'package:flutter_tip_calculator/utils/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tip Calculator',
      theme: ThemeData(
        primaryColor: kPurpleColor,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
