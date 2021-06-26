import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Content extends StatelessWidget {
  final IconData icon;
  final String title;
  final iconColor;

  Content({this.icon,  this.iconColor, this.title,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          icon,
          size: 60,
          color: iconColor,
        ),
        SizedBox(
          height: 15,
        ),
        Text(title, style: TextStyle(color: Colors.grey),),
      ],
    );
  }
}