import 'package:flutter/material.dart';

class CardBox extends StatelessWidget {
  CardBox({@required this.color, this.childData, this.onPress});

  final Color color;
  final Widget childData;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childData,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
      ),
    );
  }
}
