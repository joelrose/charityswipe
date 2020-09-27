import 'package:flutter/material.dart';
import 'package:src/style.dart';

class CharitySwipeTag extends StatelessWidget {
  CharitySwipeTag(
      {@required this.text, @required this.onPressed, this.isSelected = false});

  final GestureTapCallback onPressed;
  final String text;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor =
        this.isSelected ? Style.greenLight.withAlpha(10) : Colors.transparent;
    Color borderColor = this.isSelected ? Style.greenLight : Style.grayMedium;
    Color textColor = this.isSelected ? Style.greenDark : Style.grayDarker;

    return GestureDetector(
        onTap: this.onPressed,
        child: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 12, 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
                border: Border.all(color: borderColor),
                color: backgroundColor),
            child: Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(this.text, style: TextStyle(color: textColor)))));
  }
}
