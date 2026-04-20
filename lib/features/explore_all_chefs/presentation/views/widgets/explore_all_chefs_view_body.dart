import 'package:flutter/material.dart';
import 'package:homemade_food_app/core/utilities/styles.dart';

import 'explore_all_chefs_list_view.dart';

class ExploreAllChefsViewBody extends StatelessWidget {
  const ExploreAllChefsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 17),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Top Rated Chefs',
          style: Styles.textStyle25,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Local masters cooking for your family.',
          style: Styles.textStyle15.copyWith(color: Colors.grey[500]),
        ),
        const SizedBox(
          height: 20,
        ),
        ExploreAllChefsListView()
      ]),
    );
  }
}


