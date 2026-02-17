import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/core/utilities/app_router.dart';
import 'package:homemade_food_app/core/utilities/service_locator.dart';
import 'package:homemade_food_app/features/auth/data/repos/auth_repo_imp.dart';
import 'package:homemade_food_app/features/auth/presentation/manager/auth_cubit.dart';
import 'bloc_observer.dart';
import 'core/utilities/api_service.dart';
import 'core/utilities/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.initSharedPreferences();
  Bloc.observer = MyBlocObserver();
  setupServiceLocator();
  getIt.get<ApiService>().init();
  runApp(const HomemadeFoodApp());
}

class HomemadeFoodApp extends StatelessWidget {
  const HomemadeFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.get<AuthRepoImp>()),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kBackGroundColor,
          primaryColor: kPrimaryColor,
          focusColor: kPrimaryColor,
          fontFamily: kFontFamily,
          colorScheme: ColorScheme.fromSeed(
              primary:kPrimaryColor,
              seedColor: kPrimaryColor),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: kPrimaryColor,
            selectionColor: kPrimaryColor.withOpacity(0.3),
            selectionHandleColor: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}

