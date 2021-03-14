import 'package:flutter/material.dart';
import 'dart:math';

class BmiCalculation {
  final int height;
  final int weight;
  double _bmi;
  BmiCalculation({this.height, this.weight});

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25)
      return 'Overweight';
    else if (_bmi >= 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getAdvice() {
    if (_bmi >= 25)
      return 'Wow wow you eat too much, Try to exercise more.';
    else if (_bmi >= 18.5)
      return 'You are perfect with your body, Good Job';
    else
      return 'You have low BMI Rate, Try to consume more healthy and good food';
  }
}
