import 'package:flutter/material.dart';

class CharitySwipeText extends StatelessWidget {
  CharitySwipeText({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(this.text);
  }
}
