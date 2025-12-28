import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_food_app/core/utilities/app_router.dart';
import 'package:homemade_food_app/features/auth/presentation/manager/signup_cubit.dart';
import 'package:homemade_food_app/features/auth/presentation/views/login_view.dart';
import 'bloc_observer.dart';
import 'core/utilities/api_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  ApiService.init();
  runApp(HomemadeFoodApp());
}

class HomemadeFoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
