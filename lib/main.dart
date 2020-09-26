import 'package:flutter/material.dart';
import 'package:src/interests_page.dart';
import 'welcome_page.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var startPage = true ? WelcomePage() : InterestsPage();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff75D62A),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xff75D62A),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        textTheme: TextTheme(
          headline1: GoogleFonts.inter(
              textStyle: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          bodyText1: GoogleFonts.inter(
              textStyle:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
          button: GoogleFonts.inter(
              textStyle: TextStyle(fontSize: 25, color: Colors.white)),
        ),
      ),
      
      home: startPage,
    );
  }
}
