import 'package:flutter/material.dart';
import '../constants.dart';

class BoxContentTop extends StatelessWidget {
  const BoxContentTop({@required this.title, this.font});
  final String title;
  final IconData font;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          font,
          size: kTextSize,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          title,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
