import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:src/custom_textfield.dart';
import 'package:src/models/Charity.dart';
import 'package:src/style.dart';

typedef StringToVoidFunc = void Function(String);

class DonationDashboardItem extends StatefulWidget {
  final void Function(double) onChange;
  final Charity charity;
  double totalDonationValue;

  DonationDashboardItem(
      {Key key,
      @required this.onChange,
      @required this.charity,
      @required this.totalDonationValue})
      : super(key: key);

  @override
  _DonationDashboardItemState createState() => _DonationDashboardItemState();
}

class _DonationDashboardItemState extends State<DonationDashboardItem> {
  double changeStartValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.charity.label),
                  Text(widget.charity.name,
                      style: Theme.of(context).textTheme.headline2)
                ],
              ),
              CustomTextField(
                  onChange: (value) => {
                        setState(() {
                          //_value = double.parse(value);
                        })
                      },
                  hintText: '',
                  value: this._doubleToString(widget.charity.donationValue),
                  disabled: true),
            ],
          ),
        ),
        Slider(
          value:
              widget.charity.donationValue.clamp(0, widget.totalDonationValue),
          min: 0,
          max: widget.totalDonationValue,
          divisions: (widget.totalDonationValue * 100).round(),
          label: 'Amount' +
              (widget.charity.donationValue * 100).round().toString(),
          onChangeStart: (value) => {
            setState(() {
              changeStartValue = value;
            })
          },
          onChanged: (double value) {
            setState(() {
              widget.charity.donationValue = value;
            });
          },
          onChangeEnd: (double value) {
            setState(() {
              double delta = value - changeStartValue;
              widget.onChange(delta);
              widget.charity.donationValue = value;
            });
          },
          activeColor: Style.greenLight,
        )
      ],
    );
  }

  String _doubleToString(double value) {
    return ((value * 100).round() / 100).toString();
  }
}
