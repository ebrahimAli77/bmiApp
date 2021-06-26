import 'package:flutter/material.dart';

class MyFloatingButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  MyFloatingButton({@required this.icon, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      shape: CircleBorder(),
      fillColor: Colors.white,
      child: Icon(
        icon,
        color: ThemeData.dark().primaryColor,
      ),
      constraints: BoxConstraints(minWidth: 50, minHeight: 50),
    );
  }
}