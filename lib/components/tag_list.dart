import 'package:flutter/material.dart';
import 'package:src/components/tag.dart';
import 'package:src/helpers/api.dart';
import 'package:src/models/Interest.dart';

// Choice Chips

class CharitySwipeTagList extends StatefulWidget {
  @override
  _CharitySwipeTagListState createState() => _CharitySwipeTagListState();
}

class _CharitySwipeTagListState extends State<CharitySwipeTagList> {
  List<Interest> _interests = [];
  Map<int, bool> _selection = {};

  @override
  void initState() {
    super.initState();

    API.getInterests().then((value) {
      setState(() {
        _interests = value;
        _selection = Map.fromIterable(value,
            key: (element) => element.id, value: (element) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      for (var value in _interests)
        CharitySwipeTag(
            onPressed: () {
              setState(() {
                _selection[value.id] = !_selection[value.id];
              });
            },
            isSelected: _selection[value.id],
            text: value.name)
    ]);
  }
}
