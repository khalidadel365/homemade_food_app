import 'package:flutter/material.dart';

import 'spiciness_list_view_item.dart';

class SpicinessListView extends StatefulWidget {
  const SpicinessListView({
    super.key,
  });

  @override
  State<SpicinessListView> createState() => _SpicinessListViewState();
}

class _SpicinessListViewState extends State<SpicinessListView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SpicinessListViewItem(
            isSelected: selectedIndex == index,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        },
        separatorBuilder: (index, context) => const SizedBox(
              height: 10,
            ),
        itemCount: 3);
  }
}
