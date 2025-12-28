import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_food_app/features/auth/presentation/manager/signup_cubit.dart';
import 'package:homemade_food_app/features/auth/presentation/views/login_view.dart';
import 'core/utilities/api_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ApiService.init();
  runApp(HomemadeFoodApp());
}

class HomemadeFoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Homemade Food',
        theme: ThemeData(primarySwatch: Colors.green),
        home: LoginView(),
      ),
    );
  }
}
