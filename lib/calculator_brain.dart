import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi;

  CalculatorBrain({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);

    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25)
      return ('overweight');
    else if (_bmi > 18.5)
      return ('normal');
    else
      return ('underweight');
  }

  String getInterpretation() {
    if (_bmi >= 25)
      return ('Hmm.. looks like you should hit the gym.');
    else if (_bmi > 18.5)
      return ('You are in good shape, good job!');
    else
      return ('Try a few cheese burgers!');
  }
}
