import 'package:flutter/material.dart';
import 'package:homemade_food_app/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
   LoginView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: LoginViewBody(),
      ),
    );
  }
}


