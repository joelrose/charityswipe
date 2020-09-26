import 'package:flutter/material.dart';
import 'welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primaryColor: Color(0xff75D62A),
        buttonTheme:  ButtonThemeData(
          buttonColor: Color(0xff75D62A),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),

        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
          bodyText1: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
          button: TextStyle(fontSize: 25, color: Colors.white),
        ),      
      ),
      home: WelcomePage(),
    );
  }
}