import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/core/utilities/assets.dart';
import 'package:homemade_food_app/features/auth/presentation/views/login_view.dart';
import 'package:homemade_food_app/features/auth/presentation/views/signup_view.dart';
import 'package:homemade_food_app/features/home/presentation/views/home_view.dart';
import 'package:homemade_food_app/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).go('/loginView');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SplashViewBody();
  }
}
