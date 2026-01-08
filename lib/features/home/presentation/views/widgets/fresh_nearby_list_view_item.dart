import 'package:flutter/material.dart';
import 'package:homemade_food_app/core/utilities/styles.dart';
import 'package:homemade_food_app/core/widgets/custom_button.dart';

import '../../../../../constants.dart';
import 'chief_profile.dart';
import 'custom_fresh_nearby_image.dart';
import 'food_rating.dart';

class FreshNearbyListViewItem extends StatelessWidget {
  const FreshNearbyListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.19,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          const CustomFreshNearbyImage(),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 60.0),
                  child: Text(
                    'Homemade Pepproni Pizza',
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle17,
                    maxLines: 2,

                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 60.0),
                  child: Text(
                    'Made with fresh dough and homemade sauce',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 60.0),
                  child: Row(
                    children: [
                      CheifProfile(),
                      Spacer(),
                      FoodRating(
                        rating: 5,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                //no padding here
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        '\$18.00',
                        style: Styles.textStyle17.copyWith(
                            fontWeight: FontWeight.w600, color: kPrimaryColor),
                      ),
                      Spacer(),
                      CustomButton(
                        height: 30,
                        width: 30,
                        backgroundColor: kSecondaryColor,
                        borderRadius: 60,
                        text: '+',
                        onPressed: (){},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
