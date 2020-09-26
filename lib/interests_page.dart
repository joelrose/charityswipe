import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/onboarding_wrapper.dart';
import 'package:src/page_wrapper.dart';

class InterestsPage extends StatefulWidget {
  InterestsPage({Key key}) : super(key: key);

  @override
  _InterestsPageState createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
        child: OnboardingWrapper(
            body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(20.0),
            child: SvgPicture.asset('assets/images/window.svg'),
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
          Spacer(),
          new RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child:
                      Text('Next', style: Theme.of(context).textTheme.button)),
              color: Colors.green),
        ],
      ),
    )));
  }
}
