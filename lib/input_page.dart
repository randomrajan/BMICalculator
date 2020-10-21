import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusabale_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'round_icon_button.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI Calculator')),
        ),
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch;
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActivecardcolour
                          : kInactivecardcolour,
                      cardchild: IconContent(
                          icon: FontAwesomeIcons.mars, label: 'MALE'),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActivecardcolour
                          : kInactivecardcolour,
                      cardchild: IconContent(
                          icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kActivecardcolour,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('HEIGHT', style: kLabeltextstyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabeltextstyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor: Color(0xFF8D8E98),
                              activeTrackColor: Colors.white,
                              thumbColor: Color(0xFFEB1555),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0)),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              //print(newValue);
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
              ],
            )),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT', style: kLabeltextstyle),
                          Text(weight.toString(), style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                pressme: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                pressme: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                      colour: kActivecardcolour,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActivecardcolour,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('AGE', style: kLabeltextstyle),
                          Text(age.toString(), style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                pressme: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                pressme: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              )
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
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ),
                );
              },
              buttonTitle: 'CALCULATE',
            ),
          ],
        ));
  }
}
