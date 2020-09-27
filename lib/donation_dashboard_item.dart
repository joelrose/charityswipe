import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:src/custom_textfield.dart';
import 'package:src/style.dart';

typedef StringToVoidFunc = void Function(String);

class DonationDashboardItem extends StatefulWidget {
  final StringToVoidFunc onChange;
  final String title;
  final String organisation;

  double _currentSliderValue = 10;
  double _value = 20;

  DonationDashboardItem({Key key, @required this.onChange, @required this.title,@required this.organisation}) : super(key: key);

  @override
  _DonationDashboardItemState createState() => _DonationDashboardItemState();
}

class _DonationDashboardItemState extends State<DonationDashboardItem> {
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
                  Text(widget.organisation),
                  Text(widget.title,
                      style: Theme.of(context).textTheme.headline2)
                ],
              ),
              CustomTextField(onChange: (value) => { }, hintText: '', value: widget._value.toString()),
            ],
          ),
        ),
        Slider(
          value: widget._currentSliderValue,
          min: 1,
          max: 100,
          divisions: widget._currentSliderValue.round(),
          label: 'Amount' + widget._currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              widget._currentSliderValue = value;
              widget._value = value;
            });
          },
          activeColor: Style.greenLight,
        )
      ],
    );
  }
}
