import 'package:flutter/material.dart';
import 'package:flutter_calculator/app/presentation/screens/simple_calculator/simple_calculator_page.dart';

class FlutterCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      debugShowCheckedModeBanner: false,
      home: SimpleCalculatorPage(),
    );
  }
}
