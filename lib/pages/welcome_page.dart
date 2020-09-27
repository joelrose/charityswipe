import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localstorage/localstorage.dart';
import 'package:src/charity_card.dart';
import 'package:src/components/button.dart';
import 'package:src/helpers/api.dart';
import 'package:src/helpers/px_spacer.dart';
import 'package:src/page_wrapper.dart';

import 'interests_page.dart';

class WelcomePage extends StatelessWidget {
  final LocalStorage storage = new LocalStorage("fund");

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
              child: SvgPicture.asset('assets/images/welcome.svg'),
            ),
            Text(
              "Welcome to Fund",
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            PxSpacer(20),
            Text(
              "Donating money to charity can be challenging. With Fund, you can easily and securely discover, choose and donate money.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Spacer(),
            FundButton(
              onPressed: () {
                API.createProfile().then((value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => InterestsPage()),
                  );
                });
              },
              buttonText: "Get Started",
            )
          ],
        ),
      ),
    );
  }
}
