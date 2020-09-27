import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/components/button.dart';
import 'package:src/custom_textfield.dart';
import 'package:src/donation_dashboard_item.dart';
import 'package:src/models/Charity.dart';
import 'package:src/page_wrapper.dart';
import 'package:src/style.dart';

class DonationOverviewPage extends StatefulWidget {
  DonationOverviewPage({Key key}) : super(key: key);

  @override
  _DonationOverviewPageState createState() => _DonationOverviewPageState();
}

class _DonationOverviewPageState extends State<DonationOverviewPage> {
  int donationAmount = 5;

  final ScrollController _scrollController = ScrollController();

  final List<Charity> charities = [
    Charity(
        id: 1,
        name: "Save the tigers",
        description:
            "“Save tigers now” is a global campaign by World Wildlife Fund and Leonardo DiCaprio to build political, financial and public support to double the number of wild tigers by 2022, the next year of the tiger.",
        label: "WWF",
        imageUrl:
            "https://static.scientificamerican.com/sciam/cache/file/5C51E427-1715-44E6-9B14D9487D7B7F2D_source.jpg"),
    Charity(
        id: 2,
        name: "Save the tigers",
        description:
            "“Save tigers now” is a global campaign by World Wildlife Fund and Leonardo DiCaprio to build political, financial and public support to double the number of wild tigers by 2022, the next year of the tiger.",
        label: "WWF",
        imageUrl:
            "https://static.scientificamerican.com/sciam/cache/file/5C51E427-1715-44E6-9B14D9487D7B7F2D_source.jpg"),
    Charity(
        id: 2,
        name: "Save the tigers",
        description:
            "“Save tigers now” is a global campaign by World Wildlife Fund and Leonardo DiCaprio to build political, financial and public support to double the number of wild tigers by 2022, the next year of the tiger.",
        label: "WWF",
        imageUrl:
            "https://static.scientificamerican.com/sciam/cache/file/5C51E427-1715-44E6-9B14D9487D7B7F2D_source.jpg"),
    Charity(
        id: 3,
        name: "Save the tigers",
        description:
            "“Save tigers now” is a global campaign by World Wildlife Fund and Leonardo DiCaprio to build political, financial and public support to double the number of wild tigers by 2022, the next year of the tiger.",
        label: "WWF",
        imageUrl:
            "https://static.scientificamerican.com/sciam/cache/file/5C51E427-1715-44E6-9B14D9487D7B7F2D_source.jpg"),
    Charity(
        id: 4,
        name: "Save the tigers",
        description:
            "“Save tigers now” is a global campaign by World Wildlife Fund and Leonardo DiCaprio to build political, financial and public support to double the number of wild tigers by 2022, the next year of the tiger.",
        label: "WWF",
        imageUrl:
            "https://static.scientificamerican.com/sciam/cache/file/5C51E427-1715-44E6-9B14D9487D7B7F2D_source.jpg"),
    Charity(
        id: 5,
        name: "Save the tigers",
        description:
            "“Save tigers now” is a global campaign by World Wildlife Fund and Leonardo DiCaprio to build political, financial and public support to double the number of wild tigers by 2022, the next year of the tiger.",
        label: "WWF",
        imageUrl:
            "https://static.scientificamerican.com/sciam/cache/file/5C51E427-1715-44E6-9B14D9487D7B7F2D_source.jpg"),
    Charity(
        id: 6,
        name: "Save the tigers",
        description:
            "“Save tigers now” is a global campaign by World Wildlife Fund and Leonardo DiCaprio to build political, financial and public support to double the number of wild tigers by 2022, the next year of the tiger.",
        label: "WWF",
        imageUrl:
            "https://static.scientificamerican.com/sciam/cache/file/5C51E427-1715-44E6-9B14D9487D7B7F2D_source.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      padding: EdgeInsets.all(0),
      child: Stack(
        fit: StackFit.loose,
        overflow: Overflow.clip,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    child: SvgPicture.asset('assets/images/back.svg'),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Finalize Donation",
                        style: Theme.of(context).textTheme.headline1),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Donation Amount:",
                              style: Theme.of(context).textTheme.subtitle1),
                          CustomTextField(
                              onChange: (value) =>
                                  {donationAmount = int.parse(value)},
                              hintText: '20',
                              value: ''),
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
              Expanded(
                child: Scrollbar(
                  isAlwaysShown: true,
                  controller: _scrollController,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 140),
                    child: ListView.builder(
                        itemCount: charities.length,
                        controller: _scrollController,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return DonationDashboardItem(
                              onChange: (value) => {},
                              charity: charities[index],
                              donationValue: donationAmount);
                        }),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                  color: Style.grayLighter,
                  borderRadius: BorderRadius.circular(10)),
              height: 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CharitySwipeButton(
                      onPressed: () {},
                      buttonText: "Donate",
                    ),
                  ),
                  Text(
                    "By donating, you agree to our terms and conditions.\nApple takes 30% of this purchase.",
                    style: Theme.of(context).textTheme.subtitle2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
