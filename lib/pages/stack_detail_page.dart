import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:src/components/button.dart';
import 'package:src/models/Charity.dart';
import 'package:src/page_wrapper.dart';
import 'package:src/style.dart';

class StackDetailPage extends StatefulWidget {
  final Charity charity;

  StackDetailPage({@required this.charity});

  @override
  _StackDetailPageState createState() => _StackDetailPageState();
}

class _StackDetailPageState extends State<StackDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          Stack(children: [
            ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withAlpha(220)],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.srcATop,
              child: Image.network(widget.charity.imageUrl),
            ),
            Positioned(
                bottom: 20,
                left: 20,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.charity.label,
                          style: Theme.of(context).textTheme.bodyText1.apply(
                              color: Style.greenLight, fontWeightDelta: 2)),
                      SizedBox(height: 5),
                      Text(widget.charity.name,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              .apply(color: Style.white))
                    ])),
            Positioned(
                right: 20,
                top: 20,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset('assets/images/close.svg'))),
          ]),
          Padding(
            padding: EdgeInsets.all(30),
            child: Text(widget.charity.description,
                style: Theme.of(context).textTheme.bodyText1),
          ),
          FundButton(
            onPressed: () {},
            buttonText: "Visit Website",
          )
        ],
      ),
    );
  }
}
