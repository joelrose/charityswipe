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
  double donationAmount = 5.0;

  final ScrollController _scrollController = ScrollController();

  _DonationOverviewPageState() {
    this.charities = this.charities.map((e) {
      e.donationValue = donationAmount / this.charities.length;
      return e;
    }).toList();
  }

  List<Charity> charities = [
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
                              onChange: (value) {
                                double newDonationAmount =
                                    double.tryParse(value);
                                if (newDonationAmount == null) {
                                  newDonationAmount = 0;
                                }

                                setState(() {
                                  donationAmount = newDonationAmount;
                                  charities = charities.map((e) {
                                    e.donationValue = newDonationAmount /
                                        (charities.length + .0);
                                    return e;
                                  }).toList();
                                });
                              },
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
                            totalDonationValue: this.donationAmount,
                            onChange: (delta) {
                              var donationDelta =
                                  (delta / (this.charities.length - 1));

                              var i = 0;
                              while ((this.totalSum() - this.donationAmount)
                                      .abs() >
                                  0.2) {
                                if (i != index) {
                                  var newValue =
                                      this.charities[i].donationValue -
                                          donationDelta;

                                  if (newValue >= 0 &&
                                      newValue <= donationAmount) {
                                    setState(() {
                                      this.charities[i].donationValue =
                                          newValue;
                                    });
                                    donationDelta =
                                        (delta / (this.charities.length - 1));
                                  } else if (newValue < 0) {
                                    setState(() {
                                      this.charities[i].donationValue = 0;
                                    });
                                    donationDelta += (newValue.abs() /
                                        (this.charities.length - 1));
                                  } else {
                                    setState(() {
                                      this.charities[i].donationValue =
                                          donationAmount;
                                    });
                                    donationDelta -=
                                        ((newValue - this.donationAmount)
                                                .abs() /
                                            (this.charities.length - 1));
                                  }
                                }

                                if (!this.charities.any((element) =>
                                    element.donationValue + donationDelta <
                                    donationAmount)) {
                                  break;
                                }

                                if (!this.charities.any((element) =>
                                    element.donationValue + donationDelta >
                                    0)) {
                                  break;
                                }

                                // Reset or increment
                                if (i == this.charities.length - 1) {
                                  i = 0;
                                } else {
                                  i++;
                                }
                              }
                            },
                            charity: charities[index],
                          );
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
                    child: FundButton(
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

  String _doubleToString(double value) {
    return ((value * 100).round() / 100).toString();
  }

  double totalSum() {
    double sum = 0;
    this.charities.forEach((element) {
      sum += element.donationValue;
    });
    return sum;
  }
}
