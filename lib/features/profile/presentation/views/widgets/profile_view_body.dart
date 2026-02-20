import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/core/utilities/api_constants.dart';
import 'package:homemade_food_app/core/utilities/app_router.dart';
import 'package:homemade_food_app/core/utilities/loading_view.dart';
import 'package:homemade_food_app/core/widgets/custom_button.dart';
import 'package:homemade_food_app/features/profile/presentation/profile_cubit/profile_cubit.dart';
import 'package:homemade_food_app/features/profile/presentation/profile_cubit/profile_states.dart';

import '../../../../../core/utilities/cache_helper.dart';
import '../../../../../core/utilities/functions/show_snack_bar.dart';
import '../../../../../core/utilities/styles.dart';
import 'custom_profile_button.dart';
import 'custom_profile_image.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {
        if (state is ProfileSuccess) {
          print('*******************');
          print(ApiConstants.token);
          print(ApiConstants.id);
          print(state.profileModel.userData!.accountInfo!.lastName);
        }

        if (state is ProfileFailure) {
          showSnackBar(
            context: context,
            message: state.errMessage,
            color: Colors.red,
          );
        }
      },
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const CircularProgressIndicator(color: kPrimaryColor,);
        }
        else if (state is ProfileSuccess) {
          final user = state.profileModel.userData?.accountInfo;

          return Scaffold(
            appBar: AppBar(
              title: Text('Profile', style: Styles.textStyle18),
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            body: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 25,
                  right: 25,
                  bottom: 25,
                ),
                child: Column(
                  children: [
                    CustomProfileImage(profileImage: user!.profilePicUrl??'',),
                    const SizedBox(height: 15),
                    Text(
                      '${user.firstName ?? ''} ${user.lastName ?? ''}',
                      style: Styles.textStyle18.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${user?.email ?? ''}',
                      style: Styles.textStyle14.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 15),

                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Account Settings',
                        style: Styles.textStyle14.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    CustomProfileButton(
                      icon: Icons.person,
                      title: 'Edit Profile',
                      iconSize: 22,
                      onTap: (){
                        GoRouter.of(context).push(AppRouter.kEditProfileView);
                      },
                    ),

                    const SizedBox(height: 15),

                    CustomProfileButton(
                      icon: Icons.location_on,
                      title: 'Saved Addresses',
                      iconSize: 22,
                      onTap: (){},
                    ),

                    const SizedBox(height: 15),

                    CustomProfileButton(
                      icon: Icons.lock,
                      iconSize: 20,
                      title: 'Change Password',
                      onTap: (){},
                    ),

                    const SizedBox(height: 20),

                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Support',
                        style: Styles.textStyle14.copyWith(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    CustomProfileButton(
                      icon: Icons.question_mark,
                      iconSize: 20,
                      title: 'Help & Support',
                      onTap: (){},
                    ),

                    const Spacer(),

                    CustomButton(
                      width: double.infinity,
                      elevation: 0,
                      backgroundColor: kSecondaryColor,
                      borderRadius: 15,
                      onPressed: () async {
                        await CacheHelper.removeData(key: 'token');
                        GoRouter.of(context).go(AppRouter.kLoginView);
                      },
                      icon: Icon(
                        Icons.logout,
                        color: kPrimaryColor,
                        size: 20,
                      ),
                      text: 'Logout',
                      textStyle: Styles.textStyle16.copyWith(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        else {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
      },
    );
  }

}
