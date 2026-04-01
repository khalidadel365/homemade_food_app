import 'package:flutter/material.dart';
import '../models/dish_model.dart';
import 'all_dishes_list_view_item.dart';

class AllDishesListView extends StatelessWidget {
  const AllDishesListView({super.key, required this.dishes});

  final List<DishModel> dishes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => AllDishesListViewItem(
        dishModel: dishes[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: dishes.length,
    );
  }
}
