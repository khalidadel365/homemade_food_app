import 'package:flutter/material.dart';
import '../../../../../core/utilities/styles.dart';
import 'custom_profile_image.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: Styles.textStyle18,),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomProfileImage(),
            ],
          ),
        ),
      )
    );
  }
}


