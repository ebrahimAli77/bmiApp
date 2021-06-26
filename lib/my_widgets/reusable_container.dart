import 'package:flutter/material.dart';
import 'content.dart';

class ReusableContainer extends StatelessWidget {
  final Color color;
  final Widget childContent;
  final Function onPress;

  ReusableContainer({@required this.color, @required this.childContent, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          alignment: Alignment.center,
          // height: double.infinity,
          // width: double.infinity,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: childContent,
        ),
      ),
    );
  }
}