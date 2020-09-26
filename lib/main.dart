import 'package:flutter/material.dart';
import 'package:src/pages/interests_page.dart';
import 'package:src/style.dart';
import 'package:src/theme.dart';
import 'pages/welcome_page.dart';

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
      theme: theme,
      home: startPage,
    );
  }
}
