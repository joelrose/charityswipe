import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:src/components/card.dart';
import 'package:src/components/tag.dart';
import 'package:src/helpers/api.dart';
import 'package:src/models/Charity.dart';
import 'package:src/models/Interest.dart';

// Choice Chips

class FundCardStack extends StatefulWidget {
  FundCardStack({this.onCharitySelected});

  final void Function(Charity) onCharitySelected;

  @override
  _FundCardStackState createState() => _FundCardStackState();
}

class _FundCardStackState extends State<FundCardStack> {
  List<Charity> _charities = [];
  double _rotationDegree = 0;
  Offset totalOffset = Offset(0, 0);

  @override
  void initState() {
    super.initState();

    API.getCharityStack().then((charities) {
      setState(() {
        this._charities = charities.length > 8 ? charities.sublist(0, 8) : charities;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final verticalDampening = 5;
    final horizontalDampening = 5;
    final maxRotationThreshold = 250;
    final successThreshold = 100;

    if (this._charities.length == 0) {
      return Padding(
          padding: EdgeInsets.all(20),
          child: SvgPicture.asset('assets/images/empty.svg'));
    }

    return (this._charities.length != 0)
        ? (GestureDetector(
            child: Stack(children: [
              for (var i = 0; i < this._charities.length; i++)
                i == this._charities.length - 1
                    ? Transform.translate(
                        offset: Offset(totalOffset.dx / horizontalDampening,
                            totalOffset.dy / verticalDampening),
                        child: Transform(
                            child: FundCard(charity: this._charities[i]),
                            alignment:
                                FractionalOffset.center, // set transform origin
                            transform:
                                new Matrix4.rotationZ(this._rotationDegree)))
                    : FundCard(charity: this._charities[i], disabled: true)
            ]), // rotate -10 deg
            onPanDown: (details) => {totalOffset = Offset(0, 0)},
            onPanCancel: () => {
                  setState(() {
                    _rotationDegree = 0;
                    totalOffset = Offset(0, 0);
                  })
                },
            onPanEnd: (details) {
              if (totalOffset.dx > successThreshold) {
                if (widget.onCharitySelected != null) {
                  widget.onCharitySelected(
                      this._charities[this._charities.length - 1]);
                }
              }
              setState(() {
                _rotationDegree = 0;
                if (totalOffset.dx.abs() > successThreshold) {
                  this._charities.removeLast();
                }
                totalOffset = Offset(0, 0);
              });
            },
            onPanUpdate: (details) {
              setState(() {
                this.totalOffset =
                    totalOffset.translate(details.delta.dx, details.delta.dy);
                this._rotationDegree =
                    (totalOffset.dx / maxRotationThreshold).clamp(-1, 1) * 0.2;
              });
            }))
        : Padding(
            padding: EdgeInsets.all(20),
            child: SvgPicture.asset('assets/images/empty.svg'));
  }
}
