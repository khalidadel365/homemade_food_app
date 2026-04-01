import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_food_app/features/all_dishes/presentation/views/widgets/all_dishes_view_body.dart';
import '../../../../core/utilities/service_locator.dart';
import '../../data/repos/all_dishes_repo_imp.dart';
import '../manager/fetch_all_dishes_cubit/all_dishes_cubit.dart';

class AllDishesView extends StatelessWidget {
  const AllDishesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
            create: (context) =>
                FetchAllDishesCubit(getIt.get<AllDishesRepoImp>())
                  ..fetchAllDishes(),
            child: const AllDishesViewBody()));
  }
}
