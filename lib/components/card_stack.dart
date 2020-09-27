import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:src/components/card.dart';
import 'package:src/components/tag.dart';
import 'package:src/helpers/api.dart';
import 'package:src/models/Charity.dart';
import 'package:src/models/Interest.dart';

// Choice Chips

class CharitySwipeCardStack extends StatefulWidget {
  @override
  _CharitySwipeCardStackState createState() => _CharitySwipeCardStackState();
}

class _CharitySwipeCardStackState extends State<CharitySwipeCardStack> {
  List<Charity> _charities = [];
  double _rotationDegree = 0;
  Offset totalOffset = Offset(0, 0);

  @override
  void initState() {
    super.initState();

    API.getCharityStack().then((charities) {
      setState(() {
        this._charities = charities;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Transform.translate(
            offset: Offset(totalOffset.dx / 5, totalOffset.dy / 5),
            child: Transform(
                child: Stack(children: [
                  for (var charity in this._charities) CharitySwipeCard(charity)
                ]),
                alignment: FractionalOffset.center, // set transform origin
                transform: new Matrix4.rotationZ(
                    this._rotationDegree))), // rotate -10 deg
        onPanDown: (details) => {totalOffset = Offset(0, 0)},
        onPanUpdate: (details) {
          setState(() {
            this.totalOffset =
                totalOffset.translate(details.delta.dx, details.delta.dy);
            this._rotationDegree =
                (totalOffset.dx / 250).clamp(-1, 1) * 0.174533;
          });
          print(totalOffset);
        });
  }
}
