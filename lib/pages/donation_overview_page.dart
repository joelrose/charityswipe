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
  DonationOverviewPage({Key key, this.charities}) : super(key: key);
 
  List<Charity> charities = [];
 
  @override
  _DonationOverviewPageState createState() => _DonationOverviewPageState();
}
 
class _DonationOverviewPageState extends State<DonationOverviewPage> {
  double donationAmount = 5.0;
 
  final ScrollController _scrollController = ScrollController();
 
  @override
  void initState() {
    super.initState();
 
    widget.charities = widget.charities.map((e) {
      e.donationValue = donationAmount / widget.charities.length;
      return e;
    }).toList();
  }
 
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
                                  widget.charities = widget.charities.map((e) {
                                    e.donationValue = newDonationAmount /
                                        (widget.charities.length + .0);
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
                        itemCount: widget.charities.length,
                        controller: _scrollController,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return DonationDashboardItem(
                            totalDonationValue: this.donationAmount,
                            onChange: (delta) {
                              var donationDelta =
                                  (delta / (widget.charities.length - 1));
 
                              var i = 0;
                              while ((this.totalSum() - this.donationAmount)
                                      .abs() >
                                  0.2) {
                                if (i != index) {
                                  var newValue =
                                      widget.charities[i].donationValue -
                                          donationDelta;
 
                                  if (newValue >= 0 &&
                                      newValue <= donationAmount) {
                                    setState(() {
                                      widget.charities[i].donationValue =
                                          newValue;
                                    });
                                    donationDelta =
                                        (delta / (widget.charities.length - 1));
                                  } else if (newValue < 0) {
                                    setState(() {
                                      widget.charities[i].donationValue = 0;
                                    });
                                    donationDelta += (newValue.abs() /
                                        (widget.charities.length - 1));
                                  } else {
                                    setState(() {
                                      widget.charities[i].donationValue =
                                          donationAmount;
                                    });
                                    donationDelta -=
                                        ((newValue - this.donationAmount)
                                                .abs() /
                                            (widget.charities.length - 1));
                                  }
                                }
 
                                if (!widget.charities.any((element) =>
                                    element.donationValue + donationDelta <
                                    donationAmount)) {
                                  break;
                                }
 
                                if (!widget.charities.any((element) =>
                                    element.donationValue + donationDelta >
                                    0)) {
                                  break;
                                }
 
                                // Reset or increment
                                if (i == widget.charities.length - 1) {
                                  i = 0;
                                } else {
                                  i++;
                                }
                              }
                            },
                            charity: widget.charities[index],
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
    widget.charities.forEach((element) {
      sum += element.donationValue;
    });
    return sum;
  }
}
 