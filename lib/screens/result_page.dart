import '../my_widgets/reusable_container.dart';
import 'package:flutter/material.dart';
import '../my_widgets/constants.dart';
import 'package:bmi_calculator/my_widgets//calc_button.dart';

class ResultPage extends StatelessWidget {

  final bmiNumber;
  final states;
  final feedBack;

  ResultPage({ @required this.bmiNumber, @required this.states, @required this.feedBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 20),
              child: Text('Your Result', style: kResultTextStyle,),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableContainer(
              color: activeColor,
              childContent: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(states, style: kStateTextStyle,),
                  Text(bmiNumber, style: kResultNumberStyle,),
                  Text(feedBack, style: kFeedTextStyle,),
                ],
              ),
            ),
          ),
          CalcButton(
              title: 'Go Back',
              onPress: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
