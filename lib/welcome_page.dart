import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(20.0),
              child: SvgPicture.asset('assets/images/welcome.svg'),
            ),
            new Text(
              "Welcome to CharitySwipe",
              style: new TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            new Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: new Text(
                "Donating money to charity can be challenging. With CharitySwipe, you can easily and securely discover, choose and donate money.",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            new RaisedButton(
              onPressed: () {},
              child: Text('Get Started',
                  style: TextStyle(
                    fontSize: 20,
                  )),
              color: Colors.greenAccent,
            ),
          ],
        ),
      ),
    );
  }
}
