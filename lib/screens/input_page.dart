import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import '../components/gender_card.dart';
import '../components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType gender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          //cross stretch if needed
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          gender = GenderType.male;
                        });
                      },
                      cardChild: GenderCard(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                      colour: gender == GenderType.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                    ),
                  ),
                  Expanded(
                      child: ReusableCard(
                    onPress: () {
                      setState(() {
                        gender = GenderType.female;
                      });
                    },
                    cardChild: GenderCard(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    colour: gender == GenderType.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ))
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberValueTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: kSliderInactiveColor,
                          thumbColor: kBottomContainerColor,
                          activeTrackColor: Colors.white,
                          overlayColor: Color(0x29EB1555),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberValueTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      colour: kActiveCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberValueTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      colour: kActiveCardColor,
                    ),
                  )
                ],
              ),
            ),
            BottomButton(
                buttonTitle: 'CALCULATE',
                onTap: () {
                  CalculatorBrain calc =
                      CalculatorBrain(height: height, weight: weight);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsPage(
                          bmiValue: calc.calculateBMI(),
                          interpretation: calc.getInterpretation(),
                          result: calc.getResult(),
                        ),
                      ));
                }),
          ],
        ));
  }
}
