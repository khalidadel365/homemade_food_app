import 'package:flutter/material.dart';
import 'package:homemade_food_app/core/models/dish_model.dart';

import '../../../../../constants.dart';
import '../../../../../core/utilities/styles.dart';
import '../../../../../core/widgets/custom_dish_image.dart';

class NewArrivalsListViewItem extends StatelessWidget {
  const NewArrivalsListViewItem({
    super.key, required this.dish,
  });
  final DishModel dish;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomDishImage(
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
                    dish.name ?? 'No Name',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle17
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    dish.chefName ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle12.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'EGY ${dish.price ?? '0.0'}',
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
    );
  }
}