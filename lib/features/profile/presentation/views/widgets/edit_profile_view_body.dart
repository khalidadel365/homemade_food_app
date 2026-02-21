import 'package:flutter/material.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/core/widgets/custom_button.dart';
import 'package:homemade_food_app/core/widgets/custom_textformfield.dart';
import '../../../../../core/utilities/functions/show_snack_bar.dart';
import '../../../../auth/data/models/account_info.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key, required this.user});

  final AccountInfo user;

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20.0, bottom: 80, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'First Name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              CustomTextFormField(
                controller: firstNameController,
                hintText: widget.user.firstName,
                hintTextStyle: TextStyle(
                    color: Colors.grey
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Last Name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              CustomTextFormField(
                controller: lastNameController,
                hintText: widget.user.lastName,
                hintTextStyle: TextStyle(
                    color: Colors.grey
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Phone Number',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              CustomTextFormField(
                controller: phoneController,
                hintText: widget.user.phone,
                hintTextStyle: TextStyle(
                  color: Colors.grey
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Email Address',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              CustomTextFormField(
                controller: emailController,
                hintText: widget.user.email,
                hintTextStyle: TextStyle(
                    color: Colors.grey
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                width: double.infinity,
                text: 'Save Changes',
                backgroundColor: kPrimaryColor,
                borderRadius: 10,
                onPressed: () {
                  Map<String, dynamic> updatedData = {};
                  if (firstNameController.text != widget.user.firstName) {
                    updatedData["first_name"] = firstNameController.text;
                  }
                  if (lastNameController.text != widget.user.lastName) {
                    updatedData["last_name"] = lastNameController.text;
                  }

                  if (phoneController.text != widget.user.phone) {
                    updatedData["phone_number"] = phoneController.text;
                  }
                  if (updatedData.isNotEmpty) {
                    // BlocProvider.of<ProfileCubit>(context).editProfile(
                    //   token: ApiConstants.token,
                    //   id: ApiConstants.id,
                    //   updatedData: updatedData,
                    // );
                  } else {
                    showSnackBar(
                        color: Colors.red,
                        context: context,
                        message: "No changes made");
                  }
                },
                textStyle: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
