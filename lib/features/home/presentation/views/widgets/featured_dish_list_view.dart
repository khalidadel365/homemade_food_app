import 'package:flutter/material.dart';
import 'package:homemade_food_app/core/models/dish_model.dart';

import 'featured_dish_list_view_item.dart';

class FeaturedDishListView extends StatelessWidget {
  const FeaturedDishListView({
    super.key,
    required this.dishes,
  });

  final List<DishModel> dishes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.32,
      child: ListView.separated(
        itemBuilder: (context, index) => FeaturedDishListViewItem(
          dish: dishes[index],
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
