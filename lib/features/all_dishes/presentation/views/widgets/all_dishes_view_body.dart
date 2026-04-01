import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/utilities/styles.dart';
import '../../manager/fetch_all_dishes_cubit/all_dishes_cubit.dart';
import '../../manager/states/all_dishes_states.dart';
import '../../../../../core/widgets/all_dishes_list_view.dart';
import 'categories_list_view.dart';
import '../../../../../core/widgets/custom_search_text_field.dart';

class AllDishesViewBody extends StatelessWidget {
  const AllDishesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchTextField(searchController: searchController),
              const SizedBox(height: 15),
              const CategoriesListView(),
              const SizedBox(height: 18),
              Row(children: [
                Text('All Dishes ', style: Styles.textStyle20),
                const SizedBox(width: 3.5),
                const Icon(FontAwesomeIcons.fire,
                    color: kPrimaryColor, size: 18)
              ]),
              const SizedBox(height: 18),
              BlocBuilder<FetchAllDishesCubit, FetchAllDishesState>(
                builder: (context, state) {
                  if (state is FetchAllDishesSuccess) {
                    return AllDishesListView(dishes: state.dishes);
                  } else if (state is FetchAllDishesFailure) {
                    return Center(child: Text(state.errMessage));
                  } else {
                    return Center(
                      child: SpinKitPulse(size: 45, color: kPrimaryColor),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
