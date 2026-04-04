import 'package:flutter/material.dart';
import 'package:homemade_food_app/features/profile/presentation/views/widgets/chef_profile_view_body.dart';

class ChefProfileView extends StatelessWidget {
  const ChefProfileView({super.key, required this.chefId});

  final int chefId;

  @override
  Widget build(BuildContext context) {
    return ChefProfileViewBody(
      chefId: chefId,
    );
  }
}
