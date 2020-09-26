import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/charity_card.dart';
import 'package:src/components/button.dart';
import 'package:src/onboarding_wrapper.dart';
import 'package:src/page_wrapper.dart';

import 'interests_page.dart';

class WelcomePage extends StatelessWidget {
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
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
              child: SvgPicture.asset('assets/images/welcome.svg'),
            ),
            new Text(
              "Welcome to CharitySwipe",
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            new Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: new Text(
                "Donating money to charity can be challenging. With CharitySwipe, you can easily and securely discover, choose and donate money.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Spacer(),
            new CharitySwipeButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InterestsPage()),
                );
              },
              buttonText: "Get Started",
            )
          ],
        ),
      ),
    ));
  }
}