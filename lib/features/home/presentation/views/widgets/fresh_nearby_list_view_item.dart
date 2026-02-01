import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/core/utilities/app_router.dart';
import 'package:homemade_food_app/core/utilities/styles.dart';
import 'package:homemade_food_app/core/widgets/custom_button.dart';
import 'package:homemade_food_app/features/home/data/models/dish_model.dart';
import '../../../../../constants.dart';
import 'chief_profile.dart';
import 'custom_fresh_nearby_image.dart';
import 'food_rating.dart';

class FreshNearbyListViewItem extends StatelessWidget {
  const FreshNearbyListViewItem({
    super.key,
    required this.dishModel,
  });

  final DishModel dishModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kFreshNearbyDetailsView);
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.215,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const CustomFreshNearbyImage(),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dishModel.name ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle17,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    dishModel.description ?? '',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Flexible(
                        child: ChefProfile(
                          chefModel: dishModel.chef,
                        ),
                      ),
                      const SizedBox(width: 30),
                      FoodRating(
                        rating: dishModel.averageRating?.toDouble() ?? 0.0,
                        size: 13,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '\$${dishModel.price ?? '18.00'}',
                          style: Styles.textStyle18.copyWith(
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      CustomButton(
                        height: 32,
                        width: 32,
                        backgroundColor: kSecondaryColor,
                        borderRadius: 50,
                        icon: const Icon(
                          Icons.add,
                          color: kPrimaryColor,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}