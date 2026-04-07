import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/core/widgets/custom_dish_image.dart';
import 'package:homemade_food_app/features/home/presentation/views/widgets/top_chefs_list_view.dart';

import '../../../../../core/utilities/app_router.dart';
import '../../../../../core/utilities/styles.dart';
import 'featured_dish_list_view.dart';
import 'home_appbar.dart';

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
            HomeAppbar(),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Text(
                  'Featured Dishes',
                  style:
                      Styles.textStyle19.copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kAllDishesView);
                    },
                    child: Text(
                      'See More',
                      style: Styles.textStyle14.copyWith(color: kPrimaryColor),
                    )),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            FeaturedDishListView(),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  'Top Chefs',
                  style:
                      Styles.textStyle19.copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kAllDishesView);
                    },
                    child: Text(
                      'Explore All',
                      style: Styles.textStyle14.copyWith(color: kPrimaryColor),
                    )),
              ],
            ),
            TopChefsListView(),
            const SizedBox(
              height: 15,
            ),
            Text(
              'New Arrivals',
              style: Styles.textStyle19,
            ),
            const SizedBox(
              height: 7,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomDishImage(
                              height: 0.22, width: 0.22, imageUrl: ''),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.10,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Risotto ai Funghi',
                                    style: Styles.textStyle17
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Creamy arborio rice with wild mushrooms',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Styles.textStyle12.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'EGY 18.50',
                                    style: Styles.textStyle16.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 13,
                    ),
                itemCount: 5)
          ],
        ),
      ),
    );
  }
}
