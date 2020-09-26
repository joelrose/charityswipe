import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:src/style.dart';

class CharitySwipeButton extends StatelessWidget {
  CharitySwipeButton({@required this.onPressed, @required this.buttonText});

  final String buttonText;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Style.greenLight,
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
    );
  }
}
