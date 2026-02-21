import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/features/auth/presentation/views/login_view.dart';
import 'package:homemade_food_app/features/auth/presentation/views/signup_view.dart';
import 'package:homemade_food_app/features/cart/presentation/views/cart_view.dart';
import 'package:homemade_food_app/features/cart/presentation/views/checkout_view.dart';
import 'package:homemade_food_app/features/home/presentation/views/chef_profile_view.dart';
import 'package:homemade_food_app/features/home/presentation/views/fresh_nearby_details_view.dart';
import 'package:homemade_food_app/features/home/presentation/views/home_view.dart';
import 'package:homemade_food_app/features/main_layout/presentation/views/main_view.dart';
import 'package:homemade_food_app/features/profile/presentation/views/edit_profile_view.dart';
import '../../features/auth/data/models/account_info.dart';
import '../../features/home/data/models/dish_model.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kMainView = '/mainView';
  static const kHomeView = '/homeView';
  static const kFreshNearbyDetailsView = '/freshNearbyDetailsView';
  static const kLoginView = '/loginView';
  static const kSignUpView = '/signUpView';
  static const kSplashScreen = '/';
  static const kCartScreen = '/cartView';
  static const kCheckoutScreen = '/checkoutView';
  static const kChefProfileView = '/chefProfileView';
  static const kEditProfileView = '/editProfileView';

  static final router = GoRouter(
    initialLocation: kSplashScreen,
    routes: [
      GoRoute(
        path: kSplashScreen,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(path: kLoginView, builder: (context, state) => const LoginView()),
      GoRoute(path: kMainView, builder: (context, state) => const MainView()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(path: kFreshNearbyDetailsView, builder: (context, state) => FreshNearbyDetailsView(
        dishModel: state.extra as DishModel,
      )),
      GoRoute(path: kSignUpView, builder: (context, state) => SignupView()),
      GoRoute(path: kCartScreen, builder: (context, state) => const CartView()),
      GoRoute(path: kCheckoutScreen, builder: (context, state) => const CheckoutView()),
      GoRoute(path: kChefProfileView, builder: (context, state) => const ChefProfileView()),
      GoRoute(path: kEditProfileView, builder: (context, state) => EditProfileView(
        user: state.extra as AccountInfo,
      )),
    ],
  );
}
