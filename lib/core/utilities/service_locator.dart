import 'package:get_it/get_it.dart';
import 'package:homemade_food_app/features/all_dishes/data/repos/all_dishes_repo_imp.dart';
import 'package:homemade_food_app/features/auth/data/repos/auth_repo_imp.dart';
import 'package:homemade_food_app/features/dish_details/data/repos/dish_details_repo_imp.dart';
import 'package:homemade_food_app/features/explore_all_chefs/data/repo/explore_all_chefs_repo_imp.dart';
import 'package:homemade_food_app/features/home/data/repos/home_repo_imp.dart';
import 'package:homemade_food_app/features/profile/data/repo/profile_repo_imp.dart';
import 'package:homemade_food_app/features/orders/data/repos/orders_repo_imp.dart';
import '../../features/cart/presentation/manager/cubit/cart_cubit.dart';
import '../../features/orders/data/repos/orders_repo.dart';
import '../../features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton(AuthRepoImp());

  getIt.registerSingleton(AllDishesRepoImp(getIt.get<ApiService>()));
  getIt.registerSingleton(ExploreAllChefsRepoImp(getIt.get<ApiService>()));
  getIt.registerSingleton(DishDetailsRepoImp(getIt.get<ApiService>()));
  getIt.registerSingleton(HomeRepoImp(getIt.get<ApiService>()));
  getIt.registerSingleton(ProfileRepoImp(
    getIt.get<ApiService>(),
    getIt.get<AllDishesRepoImp>(),
  ));
  getIt.registerSingleton<CartCubit>(CartCubit());
  getIt.registerSingleton<OrderRepo>(OrdersRepoImp(getIt.get<ApiService>()));

  getIt.registerFactory(() => ProfileCubit(getIt.get<ProfileRepoImp>()));
}