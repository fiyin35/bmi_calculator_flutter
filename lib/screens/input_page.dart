import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reuseable_card.dart';
import '../constant.dart';
import 'result_page.dart';
import '../components/bottom_button.dart';
import '../components/round_button.dart';
import 'package:bmi_calculator_flutter/calculator_brain.dart';

//enum
enum Gender {
  male,
  female
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {


  Gender selectedGender;
  int height = 180;
  int weight = 20;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //first row
          Expanded(
            child: Row(
              children: [
                //Male icon
                Expanded(
                  child: ReuseAbleCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male ? kActiveCardColor: kInactiveCardColor,
                    cardChild: IconContent(cardText: 'Male', cardIcon: FontAwesomeIcons.mars), //mars
                  ),
                ),
                //female icon
                Expanded(
                child: ReuseAbleCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female ? kActiveCardColor: kInactiveCardColor,
                    cardChild: IconContent(cardText: 'Female', cardIcon: FontAwesomeIcons.venus),
                )
                )
              ],
            )),

          //second row (middle expanded widget)
          Expanded(
            child: ReuseAbleCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(height.toString(), style: kBigTextStyle),
                        Text('cm')
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 212,
                        onChanged: (double newValue){
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

          //third row (expanded widget)
          Expanded(
              child: Row(
                children: [

                  Expanded(
                      child: ReuseAbleCard(
                          colour: kActiveCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('WEIGHT', style: kLabelTextStyle),
                              Text(weight.toString(), style: kBigTextStyle,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });}),
                                ],
                              ),
                            ],
                          ),
                      ),
                  ),

                  Expanded(
                    child: ReuseAbleCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE', style: kLabelTextStyle),
                          Text(age.toString(), style: kBigTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  )
                ],
              )),
          BottomButton(
            buttonText: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);

              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                bmiResult: calc.CalculateBMI(),
                bmiText: calc.getResult(),
                bmiInterpretation: calc.getInterpretation(),
              )));
            },
          ),
        ],
      ),
    );
  }
}






