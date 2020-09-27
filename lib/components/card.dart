import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/helpers/px_spacer.dart';
import 'package:src/models/Charity.dart';
import 'package:src/pages/stack_detail_page.dart';
import 'package:src/style.dart';

class FundCard extends StatelessWidget {
  FundCard({this.charity, this.disabled = false});

  final Charity charity;
  bool disabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: this.disabled ? 0.3 : 1,
        child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 30,
                  offset: Offset(0, 15),
                  color: Style.grayDarker.withAlpha(50),
                  spreadRadius: 0)
            ]),
            child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
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
                          child: AspectRatio(aspectRatio: 16/9, child: Image.network(this.charity.imageUrl, fit: BoxFit.cover)),
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
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          .apply(color: Style.white))
                                ]))
                      ]),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        StackDetailPage(charity: charity)));
                          },
                          child: Container(
                              color: Style.grayLighter,
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(charity.description,
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  PxSpacer(10),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("Learn more",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .apply(
                                                    fontWeightDelta: 2,
                                                    fontSizeDelta: -1,
                                                    color: Style.grayDarker)),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: SvgPicture.asset(
                                              'assets/images/more.svg'),
                                        )
                                      ]),
                                ],
                              )))
                    ]))));
  }
}
