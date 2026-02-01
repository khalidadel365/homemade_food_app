import 'package:flutter/material.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/core/widgets/custom_button.dart';

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
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
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
                  height: 20,
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
                  height: 15,
                ),
                CustomButton(
                    backgroundColor: kSecondaryColor,
                    borderRadius: 20,
                    onPressed: (){},
                  icon: Icon(
                      Icons.logout,
                    color: kPrimaryColor,
                    size: 20,
                  ),
                text: 'Logout',
                textStyle: Styles.textStyle16.copyWith(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold
                ),)
              ],
            ),
          ),
        ));
  }
}
