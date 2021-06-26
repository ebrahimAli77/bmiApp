import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {

  final title;
  final onPress;

  CalcButton({@required this.title,@required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.all(0),
        color: ThemeData.dark().accentColor,
        child: Text(title, style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400, color: ThemeData.dark().primaryColor),),),
    );
  }
}