import 'package:flutter/material.dart';
import '../constants.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  RoundedIconButton({this.icon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      onPressed: onPressed,
      onLongPress: onPressed,
      fillColor: kInactiveHexColorCode,
      child: Icon(icon),
    );
  }
}
