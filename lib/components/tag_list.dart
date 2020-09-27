import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    final partitions = this.partitionedInterests();

    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            for (var partition in partitions)
              Row(children: [
                for (var value in partition)
                  CharitySwipeTag(
                      onPressed: () {
                        setState(() {
                          _selection[value.id] = !_selection[value.id];
                        });
                      },
                      isSelected: _selection[value.id],
                      text: value.name)
              ])
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ));
  }

  List<List<Interest>> partitionedInterests() {
    final partitionCount = 4;
    List<List<Interest>> partitionedInterests = [];

    for (var i = 0; i < this._interests.length; i++) {
      int currentPartition = i % partitionCount;
      if (!partitionedInterests.asMap().containsKey(currentPartition)) {
        partitionedInterests.add([]);
      }

      partitionedInterests[currentPartition].add(this._interests[i]);
    }

    return partitionedInterests;
  }
}
