import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/charity_card.dart';
import 'package:src/components/button.dart';
import 'package:src/components/card.dart';
import 'package:src/components/card_stack.dart';
import 'package:src/components/charity_item.dart';
import 'package:src/donation_dashboard_item.dart';
import 'package:src/helpers/api.dart';
import 'package:src/helpers/px_spacer.dart';
import 'package:src/models/Charity.dart';
import 'package:src/page_wrapper.dart';
import 'package:src/pages/donation_overview_page.dart';
import 'package:src/style.dart';

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
        child: Stack(children: [
          SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                          child: SvgPicture.asset('assets/images/man.svg'),
                        )),
                    GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                          child: SvgPicture.asset('assets/images/search.svg'),
                        )),
                  ],
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Text("Your Stack",
                      style: Theme.of(context).textTheme.headline1),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                          child: SvgPicture.asset('assets/images/appstore.svg'),
                        )),
                  )
                ]),
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
                Text("Favorites",
                    style: Theme.of(context).textTheme.headline3),
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
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 30, right: 60),
                    child: (selectedCharities.length != 0)
                        ? (FundButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DonationOverviewPage()));
                            },
                            buttonText: selectedCharities.length.toString() +
                                " charities selected",
                          ))
                        : SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
