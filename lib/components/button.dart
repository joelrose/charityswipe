import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:src/style.dart';

class FundButton extends StatelessWidget {
  FundButton({@required this.onPressed, @required this.buttonText});

  final String buttonText;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        autofocus: false,
        clipBehavior: Clip.none,
        splashColor: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 13.5, 20, 13.5),
          child: Text(
            buttonText,
            style: TextStyle(
                color: Style.white,
                fontSize: Style.fontNormal,
                fontFamily: "Inter",
                fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Style.greenLight,
          boxShadow: [
            BoxShadow(
                color: Style.greenLight.withAlpha(65),
                blurRadius: 10,
                offset: Offset(0, 5),
                spreadRadius: 0)
          ]),
    );
  }
}
