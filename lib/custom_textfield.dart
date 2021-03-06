import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef StringToVoidFunc = void Function(String);

class CustomTextField extends StatelessWidget {
  CustomTextField({@required this.onChange, @required this.hintText, @required this.value, this.disabled});
  final StringToVoidFunc onChange;
  final String hintText;
  final bool disabled;
  String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: 70,
      child: TextField(
        decoration: InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gapPadding: 2.0,
          ),
          hintText: this.value + '',
          contentPadding: EdgeInsets.all(2.0),
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText2,
        onChanged: onChange,
        enabled: !((this.disabled) ?? false),
      ),
    );
  }
}
