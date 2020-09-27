import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localstorage/localstorage.dart';
import 'package:src/components/button.dart';
import 'package:src/components/tag_list.dart';
import 'package:src/helpers/api.dart';
import 'package:src/helpers/px_spacer.dart';
import 'package:src/models/Interest.dart';
import 'package:src/page_wrapper.dart';
import 'package:src/pages/stack_page.dart';

class InterestsPage extends StatefulWidget {
  InterestsPage({Key key}) : super(key: key);

  @override
  _InterestsPageState createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  final LocalStorage storage = LocalStorage("fund");
  List<Interest> _interestSelection = [];

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
                padding: EdgeInsets.all(20.0),
                child: SvgPicture.asset('assets/images/window.svg'),
              ),
              Text("Choose your interests",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1),
              PxSpacer(20),
              Text(
                "Donating money to charity can be challenging. With Fund, you can easily and securely discover, choose and donate money.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              PxSpacer(20),
              FundTagList(onSelectionChanged: (value) {
                setState(() {
                  this._interestSelection = value;
                });
              }),
              Spacer(),
              FundButton(
                buttonText: "Complete",
                onPressed: () {
                  final profileId = storage.getItem("profile");
                  API.setInterests(profileId, this._interestSelection);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => StackPage()));
                },
              )
            ],
          ),
        ));
  }
}
