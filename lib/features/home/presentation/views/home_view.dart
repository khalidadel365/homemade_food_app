import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_food_app/features/home/presentation/manager/fresh_nearby_dishes_cubit/fresh_nearby_dishes_cubit.dart';
import 'package:homemade_food_app/features/home/presentation/views/widgets/home_view_body.dart';

import '../../../../core/utilities/service_locator.dart';
import '../../data/repos/home_repo_imp.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
          create: (context)=>FreshNearbyDishesCubit(getIt.get<HomeRepoImp>())..fetchFreshNearbyDishes(),
            child: const HomeViewBody())
    );
  }
}
