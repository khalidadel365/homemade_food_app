import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:homemade_food_app/features/home/presentation/manager/states/home_states.dart';
import 'package:homemade_food_app/features/home/presentation/views/widgets/top_chefs_list_view.dart';
import '../../../../../core/utilities/app_router.dart';
import '../../../../../core/utilities/styles.dart';
import 'featured_dish_list_view.dart';
import 'home_appbar.dart';
import 'new_arrivals_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeAppbar(),
            const SizedBox(height: 6),
            BlocBuilder<HomeCubit, HomeStates>(
              builder: (context, state) {
                if (state is FetchConsumerHomePageSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Featured Dishes',
                            style: Styles.textStyle19
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              GoRouter.of(context)
                                  .push(AppRouter.kAllDishesView);
                            },
                            child: Text(
                              'See More',
                              style: Styles.textStyle14
                                  .copyWith(color: kPrimaryColor),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      FeaturedDishListView(
                        dishes: state.homeModel.featuredDishes ?? [],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'Top Chefs',
                            style: Styles.textStyle19
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              GoRouter.of(context)
                                  .push(AppRouter.kExploreAllChefsView);
                            },
                            child: Text(
                              'Explore All',
                              style: Styles.textStyle14
                                  .copyWith(color: kPrimaryColor),
                            ),
                          ),
                        ],
                      ),
                      TopChefsListView(
                        chefs: state.homeModel.topChefs ?? [],
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'New Arrivals',
                        style: Styles.textStyle19
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 7),
                      NewArrivalsListView(
                        dishes: state.homeModel.newArrivalsDishes ?? [],
                      ),
                    ],
                  );
                } else if (state is FetchConsumerHomePageFailure) {
                  return Center(child: Text(state.errMessage));
                } else {
                  return const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Center(
                      child: SpinKitPulse(size: 45, color: kPrimaryColor),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
