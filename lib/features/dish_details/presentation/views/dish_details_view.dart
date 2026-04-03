import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_food_app/features/dish_details/data/repos/dish_details_repo_imp.dart';
import 'package:homemade_food_app/features/dish_details/presentation/manager/cubit/dish_details_cubit.dart';
import 'package:homemade_food_app/features/dish_details/presentation/views/widgets/dish_details_bottom_nav_bar.dart';
import 'package:homemade_food_app/features/dish_details/presentation/views/widgets/dish_details_view_body.dart';

import '../../../../core/utilities/service_locator.dart';

class DishDetailsView extends StatelessWidget {
  const DishDetailsView({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) =>
              FetchDishDetailsCubit(getIt.get<DishDetailsRepoImp>())
                ..fetchDishDetails(id: id),
          child: DishDetailsViewBody(),
        ),
        bottomNavigationBar: DishDetailsBottomNavBar(),
      ),
    );
  }
}
