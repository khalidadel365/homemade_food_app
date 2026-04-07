import 'package:flutter/material.dart';

import 'featured_dish_list_view_item.dart';

class FeaturedDishListView extends StatelessWidget {
  const FeaturedDishListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.32,
      child: ListView.separated(
        itemBuilder: (context, index) => FeaturedDishListViewItem(),
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
