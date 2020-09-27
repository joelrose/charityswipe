import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:src/custom_textfield.dart';
import 'package:src/models/Charity.dart';
import 'package:src/style.dart';

typedef StringToVoidFunc = void Function(String);

class DonationDashboardItem extends StatefulWidget {
  final StringToVoidFunc onChange;
  final Charity charity;
  int donationValue;

  DonationDashboardItem(
      {Key key,
      @required this.onChange,
      @required this.charity,
      @required this.donationValue})
      : super(key: key);

  @override
  _DonationDashboardItemState createState() => _DonationDashboardItemState();
}

class _DonationDashboardItemState extends State<DonationDashboardItem> {
  double _currentSliderValue = 10;

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
                  value: _currentSliderValue.round().toString(),
                  disabled: true),
            ],
          ),
        ),
        Slider(
          value: (_currentSliderValue > widget.donationValue.toDouble()) ? 
            widget.donationValue.toDouble() // TO DO
           : _currentSliderValue,
          min: 0,
          max: widget.donationValue.toDouble(),
          divisions: widget.donationValue,
          label: 'Amount' + _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
          activeColor: Style.greenLight,
        )
      ],
    );
  }
}
