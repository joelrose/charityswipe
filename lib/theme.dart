import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:src/style.dart';

final theme = ThemeData(
  primaryColor: Color(0xff75D62A),
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xff75D62A),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
  ),
  textTheme: TextTheme(
    headline1: GoogleFonts.inter(
        textStyle: TextStyle(
            fontSize: Style.fontTitle,
            fontWeight: FontWeight.bold,
            color: Colors.black)),
    bodyText1: GoogleFonts.inter(
        textStyle: TextStyle(
            height: 1.4,
            color: Style.grayDark,
            fontSize: Style.fontNormal,
            fontWeight: FontWeight.normal)),
  ),
);
