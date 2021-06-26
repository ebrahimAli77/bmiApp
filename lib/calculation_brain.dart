import 'dart:math';

import 'package:flutter/material.dart';

class CalculationBrain {

  int height;
  int weight;
  double _bmi=0;

  CalculationBrain({@required this.height, @required this.weight});

  String bmiCalc (){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String bmiState (){
    if(_bmi >= 25){
      return 'Over Weight';
    }else if (_bmi > 18.5){
      return 'Normal';
    }else
      return 'Under Weight';
  }

  String feedBack (){
    if(_bmi >= 25){
      return 'You should Exercise more often';
    }else if (_bmi > 18.5){
      return '''Good job .. try to keep it that way 
                (also workout)''';
    }else
      return 'Try eating more !';
  }
}