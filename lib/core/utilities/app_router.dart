import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/core/utilities/api_constants.dart';
import 'package:homemade_food_app/core/utilities/service_locator.dart';
import 'package:homemade_food_app/features/all_dishes/presentation/views/all_dishes_view.dart';
import 'package:homemade_food_app/features/auth/presentation/views/login_view.dart';
import 'package:homemade_food_app/features/auth/presentation/views/signup_view.dart';
import 'package:homemade_food_app/features/cart/presentation/views/cart_view.dart';
import 'package:homemade_food_app/features/cart/presentation/views/checkout_view.dart';
import 'package:homemade_food_app/features/explore_all_chefs/data/repo/explore_all_chefs_repo_imp.dart';
import 'package:homemade_food_app/features/explore_all_chefs/presentation/manager/cubit/explore_all_chefs_cubit.dart';
import 'package:homemade_food_app/features/main_layout/presentation/views/main_view.dart';
import 'package:homemade_food_app/features/order_details/presentation/views/order_details_view.dart';
import 'package:homemade_food_app/features/profile/presentation/views/change_password_confirm_view.dart';
import 'package:homemade_food_app/features/profile/presentation/views/change_password_request_view.dart';
import 'package:homemade_food_app/features/profile/presentation/views/edit_profile_view.dart';
import 'package:homemade_food_app/features/rating/presentation/views/chef_rating_view.dart';
import '../../features/cart/presentation/manager/cubit/cart_cubit.dart';
import '../../features/dish_details/presentation/views/dish_details_view.dart';
import '../../features/explore_all_chefs/presentation/views/explore_all_chefs_view.dart';
import '../../features/home/presentation/manager/orders/states/orders_states.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/order_details/presentation/manager/cubit/order_details_cubit.dart';
import '../../features/profile/data/repo/profile_repo_imp.dart';
import '../../features/profile/presentation/manager/cubit/profile_cubit.dart';
import '../../features/profile/presentation/views/chef_profile_view.dart';
import '../../features/rating/presentation/manager/cubit/rating_cubit.dart';
import '../../features/rating/presentation/manager/states/rating_states.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../../features/home/presentation/manager/orders/cubit/orders_cubit.dart';
import 'functions/show_snack_bar.dart';

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
  static const kOrderDetailsView = '/orderDetailsView';
  static const kChefProfileView = '/chefProfileView';
  static const kEditProfileView = '/editProfileView';
  static const kExploreAllChefsView = '/exploreAllChefsView';
  static const kChangePasswordRequestView = '/changePasswordRequestView';
  static const kChangePasswordConfirmView = '/changePasswordConfirmView';
  static const kRateChefView = '/rateChefView';

  static final router = GoRouter(
    initialLocation: kSplashScreen,
    routes: [
      GoRoute(path: kSplashScreen, builder: (context, state) => const SplashView()),
      GoRoute(path: kLoginView, builder: (context, state) => const LoginView()),

      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => getIt.get<OrdersCubit>()..initSocket(ApiConstants.token!),
            child: // داخل الـ ShellRoute في AppRouter
            BlocListener<OrdersCubit, OrdersState>(
              listener: (context, state) {
                if (state is NewIncomingOrderSuccess) {
                  showSnackBar(context: context, message: 'New Order Received!', color: Colors.blue);
                } else if (state is PreparingSuccess) {
                  showSnackBar(context: context, message: 'Order is Preparing!', color: Colors.orange);
                } else if (state is OutForDeliverySuccess) {
                  showSnackBar(context: context, message: 'Order is Out for Delivery!', color: Colors.purple);
                } else if (state is OrderDeliveredSuccess) {
                  showSnackBar(context: context, message: 'Order Delivered!', color: Colors.green);
                  context.read<RatingCubit>().getOrderDetails(orderId: state.order.orderId, token: ApiConstants.token!);
                } else if (state is OrderCanceledSuccess) {
                  showSnackBar(context: context, message: 'Order Canceled', color: Colors.red);
                }
              },
              child: BlocListener<RatingCubit, RatingState>(
                listener: (context, state) {
                  if (state is GetOrderDetailsSuccess) {
                    context.push(kRateChefView, extra: state.orderDetails.chef);
                  }
                },
                child: child,
              ),
            ),
          );
        },
        routes: [
          GoRoute(path: kMainView, builder: (context, state) => BlocProvider(create: (context) => ProfileCubit(getIt.get<ProfileRepoImp>()), child: const MainView())),
          GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
          GoRoute(path: kCartScreen, builder: (context, state) => BlocProvider.value(value: getIt<CartCubit>(), child: const CartView())),
        ],
      ),

      GoRoute(path: kRateChefView, builder: (context, state) => ChefRatingView(chefId: state.extra as int)),
      GoRoute(path: kAllDishesView, builder: (context, state) => const AllDishesView()),
      GoRoute(path: kDishDetailsView, builder: (context, state) => DishDetailsView(id: state.extra as int)),
      GoRoute(path: kSignUpView, builder: (context, state) => SignupView()),
      GoRoute(path: kCheckoutScreen, builder: (context, state) => const CheckoutView()),
      GoRoute(
        path: kOrderDetailsView,
        builder: (context, state) {
          final orderId = state.extra as String;
          return BlocProvider(create: (context) => getIt.get<OrderDetailsCubit>(), child: OrderDetailsView(orderId: orderId));
        },
      ),
      GoRoute(path: kExploreAllChefsView, builder: (context, state) => BlocProvider(create: (context) => ExploreAllChefsCubit(getIt.get<ExploreAllChefsRepoImp>()), child: const ExploreAllChefsView())),
      GoRoute(
        path: kChefProfileView,
        builder: (context, state) {
          final chefId = state.extra as int;
          return BlocProvider(
            create: (context) => getIt.get<ProfileCubit>()..fetchProfile(id: chefId, token: ApiConstants.token!),
            child: ChefProfileView(chefId: chefId),
          );
        },
      ),
      GoRoute(path: kEditProfileView, builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return BlocProvider.value(value: data['cubit'] as ProfileCubit, child: EditProfileView(user: data['user']));
      }),
      GoRoute(path: kChangePasswordRequestView, builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return BlocProvider.value(value: data['cubit'] as ProfileCubit, child: ChangePasswordRequestView());
      }),
      GoRoute(path: kChangePasswordConfirmView, builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return BlocProvider.value(value: data['cubit'] as ProfileCubit, child: ChangePasswordConfirmView());
      }),
    ],
  );
}