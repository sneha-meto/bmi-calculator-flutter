import 'package:flutter/material.dart';
import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPress});

  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        elevation: 0.0,
        child: Icon(icon),
        onPressed: onPress,
        fillColor: kRoundButtonColor,
        constraints: BoxConstraints.tightFor(height: 56.0, width: 56.0),
        shape: CircleBorder());
  }
}
