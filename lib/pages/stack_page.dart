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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text("Your Stack", style: Theme.of(context).textTheme.headline1),
              SizedBox(height: 20),
              CharitySwipeCardStack(onCharitySelected: (charity) {
                setState(() {
                  selectedCharities.add(charity);
                });
              }),
              SizedBox(height: 40),
              Text("Your favorite charities",
                  style: Theme.of(context).textTheme.headline2),
              SizedBox(height: 10),
              CharitySwipeCharityItem(charity: Charity(id: 1, name: "Toast")),
              CharitySwipeCharityItem(charity: Charity(id: 1, name: "Toast")),
              CharitySwipeCharityItem(charity: Charity(id: 1, name: "Toast")),
              CharitySwipeCharityItem(charity: Charity(id: 1, name: "Toast")),
              CharitySwipeCharityItem(charity: Charity(id: 1, name: "Toast")),
              CharitySwipeCharityItem(charity: Charity(id: 1, name: "Toast")),
              CharitySwipeCharityItem(charity: Charity(id: 1, name: "Toast")),
              CharitySwipeCharityItem(charity: Charity(id: 1, name: "Toast")),
              CharitySwipeCharityItem(charity: Charity(id: 1, name: "Toast")),
              Positioned(
                  bottom: 20,
                  child: CharitySwipeButton(
                      onPressed: () {},
                      buttonText: (this.selectedCharities.length.toString()) +
                          " charities selected")),
            ],
          ),
        ));
  }
}
