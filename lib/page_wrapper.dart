import 'package:flutter/material.dart';

class PageWrapper extends StatelessWidget {
  Widget child;

  PageWrapper({this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: child));
  }
}
