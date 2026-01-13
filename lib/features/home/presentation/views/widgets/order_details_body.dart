import 'package:flutter/material.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/core/utilities/styles.dart';
import 'package:homemade_food_app/features/home/presentation/views/widgets/food_rating.dart';
import 'chief_profile.dart';
import 'food_info_row.dart';

class OrderDetailsBody extends StatelessWidget {
  const OrderDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mom's Special\nLasagna",
                  style: Styles.textStyle20,
                ),
                Text(
                  "150 EGY",
                  style: Styles.textStyle20.copyWith(color: kPrimaryColor),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                const CheifProfile(),
                const Spacer(),
                const FoodRating(rating: 2.8,size: 15,)
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const FoodInfoRow(
              prepTime: '25m',
              calories: '350',
            ),
          ],
        ),
      ),
    );
  }
}


