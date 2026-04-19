import 'package:flutter/material.dart';
import 'package:homemade_food_app/core/models/cheif_model.dart';
import 'package:homemade_food_app/features/home/presentation/views/widgets/top_chefs_list_view_item.dart';

class TopChefsListView extends StatelessWidget {
  const TopChefsListView({
    super.key,
    required this.chefs,
  });
  final List<ChefModel> chefs;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: ListView.separated(
        itemBuilder: (context, index) =>
            TopChefsListViewItem(chefModel: chefs[index]),
        separatorBuilder: (context, index) => SizedBox(
          width: 18,
        ),
        itemCount: 5,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
