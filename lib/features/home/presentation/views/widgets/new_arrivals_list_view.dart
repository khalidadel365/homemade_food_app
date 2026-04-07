import 'package:flutter/material.dart';
import 'package:homemade_food_app/core/models/dish_model.dart';

import 'new_arrivals_list_view_item.dart';

class NewArrivalsListView extends StatelessWidget {
  const NewArrivalsListView({
    super.key, required this.dishes,
  });
  final List<DishModel> dishes;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => NewArrivalsListViewItem(
          dish: dishes[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 13,
        ),
        itemCount: dishes.length);
  }
}