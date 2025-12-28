// import 'package:bookly_app/features/home/data/repos/home_repo_imp.dart';
// import 'package:bookly_app/features/search/data/repos/search_repo_imp.dart';
// import 'package:get_it/get_it.dart';
//
// import 'api_service.dart';
//
// final getIt = GetIt.instance;
//
// void setupServiceLocator(){
//   getIt.registerSingleton<ApiService>(ApiService());
//   getIt.registerSingleton(HomeRepoImp(
//       getIt.get<ApiService>( )
//   ));
//   getIt.registerSingleton(SearchRepoImp(
//       getIt.get<ApiService>( )
//   ));
// }