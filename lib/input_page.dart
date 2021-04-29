import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bottom_buttons.dart';
import 'gender_container.dart';
import 'container_box.dart';
import 'constant.dart';
import 'round_icon_button.dart';
import 'result_page.dart';
import 'calculation_bmi.dart';

enum genderType { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  genderType selectedGender;

  int height = 180;
  int weight = 68;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ContainerBox(
                    myOnPress: () {
                      setState(() {
                        selectedGender = genderType.Male;
                      });
                    },
                    colour: selectedGender == genderType.Male
                        ? activeBoxColor
                        : inactiveBoxColor,
                    cardChild: GenderContainer(
                        gender: FontAwesomeIcons.mars, gendername: "MALE"),
                  ),
                ),
                Expanded(
                  child: ContainerBox(
                      myOnPress: () {
                        setState(() {
                          selectedGender = genderType.Female;
                        });
                      },
                      colour: selectedGender == genderType.Female
                          ? activeBoxColor
                          : inactiveBoxColor,
                      cardChild: GenderContainer(
                          gender: FontAwesomeIcons.venus,
                          gendername: "FEMALE")),
                )
              ],
            ),
          ),
          Expanded(
            child: ContainerBox(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("HEIGHT", style: labelTextStyle),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: KNumberTextStyle),
                        Text('cm', style: labelTextStyle),
                      ]),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x1fEB1555)),
                    child: Slider(
                      value: height.toDouble(),
                      max: maxHeight.toDouble(),
                      min: minHeight.toDouble(),
                      onChanged: (double newVal) {
                        setState(() {
                          height = newVal.round();
                        });
                      },
                    ),
                  )
                ],
              ),
              colour: activeBoxColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ContainerBox(
                    colour: activeBoxColor,
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                action: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(width: 12.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              action: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ContainerBox(
                    colour: activeBoxColor,
                    cardChild: Column(
                      children: <Widget>[
                        Text('AGE', style: labelTextStyle),
                        Text(
                          age.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                action: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus),
                            SizedBox(width: 12.0),
                            RoundIconButton(
                                action: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
            text: 'CALCULATE',
            onTap: () {
              BMICalculation calc =
                  BMICalculation(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPage(
                    bmiNum: calc.calculateBmi(),
                    resu: calc.getReuslt(),
                    interpretation: calc.getInternretation());
              }));
            },
          )
        ],
      ),
    );
  }
}
