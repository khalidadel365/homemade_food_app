import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/core/utilities/app_router.dart';

import '../../../../../core/utilities/assets.dart';
import '../../../../../core/utilities/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_textformfield.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_states.dart';

class LoginViewBody extends StatefulWidget {
  LoginViewBody({
    super.key,
  });

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetsData.logo,
                height: 120,
              ),
              const SizedBox(height: 20),
              Text("Homemade Food", style: Styles.textStyle28),
              const SizedBox(height: 40),
              // Email Field
              CustomTextFormField(
                controller: emailController,
                validate: (value) {
                  if (value.isEmpty) {
                    return 'Email must not be empty';
                  }
                  return null;
                },
                hintText: "Enter your email",
                prefixIcon: Icon(
                  Icons.email_outlined,
                  size: 20.5,
                  color: Colors.grey.shade700,
                ),
                cursorWidth: 2,
              ),
              const SizedBox(height: 16),
            BlocBuilder<AuthCubit, AuthStates>(
              builder: (context, state) {
                final cubit = AuthCubit.get(context);

                return CustomTextFormField(
                  hintText: "Enter your password",
                  obsecureText: cubit.loginPasswordVisible,
                  suffixIcon: IconButton(
                    icon: Icon(
                      cubit.loginPasswordVisible
                          ? Icons.remove_red_eye_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      cubit.changeLoginPasswordVisibility();
                    },
                  ),
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    size: 20.5,
                    color: Colors.grey.shade700,
                  ),
                  controller: passwordController,
                  validate: (value) {
                    if (value.isEmpty) {
                      return 'Password must not be empty';
                    }
                    return null;
                  },
                );
              },
            ),
              const SizedBox(height: 24),
              // Login Button
              CustomButton(
                width: double.infinity,
                height: 53,
                text: "Login",
                backgroundColor: kPrimaryColor,
                borderRadius: 12,
                textStyle: Styles.textStyle18.copyWith(color: Colors.white),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    AuthCubit.get(context).LoginUser(
                        email: emailController.text,
                        password: passwordController.text);
                  } else {
                    print('wrong');
                  }
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t have an account?", style: Styles.textStyle14),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).go(AppRouter.kSignUpView);
                    },
                    child: Text("Sign Up", style: Styles.textStyleBold),
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
