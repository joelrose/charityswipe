import 'package:flutter/material.dart';

class OnboardingWrapper extends StatelessWidget {
  Widget body;

  OnboardingWrapper({this.body});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 40.0),
        child: this.body);
  }
}
