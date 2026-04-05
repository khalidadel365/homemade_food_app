import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/core/utilities/service_locator.dart';
import 'package:homemade_food_app/features/all_dishes/presentation/views/all_dishes_view.dart';
import 'package:homemade_food_app/features/auth/presentation/views/login_view.dart';
import 'package:homemade_food_app/features/auth/presentation/views/signup_view.dart';
import 'package:homemade_food_app/features/cart/presentation/views/cart_view.dart';
import 'package:homemade_food_app/features/cart/presentation/views/checkout_view.dart';
import 'package:homemade_food_app/features/main_layout/presentation/views/main_view.dart';
import 'package:homemade_food_app/features/profile/presentation/profile_cubit/profile_cubit.dart';
import 'package:homemade_food_app/features/profile/presentation/views/change_password_confirm_view.dart';
import 'package:homemade_food_app/features/profile/presentation/views/change_password_request_view.dart';
import 'package:homemade_food_app/features/profile/presentation/views/edit_profile_view.dart';

import '../../features/dish_details/presentation/views/dish_details_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/profile/data/repo/profile_repo_imp.dart';
import '../../features/profile/presentation/views/chef_profile_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kMainView = '/mainView';
  static const kHomeView = '/homeView';
  static const kDishDetailsView = '/dishDetailsView';
  static const kAllDishesView = '/allDishesView';
  static const kLoginView = '/loginView';
  static const kSignUpView = '/signUpView';
  static const kSplashScreen = '/';
  static const kCartScreen = '/cartView';
  static const kCheckoutScreen = '/checkoutView';
  static const kChefProfileView = '/chefProfileView';
  static const kEditProfileView = '/editProfileView';
  static const kChangePasswordRequestView = '/changePasswordRequestView';
  static const kChangePasswordConfirmView = '/changePasswordConfirmView';

  static final router = GoRouter(
    initialLocation: kSplashScreen,
    routes: [
      GoRoute(
        path: kSplashScreen,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(path: kLoginView, builder: (context, state) => const LoginView()),
      GoRoute(
          path: kAllDishesView,
          builder: (context, state) => const AllDishesView()),
      GoRoute(
          path: kMainView,
          builder: (context, state) => BlocProvider(
              create: (context) => ProfileCubit(getIt.get<ProfileRepoImp>()),
              child: const MainView())),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
          path: kDishDetailsView,
          builder: (context, state) => DishDetailsView(
                id: state.extra as int,
              )),
      GoRoute(path: kSignUpView, builder: (context, state) => SignupView()),
      GoRoute(path: kCartScreen, builder: (context, state) => const CartView()),
      GoRoute(
          path: kCheckoutScreen,
          builder: (context, state) => const CheckoutView()),
      GoRoute(
          path: kChefProfileView,
          builder: (context, state) => BlocProvider(
                create: (context) => ProfileCubit(getIt.get<ProfileRepoImp>()),
                child: ChefProfileView(
                  chefId: state.extra as int,
                ),
              )),
      GoRoute(
          path: kEditProfileView,
          builder: (context, state) {
            final data = state.extra as Map<String, dynamic>;
            return BlocProvider.value(
              value: data['cubit'] as ProfileCubit,
              child: EditProfileView(
                user: data['user'],
              ),
            );
          }),
      GoRoute(
          path: kChangePasswordRequestView,
          builder: (context, state) {
            final data = state.extra as Map<String, dynamic>;
            return BlocProvider.value(
              value: data['cubit'] as ProfileCubit,
              child: ChangePasswordRequestView(),
            );
          }),
      GoRoute(
          path: kChangePasswordConfirmView,
          builder: (context, state) {
            final data = state.extra as Map<String, dynamic>;
            return BlocProvider.value(
              value: data['cubit'] as ProfileCubit,
              child: ChangePasswordConfirmView(),
            );
          }),
    ],
  );
}
