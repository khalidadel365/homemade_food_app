import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/models/cheif_model.dart';
import '../../../../../core/utilities/styles.dart';
import '../../../../../core/widgets/chief_info_row.dart';
import '../../../../../core/widgets/custom_rating.dart';

class FeaturedDishListViewItem extends StatelessWidget {
  const FeaturedDishListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
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
                  'https://www.tasteofhome.com/wp-content/uploads/2018/01/Homemade-Pizza_EXPS_FT23_376_EC_120123_3.jpg',
                  height: 165,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomRating(
                    backgroundColor: Colors.white, size: 14, rating: 5),
              ),
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
