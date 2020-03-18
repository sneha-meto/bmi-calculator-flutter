import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final Function onTap;

  const BottomButton({this.buttonTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          buttonTitle,
          style: kLargeButtonTextStyle,
        )),
        margin: EdgeInsets.only(top: 10.0),
        color: kBottomContainerColor,
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}
