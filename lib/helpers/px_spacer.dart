import 'package:flutter/material.dart';

class PxSpacer extends StatelessWidget {
  PxSpacer(this.pxValue);

  final double pxValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(padding: EdgeInsets.fromLTRB(0, this.pxValue, 0, 0)));
  }
}
