import 'package:flutter/material.dart';
import '../constants.dart';
import '../Components/reused_card_box.dart';
import '../Components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.bmiAdvice});

  final String bmiResult;
  final String resultText;
  final String bmiAdvice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Result',
                style: kWeightedText,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CardBox(
              color: kInactiveHexColorCode,
              childData: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultText,
                  ),
                  Text(
                    bmiResult,
                    style: kResultNumber,
                  ),
                  Text(
                    bmiAdvice,
                    textAlign: TextAlign.center,
                    style: kLabelTextStyle,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            onTap: () {
              Navigator.pop(context);
            },
            buttonTitle: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
