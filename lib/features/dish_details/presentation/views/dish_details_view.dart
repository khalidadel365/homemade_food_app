import 'package:flutter/material.dart';
import 'package:homemade_food_app/features/dish_details/presentation/views/widgets/dish_details_view_body.dart';
import 'package:homemade_food_app/features/dish_details/presentation/views/widgets/fresh_nearby_details_bottom_nav_bar.dart';

import '../../../../core/models/dish_model.dart';

class FreshNearbyDetailsView extends StatelessWidget {
  const FreshNearbyDetailsView({super.key, required this.dishModel});

  final DishModel dishModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DishDetailsViewBody(
          dishModel: dishModel,
        ),
        bottomNavigationBar: FreshNearbyDetailsBottomNavBar(),
      ),
    );
  }
}
