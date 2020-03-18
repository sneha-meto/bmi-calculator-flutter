import 'package:bmi_calculator/constants.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String result;
  final String interpretation;
  final String bmiValue;

  ResultsPage(
      {@required this.bmiValue,
      @required this.interpretation,
      @required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              'Your Result',
              style: kResultTitleTextStyle,
            ),
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                      child: Text(
                    result.toUpperCase(),
                    style: kResultTextStyle,
                  )),
                  Center(
                    child: Text(
                      bmiValue,
                      style: kResultValueTextStyle,
                    ),
                  ),
                  Text(
                    interpretation,
                    style: kResultStringTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
