import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/core/models/dish_model.dart';
import 'package:homemade_food_app/core/utilities/app_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/models/cheif_model.dart';
import '../../../../../core/utilities/styles.dart';
import '../../../../../core/widgets/chief_info_row.dart';
import '../../../../../core/widgets/custom_rating.dart';

class FeaturedDishListViewItem extends StatelessWidget {
  const FeaturedDishListViewItem({super.key, required this.dish});
  final DishModel dish;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kDishDetailsView, extra: dish.id);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.64,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.network(
                    dish.imageUrl ?? '',
                    height: 165,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomRating(
                      backgroundColor: Colors.white,
                      size: 14,
                      rating: dish.averageRating?.toDouble() ?? 0),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          dish.name ?? 'No Name',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle16.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'EGY ${dish.price}',
                        style: Styles.textStyle16.copyWith(
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dish.description ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle12.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  ChefInfoRow(
                    chefModel: ChefModel(
                      firstName: dish.chefName ?? 'Unknown',
                      lastName: '',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
