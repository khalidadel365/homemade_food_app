import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/core/utilities/app_router.dart';
import 'package:homemade_food_app/core/utilities/assets.dart';
import 'package:homemade_food_app/core/widgets/custom_button.dart';
import 'package:homemade_food_app/features/auth/presentation/manager/auth_states.dart';
import '../../../../../core/utilities/styles.dart';
import '../../../../../core/widgets/custom_textformfield.dart';
import '../../manager/auth_cubit.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({
    super.key,
  });

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController phoneController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    phoneController = TextEditingController();
    confirmPasswordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetsData.logo,
                height: 100,
              ),
              const SizedBox(height: 5),
              Text("Create Account", style: Styles.textStyle28),
              const SizedBox(height: 15),
              //first name text field
              CustomTextFormField(
                hintText: "First Name",
                prefixIcon: Icon(Icons.person_outline, size: 23,
                  color: Colors.grey.shade700,),
                validate: (value) {
                  if (value.isEmpty) {
                    return 'First name must not be empty';
                  }
                  return null;
                },
                controller: firstNameController,
              ),
              const SizedBox(height: 16),
              //last name text field
              CustomTextFormField(
                hintText: "Last Name",
                prefixIcon: Icon(Icons.person_outline, size: 23,
                  color: Colors.grey.shade700,),
                validate: (value) {
                  if (value.isEmpty) {
                    return 'Last name must not be empty';
                  }
                  return null;
                },
                controller: lastNameController,
              ),
              const SizedBox(height: 16),
              // phone text field
              CustomTextFormField(
                hintText: "Phone Number",
                prefixIcon: Icon(Icons.phone_outlined, size: 23,
                  color: Colors.grey.shade700,),
                validate: (value) {
                  if (value.isEmpty) {
                    return 'Phone number must not be empty';
                  }
                  return null;
                },
                controller: phoneController,
              ),
              const SizedBox(height: 16),
              // email text field
              CustomTextFormField(
                hintText: "Email Address",
                prefixIcon: Icon(Icons.email_outlined, size: 22,
                  color: Colors.grey.shade700,),
                validate: (value) {
                  if (value.isEmpty) {
                    return 'Email must not be empty';
                  }
                  return null;
                },
                controller: emailController,
              ),
              const SizedBox(height: 16),
              // password text field
              BlocBuilder<AuthCubit, AuthStates>(
                builder: (context, state) {
                  final cubit = AuthCubit.get(context);
                  return CustomTextFormField(
                    hintText: "Password",
                    obsecureText: cubit.signupPasswordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        cubit.signupPasswordVisible
                            ? Icons.remove_red_eye_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      onPressed: () {
                        cubit.changeSignupPasswordVisibility();
                      },
                    ),
                    prefixIcon: Icon(Icons.lock_outline, size: 22,
                      color: Colors.grey.shade700,),
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Password must not be empty';
                      }
                      return null;
                    },
                    controller: passwordController,
                  );
                },
              ),
              const SizedBox(height: 15),
              // confirm Password text field
              BlocBuilder<AuthCubit, AuthStates>(
                builder: (context, state) {
                  final cubit = AuthCubit.get(context);
                  return CustomTextFormField(
                    hintText: "Confirm Password",
                    obsecureText: cubit.confirmPasswordVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        cubit.confirmPasswordVisible
                            ? Icons.remove_red_eye_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      onPressed: () {
                        cubit.changeSignupConfirmPasswordVisibility();
                      },
                    ),
                    prefixIcon: Icon(Icons.lock_outline, size: 22,
                      color: Colors.grey.shade700,),
                    controller: confirmPasswordController,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Confirm password must not be empty';
                      } else if (value != passwordController.text) {
                        return 'Passwords do not match';
                      } else
                        return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                  width: double.infinity,
                  height: 53,
                  backgroundColor: kPrimaryColor,
                  borderRadius: 12,
                  text: 'Sign Up',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      AuthCubit.get(context).SignupUser(
                          email: emailController.text,
                          password: passwordController.text,
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          phone: phoneController.text);
                    } else {
                      print('wrong');
                    }
                  },
                  textStyle: Styles.textStyle18.copyWith(
                      color: Colors.white
                  )
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?", style: Styles.textStyle14),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).go(AppRouter.kLoginView);
                    },
                    child: Text(
                        "Login",
                        style: Styles.textStyleBold
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
