import 'package:flutter/material.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/core/utilities/styles.dart';
import 'package:homemade_food_app/features/home/data/models/cheif_model.dart';
import 'package:homemade_food_app/features/home/presentation/views/widgets/chief_profile.dart';
import 'package:homemade_food_app/features/home/presentation/views/widgets/food_rating.dart';
import 'package:homemade_food_app/features/home/presentation/views/widgets/spiness_list_view.dart';
import 'package:readmore/readmore.dart';
import 'add_ons_list_view.dart';
import 'details_options_title.dart';
import 'food_info_row.dart';

class OrderDetailsBody extends StatefulWidget {
  const OrderDetailsBody({super.key});

  @override
  State<OrderDetailsBody> createState() => _OrderDetailsBodyState();
}

class _OrderDetailsBodyState extends State<OrderDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Mom's Special\nLasagna", style: Styles.textStyle20),
                Text(
                  "150 EGY",
                  style: Styles.textStyle20.copyWith(color: kPrimaryColor),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                //const ChefProfile(chefModel: ChefModel(),),
                const Spacer(),
                // const FoodRating(
                //   rating: 2.8,
                //   size: 15,
                // )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const FoodInfoRow(
              prepTime: '25m',
              calories: '350',
            ),
            const SizedBox(
              height: 16,
            ),
            const DetailsOptionsTitle(
              title: 'Description',
            ),
            const SizedBox(
              height: 10,
            ),
            ReadMoreText(
              'Food is mainly composed of water, lipids, proteins, and carbohydrates. Oth food, substance consisting essentially of protein, carbohydrate, fat, and other nutrients used in the body of an organism to sustain growth and vital processes and to furnish energy',
              colorClickableText: kPrimaryColor,
              trimLines: 5,
              trimMode: TrimMode.Line,
              trimCollapsedText: ' Show more',
              trimExpandedText: ' Show less',
              style: Styles.textStyle14,
            ),
            const SizedBox(
              height: 30,
            ),
            const DetailsOptionsTitle(title: 'Choice of Spiciness'),
            const SizedBox(
              height: 10,
            ),
            SpicinessListView(),
            const SizedBox(
              height: 30,
            ),
            const DetailsOptionsTitle(title: 'Add-Ons'),
            const SizedBox(
              height: 10,
            ),
            AddOnsListView()
          ],
        ),
      ),
    );
  }
}


