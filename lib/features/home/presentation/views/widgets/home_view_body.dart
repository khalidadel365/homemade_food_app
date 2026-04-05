import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/core/models/cheif_model.dart';
import 'package:homemade_food_app/core/widgets/chief_info_row.dart';
import 'package:homemade_food_app/core/widgets/food_rating.dart';

import '../../../../../core/utilities/app_router.dart';
import '../../../../../core/utilities/styles.dart';
import 'home_appbar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          HomeAppbar(),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Text(
                'Featured Dishes',
                style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.34,
            child: ListView.separated(
              itemBuilder: (context, index) => FeaturedDishItem(),
              separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturedDishItem extends StatelessWidget {
  const FeaturedDishItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  'https://www.tasteofhome.com/wp-content/uploads/2018/01/Homemade-Pizza_EXPS_FT23_376_EC_120123_3.jpg',
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              FoodRating(size: 15, rating: 5),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Margherita Pizza',
                      style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
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
                const SizedBox(height: 4),
                Text(
                  'Fresh basil, mozzarella, house-made tomato sauce',
                  style: Styles.textStyle12.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                ChefInfoRow(
                    chefModel: ChefModel(
                  firstName: 'Khalid',
                  lastName: 'Adel',
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
