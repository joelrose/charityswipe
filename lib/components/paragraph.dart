import 'package:flutter/material.dart';

class FundText extends StatelessWidget {
  FundText({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(this.text);
  }
}
