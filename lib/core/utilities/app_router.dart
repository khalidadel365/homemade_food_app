import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/features/auth/presentation/views/login_view.dart';
import 'package:homemade_food_app/features/auth/presentation/views/signup_view.dart';
import 'package:homemade_food_app/features/home/presentation/views/fresh_nearby_details_view.dart';
import 'package:homemade_food_app/features/home/presentation/views/home_view.dart';
import 'package:homemade_food_app/features/main_layout/presentation/views/main_view.dart';

import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kMainView = '/mainView';
  static const kHomeView = '/homeView';
  static const kFreshNearbyDetailsView = '/freshNearbyDetailsView';
  static const kLoginView = '/loginView';
  static const kSignUpView = '/signUpView';
  static const kSplashScreen = '/splashView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(path: kLoginView, builder: (context, state) => LoginView()),
    GoRoute(path: kMainView, builder: (context, state) => MainView()),
    GoRoute(path: kHomeView, builder: (context, state) => HomeView()),
    GoRoute(path: kFreshNearbyDetailsView, builder: (context, state) => FreshNearbyDetailsView()),
    GoRoute(path: kSignUpView, builder: (context, state) => SignupView()),
  ]);
}
