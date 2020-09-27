import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/charity_card.dart';
import 'package:src/components/button.dart';
import 'package:src/components/card.dart';
import 'package:src/components/card_stack.dart';
import 'package:src/components/charity_item.dart';
import 'package:src/helpers/api.dart';
import 'package:src/helpers/px_spacer.dart';
import 'package:src/models/Charity.dart';
import 'package:src/page_wrapper.dart';

import 'interests_page.dart';

class StackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
  List<Charity> selectedCharities = [];

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text("Your Stack", style: Theme.of(context).textTheme.headline1),
              SizedBox(height: 10),
              Text(
                  "Explore some of the charities we have picked. If you like one, swipe it right, else swipe it left. You can also use the search.",
                  style: Theme.of(context).textTheme.bodyText1),
              SizedBox(height: 20),
              FundCardStack(onCharitySelected: (charity) {
                setState(() {
                  selectedCharities.add(charity);
                });
              }),
              SizedBox(height: 40),
              Text("Your favorite charities",
                  style: Theme.of(context).textTheme.headline2),
              SizedBox(height: 10),
              FundCharityItem(charity: Charity(id: 1, name: "Red Cross")),
              SizedBox(height: 10),
              FundCharityItem(charity: Charity(id: 1, name: "Unicef")),
              SizedBox(height: 10),
              FundCharityItem(
                  charity: Charity(id: 1, name: "World Health Organization")),
              SizedBox(height: 10),
              FundCharityItem(charity: Charity(id: 1, name: "WWF")),
              SizedBox(height: 10),
              FundCharityItem(charity: Charity(id: 1, name: "Share A Meal")),
              SizedBox(height: 10),
              FundCharityItem(
                  charity: Charity(id: 1, name: "Doctors Without Borders")),
              SizedBox(height: 10)
            ],
          ),
        ));
  }
}
