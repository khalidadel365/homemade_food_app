import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_food_app/core/utilities/api_constants.dart';
import 'package:homemade_food_app/features/profile/data/repo/profile_repo_imp.dart';
import 'package:homemade_food_app/features/profile/presentation/profile_cubit/profile_cubit.dart';
import 'package:homemade_food_app/features/profile/presentation/views/widgets/profile_view_body.dart';

import '../../../../core/utilities/service_locator.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    print(ApiConstants.token);
    print(ApiConstants.id);
    return BlocProvider(
      create: (context)=>ProfileCubit(getIt.get<ProfileRepoImp>())..fetchProfile(
          token: ApiConstants.token!,
          id: ApiConstants.id!),
        child: const ProfileViewBody());
  }
}
