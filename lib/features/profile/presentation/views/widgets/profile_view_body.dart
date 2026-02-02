import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/core/utilities/api_constants.dart';
import 'package:homemade_food_app/core/utilities/app_router.dart';
import 'package:homemade_food_app/core/widgets/custom_button.dart';

import '../../../../../core/utilities/cache_helper.dart';
import '../../../../../core/utilities/styles.dart';
import 'custom_profile_button.dart';
import 'custom_profile_image.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: Styles.textStyle18,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 25,right: 25,bottom:25 ),
            child: Column(
              children: [
                CustomProfileImage(),
                const SizedBox(
                  height: 15,
                ),
                Text('Jane Doe',
                    style: Styles.textStyle18
                        .copyWith(fontWeight: FontWeight.bold)),
                Text(
                  'jane.doe@example.com',
                  style: Styles.textStyle14.copyWith(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Account Settings',
                    style: Styles.textStyle14.copyWith(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomProfileButton(
                  icon: Icons.person,
                  title: 'Edit Profile',
                  iconSize: 22,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomProfileButton(
                  icon: Icons.location_on,
                  title: 'Saved Addresses',
                  iconSize: 22,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomProfileButton(
                    icon: Icons.lock, iconSize: 20, title: 'Change Password'),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Support',
                    style: Styles.textStyle14.copyWith(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomProfileButton(
                    icon: Icons.question_mark,
                    iconSize: 20,
                    title: 'Help & Support'),
                const Spacer(),
                CustomButton(
                  width: double.infinity,
                    elevation: 0,
                    backgroundColor: kSecondaryColor,
                    borderRadius: 15,
                    onPressed: ()async{
                      //AuthCubit.get(context).signOut();
                      await CacheHelper.removeData(key: 'token');
                      ApiConstants.token = null;
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
                  fontWeight: FontWeight.bold
                ),),


              ],
            ),
          ),
        ));
  }
}
