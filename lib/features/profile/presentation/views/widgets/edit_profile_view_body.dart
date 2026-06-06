import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/core/widgets/custom_button.dart';
import 'package:homemade_food_app/core/widgets/custom_textformfield.dart';
import '../../../../../core/models/account_info.dart';
import '../../../../../core/utilities/api_constants.dart';
import '../../../../../core/utilities/functions/show_snack_bar.dart';
import '../../manager/cubit/profile_cubit.dart';
import '../../manager/states/profile_states.dart';

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
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          showSnackBar(
            color: Colors.green,
            context: context,
            message: "Profile updated successfully",
          );
          GoRouter.of(context).pop();
        } else if (state is EditProfileFailure) {
          showSnackBar(
            color: Colors.red,
            context: context,
            message: state.errMessage,
          );
        }
      },
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Edit Profile'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              bottom: 80,
              right: 20,
              left: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'First Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CustomTextFormField(
                    controller: firstNameController,
                    hintText: widget.user.firstName,
                    hintTextStyle: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Last Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CustomTextFormField(
                    controller: lastNameController,
                    hintText: widget.user.lastName,
                    hintTextStyle: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Phone Number',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CustomTextFormField(
                    controller: phoneController,
                    hintText: widget.user.phone,
                    hintTextStyle: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Email Address',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: widget.user.email,
                    hintTextStyle: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 30),
                  state is EditProfileLoading
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          width: double.infinity,
                          text: 'Save Changes',
                          backgroundColor: kPrimaryColor,
                          borderRadius: 10,
                          onPressed: () {
                            final Map<String, dynamic> updatedData = {};

                            if (firstNameController.text.trim().isNotEmpty &&
                                firstNameController.text.trim() !=
                                    widget.user.firstName) {
                              updatedData["first_name"] =
                                  firstNameController.text.trim();
                              print(updatedData['first_name']);
                            }

                            if (lastNameController.text.trim().isNotEmpty &&
                                lastNameController.text.trim() !=
                                    widget.user.lastName) {
                              updatedData["last_name"] =
                                  lastNameController.text.trim();
                            }

                            if (phoneController.text.trim().isNotEmpty &&
                                phoneController.text.trim() !=
                                    widget.user.phone) {
                              updatedData["phone_number"] =
                                  phoneController.text.trim();
                            }

                            if (emailController.text.trim().isNotEmpty &&
                                emailController.text.trim() !=
                                    widget.user.email) {
                              updatedData["email"] =
                                  emailController.text.trim();
                            }

                            if (updatedData.isNotEmpty) {
                              cubit.editProfile(
                                token: ApiConstants.token!,
                                id: ApiConstants.id!,
                                data: updatedData,
                              );
                            } else {
                              showSnackBar(
                                color: Colors.red,
                                context: context,
                                message:
                                    "Please modify at least one field to save changes",
                              );
                            }
                          },
                          textStyle: const TextStyle(color: Colors.white),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
