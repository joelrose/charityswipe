import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:src/models/Charity.dart';
import 'package:src/style.dart';

class FundCharityItem extends StatelessWidget {
  FundCharityItem({@required this.charity, this.onPressed});

  final Charity charity;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Style.grayLighter, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(charity.name),
            SvgPicture.asset("assets/images/chevron-right.svg")
          ],
        ),
      ),
    );
  }
}
