import 'package:bmi_calculator/Screens/result_page.dart';
import 'package:bmi_calculator/bmi_calculations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/reused_card_box.dart';
import '../Components/box_content.dart';
import '../constants.dart';
import '../Components/bottom_button.dart';
import '../Components/rounded_icon_button.dart';

enum GenderType {
  Male,
  Female,
}

class BmiCalc extends StatefulWidget {
  @override
  _BmiCalcState createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {
  GenderType selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardBox(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.Male;
                      });
                    },
                    color: selectedGender == GenderType.Male
                        ? kActiveHexColorCode
                        : kInactiveHexColorCode,
                    childData: BoxContentTop(
                      title: 'MALE',
                      font: FontAwesomeIcons.male,
                    ),
                  ),
                ),
                Expanded(
                  child: CardBox(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.Female;
                      });
                    },
                    color: selectedGender == GenderType.Female
                        ? kActiveHexColorCode
                        : kInactiveHexColorCode,
                    childData: BoxContentTop(
                      title: 'FEMALE',
                      font: FontAwesomeIcons.female,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardBox(
              color: kActiveHexColorCode,
              childData: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kWeightedText,
                      ),
                      Text(
                        'CM',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFFfff3e0),
                      thumbColor: kBottomContainerColor,
                      overlayColor: Color(0x29ff6f00),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 25.0),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 12.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 225.0,
                      inactiveColor: Color(0xFF373737),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardBox(
                    color: kActiveHexColorCode,
                    childData: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kWeightedText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight > 20) weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (weight < 150) weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CardBox(
                    color: kActiveHexColorCode,
                    childData: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kWeightedText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (age > 1) age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (age < 100) age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              BmiCalculation bCalc =
                  BmiCalculation(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: bCalc.calculateBmi(),
                    resultText: bCalc.getResult(),
                    bmiAdvice: bCalc.getAdvice(),
                  ),
                ),
              );
            },
            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
