import 'package:flutter/material.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/core/utilities/styles.dart';
import 'package:homemade_food_app/features/home/presentation/views/widgets/chief_profile.dart';
import 'package:homemade_food_app/features/home/presentation/views/widgets/food_rating.dart';
import 'package:homemade_food_app/features/home/presentation/views/widgets/spiness_list_view.dart';
import 'package:readmore/readmore.dart';
import '../../../data/models/dish_model.dart';
import 'add_ons_list_view.dart';
import 'details_options_title.dart';
import 'food_info_row.dart';

class OrderDetailsBody extends StatefulWidget {
  const OrderDetailsBody({super.key,required this.dishModel});
  final DishModel dishModel;
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
                Text('${widget.dishModel.name}', style: Styles.textStyle20),
                Text(
                  "${widget.dishModel.price} EGY",
                  style: Styles.textStyle20.copyWith(color: kPrimaryColor),
                ),
              ],
            ),
            const SizedBox(height: 8),
             Row(
              children: [
                ChefProfile(chefModel: widget.dishModel.chef),
                const Spacer(),
                FoodRating(
                  rating: widget.dishModel.averageRating ?? 0.0,
                  size: 15,
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            FoodInfoRow(
              prepTime: '${widget.dishModel.preparationTime}',
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
              '${widget.dishModel.description}',
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


