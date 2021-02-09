import 'package:bmi_calculator_flutter/constant.dart';
import 'file:///C:/Users/DELL/AndroidStudioProjects/bmi_calculator_flutter/lib/components/reuseable_card.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator_flutter/calculator_brain.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String bmiText;
  final String bmiInterpretation;

  ResultPage({this.bmiResult,this.bmiText,this.bmiInterpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Text('Your Result',
                style: kTitleTextStyle,
              textAlign: TextAlign.center,),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseAbleCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(bmiText.toUpperCase(), style: kResultTextStyle,),
                  Text(bmiResult, style: kBMITextStyle,),
                  Text(bmiInterpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,)
                ],
              ),
            ),
          ),
          BottomButton(
            buttonText: 'RE-CALCULATE',
          onTap: () {
            Navigator.pop(context);
          },),
        ],
      )
    );
  }
}
