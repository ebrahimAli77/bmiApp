import 'screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'my_widgets/reusable_container.dart';
import 'my_widgets/content.dart';
import 'my_widgets/gender.dart';
import 'my_widgets/constants.dart';
import 'my_widgets/my_floating_button.dart';
import 'my_widgets/calc_button.dart';
import 'calculation_brain.dart';


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color maleButton = Color(0xff303030);
  // Color femaleButton = Color(0xff303030);

  Gender selectedGender;

  int height = 180;
  int weight = 60;
  int age = 20;

  // void activeButton(int selected) {
  //   setState(() {
  //     selected == 2 ? femaleButton = activeColor : maleButton = inActiveColor;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI Calculator',
          ),
        ),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableContainer(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                          maleIconColor = activeIconColor;
                          femaleIconColor = inActiveIconColor;
                        });
                      },
                      color: selectedGender == Gender.male
                          ? activeColor
                          : inActiveColor,
                      childContent: Content(
                        icon: FontAwesomeIcons.mars,
                        iconColor: maleIconColor,
                        title: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableContainer(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                          femaleIconColor = activeIconColor;
                          maleIconColor = inActiveIconColor;
                        });
                      },
                      color: selectedGender == Gender.female
                          ? activeColor
                          : inActiveColor,
                      childContent: Content(
                        icon: (FontAwesomeIcons.venus),
                        iconColor: femaleIconColor,
                        title: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableContainer(
                      color: activeColor,
                      childContent: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'HEIGHT',
                            style: labelText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                height.toString(),
                                style: kNumTextStyle,
                              ),
                              Text(
                                'cm',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.grey.shade500,
                              overlayColor: Color(0x1f3bba9c),
                              thumbColor: ThemeData.dark().accentColor,
                              trackHeight: 1,
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 15,
                              ),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 25),
                              // thumbShape:  ,
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              onChanged: (newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              },
                              min: 110,
                              max: 230,
                              // activeColor: ThemeData.dark().accentColor,
                              // inactiveColor: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  // Weight
                  Expanded(
                    child: ReusableContainer(
                      color: activeColor,
                      childContent: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: labelText,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumTextStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyFloatingButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MyFloatingButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  // Age
                  Expanded(
                    child: ReusableContainer(
                      color: activeColor,
                      childContent: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: labelText,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            age.toString(),
                            style: kNumTextStyle,),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyFloatingButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(
                                width: 10,
                              ),
                              MyFloatingButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: () {
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CalcButton(
                title: 'CALCULATE',
                onPress: () {
                  CalculationBrain calc =
                      CalculationBrain(height: height, weight: weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                          bmiNumber: calc.bmiCalc(),
                        states: calc.bmiState(),
                        feedBack: calc.feedBack(),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
