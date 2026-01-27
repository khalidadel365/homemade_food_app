import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/core/widgets/custom_textformfield.dart';
import 'package:homemade_food_app/features/home/presentation/views/widgets/fresh_nearby_list_view.dart';

import '../../../../../core/utilities/app_router.dart';
import '../../../../../core/utilities/styles.dart';
import 'categories_list_view.dart';
import 'custom_home_appbar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHomeAppbar(searchController: searchController),
            const SizedBox(
              height: 15,
            ),
            const CategoriesListView(),
            const SizedBox(
              height: 18,
            ),
            Row(children: [
              Text('Fresh Nearby', style: Styles.textStyle20),
              const SizedBox(width: 3.5),
              const Icon(
                FontAwesomeIcons.mapPin,
                color: Colors.red,
                size: 18,
              )
            ]),
            const SizedBox(
              height: 18,
            ),
            const FreshNearbyListView(),
          ],
        ),
      ),
    );
  }
}


