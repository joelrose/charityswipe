import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:src/pages/interests_page.dart';
import 'package:src/pages/stack_page.dart';
import 'package:src/style.dart';
import 'package:src/theme.dart';
import 'pages/welcome_page.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  LocalStorage localStorage = LocalStorage("fund");

  @override
  Widget build(BuildContext context) {
    final profileId = localStorage.getItem("profile");
    var startPage = (profileId != null) ? StackPage() : WelcomePage();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: startPage,
    );
  }
}
