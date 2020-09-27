import 'package:flutter/material.dart';
import 'package:src/helpers/px_spacer.dart';
import 'package:src/models/Charity.dart';
import 'package:src/style.dart';

class CharitySwipeCard extends StatelessWidget {
  CharitySwipeCard(this.charity);

  final Charity charity;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 30,
              offset: Offset(0, 15),
              color: Style.grayDarker.withAlpha(50),
              spreadRadius: 0)
        ]),
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            clipBehavior: Clip.antiAlias,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(children: [
                    ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withAlpha(220)
                          ],
                        ).createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                      },
                      blendMode: BlendMode.srcATop,
                      child: Image.network(this.charity.imageUrl),
                    ),
                    Positioned(
                        bottom: 20,
                        left: 20,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(charity.label,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .apply(
                                          color: Style.greenLight,
                                          fontWeightDelta: 2)),
                              SizedBox(height: 5),
                              Text(charity.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .apply(color: Style.white))
                            ]))
                  ]),
                  Container(
                      color: Style.grayLighter,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(charity.description,
                              style: Theme.of(context).textTheme.bodyText1),
                          PxSpacer(10),
                          Text("Tap to learn more",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .apply(
                                      fontWeightDelta: 2,
                                      fontSizeDelta: -1,
                                      color: Style.grayDarker))
                        ],
                      ))
                ])));
  }
}
