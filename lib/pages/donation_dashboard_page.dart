import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/components/button.dart';
import 'package:src/custom_textfield.dart';
import 'package:src/donation_dashboard_item.dart';
import 'package:src/page_wrapper.dart';
import 'package:src/style.dart';

class DonationOverviewPage extends StatefulWidget {
  DonationOverviewPage({Key key}) : super(key: key);

  @override
  _DonationOverviewPageState createState() => _DonationOverviewPageState();
}

class _DonationOverviewPageState extends State<DonationOverviewPage> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: SvgPicture.asset('assets/images/back.svg'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Finalize Donation",
                    style: Theme.of(context).textTheme.headline1),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Row(
                    children: [
                      Text("Donation Amount:",
                          style: Theme.of(context).textTheme.bodyText1),
                      CustomTextField(onChange: (value) => {}, hintText: '20'),
                    ],
                  ),
                ),
                Text("Modify your donation:",
                    style: Theme.of(context).textTheme.headline2),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            child: Divider(
              color: Style.grayMedium,
              height: 10,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
          ),
          DonationDashboardItem(onChange: (value) => {}, organisation: "WWF", title: "Save the fucking whales"),
        ],
      ),
    );
    /*return PageWrapper(
      child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Finalize Donation",
                  style: Theme.of(context).textTheme.headline1),
              TextField(
                decoration: InputDecoration(labelText: "Dontation amount:"),
                keyboardType: TextInputType.number,
              ),
              Text("Modify your dontation:",
                  style: Theme.of(context).textTheme.headline1),
              ListView(children: <Widget>[
                ListTile(
                  leading: Icon(Icons.map),
                  title: Text('Map'),
                ),
              ]),
            ]),
    );*/
  }
}
