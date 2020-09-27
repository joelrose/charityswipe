import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/charity_card.dart';
import 'package:src/components/button.dart';
import 'package:src/components/card.dart';
import 'package:src/components/card_stack.dart';
import 'package:src/helpers/api.dart';
import 'package:src/helpers/px_spacer.dart';
import 'package:src/page_wrapper.dart';

import 'interests_page.dart';

class StackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Your Stack", style: Theme.of(context).textTheme.headline1),
            PxSpacer(10),
            CharitySwipeCardStack(),
            Spacer(),
          ],
        ));
  }
}
