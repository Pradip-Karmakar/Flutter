import 'package:flutter/material.dart';
import 'Screens/bmi_layout.dart';

void main() {
  runApp(BmiCalculator());
}

class BmiCalculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF000051),
        scaffoldBackgroundColor: Color(0xFF1a237e),
      ),
      home: BmiCalc(),
    );
  }
}
