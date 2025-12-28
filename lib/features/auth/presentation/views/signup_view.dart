import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homemade_food_app/core/widgets/custom_textformfield.dart';
import 'package:homemade_food_app/core/widgets/show_snack_bar.dart';
import 'package:homemade_food_app/features/auth/presentation/manager/auth_states.dart';
import 'package:homemade_food_app/features/home/presentation/views/home_page.dart';

import '../manager/signup_cubit.dart';
import 'login_view.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final phoneController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupStates>(
      listener: (context, state) {
        if(state is SignupLoadingState){
          print('loading');
        }
        if(state is SignupSuccessState){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginView()),
          );
          }
          else if (state is SignupErrorState){
            showSnackBar(context: context, message: 'email may be already in use', color: Colors.red);
          }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.orange[50],
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 40),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo
                      Image.asset(
                        "assets/logo/food_logo1.png",
                        height: 100,
                      ),
                      const SizedBox(height: 20),
                      // Title
                      Text(
                        "Create Account",
                        style: GoogleFonts.poppins(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Name Field
                      CustomTextFormField(
                        hintText: "First Name",
                        prefixIcon: Icons.person_outline,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'First name must not be empty';
                          }
                          return null;
                        },
                        controller: firstNameController,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        hintText: "Last Name",
                        prefixIcon: Icons.person_outline,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Last name must not be empty';
                          }
                          return null;
                        },
                        controller: lastNameController,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        hintText: "Phone Number",
                        prefixIcon: Icons.phone_outlined,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Phone number must not be empty';
                          }
                          return null;
                        },
                        controller: phoneController,
                      ),
                      const SizedBox(height: 16),
                      // Email Field
                      CustomTextFormField(
                        hintText: "Email",
                        prefixIcon: Icons.email_outlined,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Email must not be empty';
                          }
                          return null;
                        },
                        controller: emailController,
                      ),
                      const SizedBox(height: 16),
                      // Password Field
                      CustomTextFormField(
                        hintText: "Password",
                        prefixIcon: Icons.lock_outline,
                        obsecureText: true,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Password must not be empty';
                          }
                          return null;
                        },
                        controller: passwordController,
                      ),
                      const SizedBox(height: 15),
                      // Confirm Password
                      CustomTextFormField(
                        hintText: "Confirm Password",
                        prefixIcon: Icons.lock_outline,
                        controller: confirmPasswordController,
                        obsecureText: true,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Confirm password must not be empty';
                          }
                          else if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          else
                            return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      // Signup Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                           SignupCubit.get(context).SignupUser(
                               email: emailController.text,
                               password: passwordController.text,
                               firstName: firstNameController.text,
                               lastName: lastNameController.text,
                               phone: phoneController.text);
                            }
                            else {
                              print('wrong');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 4,
                          ),
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Back to Login
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?",
                              style: GoogleFonts.poppins(fontSize: 14)),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Login",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
