import 'package:flutter/material.dart';

class PageWrapper extends StatelessWidget {
  Widget child;

  PageWrapper({this.child, this.padding});
  EdgeInsets padding = EdgeInsets.all(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            SafeArea(child: Padding(padding: this.padding, child: this.child)));
  }
}
