import 'package:flutter/material.dart';
import 'package:src/interests_page.dart';
import 'welcome_page.dart';

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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(body: SafeArea(child: startPage)),
    );
  }
}
