import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/core/utilities/app_router.dart';
import 'package:homemade_food_app/core/utilities/styles.dart';
import '../../constants.dart';
import '../models/dish_model.dart';
import 'custom_dish_image.dart';
import 'food_rating.dart';

class AllDishesListViewItem extends StatelessWidget {
  const AllDishesListViewItem({
    super.key,
    required this.dishModel,
  });

  final DishModel dishModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kFreshNearbyDetailsView, extra: dishModel);
      },
      child: Container(
        //height: MediaQuery.of(context).size.height * 0.195,
        padding: const EdgeInsets.all(15),
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
            const CustomDishImage(),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${dishModel.name}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      FoodRating(size: 15, rating: dishModel.averageRating!)
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'By ${dishModel.chef!.firstName!} ${dishModel.chef!.lastName!}',
                    style: Styles.textStyle13.copyWith(
                        color: Colors.grey[500], fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_filled,
                        size: 17,
                        color: Colors.grey[600],
                      ),
                      Text(
                        ' ${dishModel.preparationTime}m',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Icon(
                        Icons.circle,
                        size: 10,
                        color:
                            dishModel.isAvailable! ? Colors.green : Colors.red,
                      ),
                      Text(
                        dishModel.isAvailable!
                            ? ' Available'
                            : ' Not Available',
                        style: TextStyle(
                            color: dishModel.isAvailable!
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${dishModel.price}',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
