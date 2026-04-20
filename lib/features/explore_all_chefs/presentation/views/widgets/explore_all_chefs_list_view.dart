import 'package:flutter/material.dart';

import 'explore_all_chefs_list_view_item.dart';

class ExploreAllChefsListView extends StatelessWidget {
  const ExploreAllChefsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          padding: EdgeInsets.all(0),
          itemBuilder: (context, index) {
            return ExploreAllChefsListViewItem();
          },
          separatorBuilder: (context, index) => const SizedBox(
            height: 8,
          ),
          itemCount: 10),
    );
  }
}
