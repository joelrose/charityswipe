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
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(charity.name,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .apply(color: Style.black)),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: SvgPicture.asset('assets/images/star.svg')),
                SvgPicture.asset('assets/images/more.svg'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
