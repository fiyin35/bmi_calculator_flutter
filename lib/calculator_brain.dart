import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi = 0;


  CalculatorBrain({this.weight, this.height});

  String CalculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if(_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if(_bmi >= 25 ) {
      return 'You have a weight above the normal range, You need to exercise more';
    } else if (_bmi >= 18.5) {
      return 'You have a normal weight, Good job keep it up';
    } else {
      return 'You have a lesser weight, You might want to eat more';
    }
  }


}