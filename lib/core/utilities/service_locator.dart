import 'package:get_it/get_it.dart';
import 'package:homemade_food_app/features/auth/data/repos/auth_repo.dart';
import 'package:homemade_food_app/features/auth/data/repos/auth_repo_imp.dart';
import 'package:homemade_food_app/features/home/data/repos/home_repo.dart';
import 'package:homemade_food_app/features/home/data/repos/home_repo_imp.dart';

import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator(){
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton(AuthRepoImp());
  getIt.registerSingleton(HomeRepoImp(
    getIt.get<ApiService>()
  ));
}