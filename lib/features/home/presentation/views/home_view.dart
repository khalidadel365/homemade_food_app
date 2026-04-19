import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_food_app/core/utilities/service_locator.dart';
import 'package:homemade_food_app/features/home/data/repos/home_repo_imp.dart';
import 'package:homemade_food_app/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:homemade_food_app/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            HomeCubit(getIt<HomeRepoImp>())..fetchConsumerHomePage(),
        child: const Scaffold(
          body: HomeViewBody(),
        ),
      ),
    );
  }
}
