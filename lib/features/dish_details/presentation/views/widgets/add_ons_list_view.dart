import 'package:flutter/material.dart';

import 'add_ons_list_view_item.dart';

class AddOnsListView extends StatefulWidget {
  const AddOnsListView({
    super.key,
  });

  @override
  State<AddOnsListView> createState() => _AddOnsListViewState();
}

class _AddOnsListViewState extends State<AddOnsListView> {
  List<int> selectedIndexes = [];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return AddOnsListViewItem(
            isSelected: selectedIndexes.contains(index),
            onTap: () {
              setState(() {
                if (selectedIndexes.contains(index)) {
                  selectedIndexes.remove(index);
                } else {
                  selectedIndexes.add(index);
                }
              });
            },
          );
        },
        separatorBuilder: (index, context) => const SizedBox(
              height: 10,
            ),
        itemCount: 5);
  }
}
