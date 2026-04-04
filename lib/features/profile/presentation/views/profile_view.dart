import 'package:flutter/material.dart';
import 'package:homemade_food_app/core/utilities/api_constants.dart';
import 'package:homemade_food_app/features/profile/presentation/views/widgets/profile_view_body.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    print(ApiConstants.token);
    print(ApiConstants.id);
    return const ProfileViewBody();
  }
}
