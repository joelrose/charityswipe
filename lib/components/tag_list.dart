import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:src/components/tag.dart';
import 'package:src/helpers/api.dart';
import 'package:src/models/Interest.dart';

// Choice Chips

class FundTagList extends StatefulWidget {
  @override
  _FundTagListState createState() => _FundTagListState();

  FundTagList({this.onSelectionChanged});
  final void Function(List<Interest>) onSelectionChanged;
}

class _FundTagListState extends State<FundTagList> {
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
                  FundTag(
                      onPressed: () {
                        setState(() {
                          _selection[value.id] = !_selection[value.id];
                          widget.onSelectionChanged(_interests
                              .where((element) => _selection[element.id])
                              .toList());
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
