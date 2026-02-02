import 'package:flutter/material.dart';
import 'package:homemade_food_app/features/home/data/models/dish_model.dart';
import 'package:homemade_food_app/features/home/presentation/views/widgets/fresh_nearby_details_bottom_nav_bar.dart';
import 'package:homemade_food_app/features/home/presentation/views/widgets/fresh_nearby_details_view_body.dart';

class FreshNearbyDetailsView extends StatelessWidget {
  const FreshNearbyDetailsView({super.key, required this.dishModel});
  final DishModel dishModel ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body:  FreshNearbyDetailsViewBody(
        dishModel: dishModel,
      ),
      bottomNavigationBar: FreshNearbyDetailsBottomNavBar(),
    ));
  }
}


