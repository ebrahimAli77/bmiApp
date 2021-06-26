import 'input_page.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xff2e3047),
        // primaryColor: Color(0xff363638),
          accentColor: Color(0xff3bba9c),
          scaffoldBackgroundColor: Color(0xff2e3047),
        // textTheme: ,
      ),
      home: InputPage(),
    );
  }
}





