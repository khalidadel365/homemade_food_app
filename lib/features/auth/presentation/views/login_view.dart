import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homemade_food_app/core/widgets/custom_textformfield.dart';
import '../../../home/presentation/views/home_page.dart';

import 'signup_view.dart'; // add this import

class LoginView extends StatelessWidget {
   LoginView({super.key});
  final  emailController = TextEditingController();
  final  passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView( 
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  "assets/logo/food_logo1.png",
                  height: 120,
                ),
                const SizedBox(height: 20),
                Text(
                  "Homemade Food",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
                const SizedBox(height: 40),
                // Email Field
                CustomTextFormField(
                  controller: emailController,
                  validate: (value){},
                  hintText: "Enter your email",
                  obsecureText: false,
                  prefixIcon:  Icons.email_outlined,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  hintText: "Enter your password",
                  obsecureText: true,
                  prefixIcon: Icons.lock_outline,
                  controller: passwordController,
                  validate: (value){},
                ),
                const SizedBox(height: 24),
                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder:(context) => const HomeView()),
                        );
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
                      "Login",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Signup Redirect
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have an account?",
                        style: GoogleFonts.poppins(fontSize: 14)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder:(context) =>  SignupView()),

                        );
                      },
                      child: Text(
                        "Sign Up",
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
    );
  }
}
