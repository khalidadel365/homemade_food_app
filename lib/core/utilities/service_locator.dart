import 'package:get_it/get_it.dart';
import 'package:homemade_food_app/features/all_dishes/data/repos/all_dishes_repo_imp.dart';
import 'package:homemade_food_app/features/auth/data/repos/auth_repo_imp.dart';
import 'package:homemade_food_app/features/dish_details/data/repos/dish_details_repo_imp.dart';
import 'package:homemade_food_app/features/explore_all_chefs/data/repo/explore_all_chefs_repo_imp.dart';
import 'package:homemade_food_app/features/home/data/repos/home_repo_imp.dart';
import 'package:homemade_food_app/features/profile/data/repo/profile_repo_imp.dart';
import 'package:homemade_food_app/features/orders/data/repos/orders_repo_imp.dart';
import '../../features/cart/data/repos/cart_repo.dart';
import '../../features/cart/data/repos/cart_repo_imp.dart';
import '../../features/cart/presentation/manager/cubit/cart_cubit.dart';
import '../../features/home/presentation/manager/orders/cubit/orders_cubit.dart';
import '../../features/orders/data/repos/orders_repo.dart';
import '../../features/profile/presentation/manager/cubit/profile_cubit.dart';
import 'api_service.dart';
import '../../features/order_details/data/repos/order_details_repo.dart';
import '../../features/order_details/data/repos/order_details_repo_imp.dart';
import '../../features/order_details/presentation/manager/cubit/order_details_cubit.dart';
import '../../features/home/data/service/orders_socket_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<OrdersSocketService>(OrdersSocketService());

  getIt.registerSingleton(AuthRepoImp());

  getIt.registerSingleton(AllDishesRepoImp(getIt.get<ApiService>()));
  getIt.registerSingleton(ExploreAllChefsRepoImp(getIt.get<ApiService>()));
  getIt.registerSingleton(DishDetailsRepoImp(getIt.get<ApiService>()));

  getIt.registerSingleton(HomeRepoImp(
      getIt.get<ApiService>(),
      getIt.get<OrdersSocketService>()
  ));

  getIt.registerSingleton(ProfileRepoImp(
    getIt.get<ApiService>(),
    getIt.get<AllDishesRepoImp>(),
  ));

  getIt.registerSingleton<OrdersCubit>(OrdersCubit(getIt.get<HomeRepoImp>()));

  getIt.registerSingleton<CartRepo>(CartRepoImpl(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<CartCubit>(CartCubit(getIt.get<CartRepo>()));

  getIt.registerSingleton<OrderRepo>(OrdersRepoImp(getIt.get<ApiService>()));

  getIt.registerFactory(() => ProfileCubit(getIt.get<ProfileRepoImp>()));

  getIt.registerSingleton<OrderDetailsRepo>(OrderDetailsRepoImpl(getIt.get<ApiService>()));
  getIt.registerFactory(() => OrderDetailsCubit(getIt.get<OrderDetailsRepo>()));
}