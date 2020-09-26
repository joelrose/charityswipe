import 'package:flutter/material.dart';

class OnboardingWrapper extends StatelessWidget {
  Widget body;

  OnboardingWrapper({this.body});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
        child: this.body);
  }
}
