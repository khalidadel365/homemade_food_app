import 'package:flutter/material.dart';
import 'package:homemade_food_app/features/profile/presentation/views/widgets/edit_profile_view_body.dart';

import '../../../auth/data/models/account_info.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key,required this.user});
  final AccountInfo user ;
  @override
  Widget build(BuildContext context) {
    return EditProfileViewBody(
      user: user,
    );
  }
}
