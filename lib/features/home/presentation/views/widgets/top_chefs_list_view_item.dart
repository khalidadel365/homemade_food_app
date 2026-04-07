import 'package:flutter/material.dart';

import '../../../../../core/utilities/styles.dart';
import '../../../../../core/widgets/custom_chief_image.dart';
import '../../../../../core/widgets/custom_rating.dart';

class TopChefsListViewItem extends StatelessWidget {
  const TopChefsListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomChiefImage(
            height: 63,
            width: 68,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Yuki Tanaka',
            style: Styles.textStyle15.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            'Sushi Specialist',
            style: Styles.textStyle12
                .copyWith(fontWeight: FontWeight.bold, color: Colors.grey[400]),
          ),
          const SizedBox(
            height: 7,
          ),
          const CustomRating(
              size: 13, rating: 2.95, backgroundColor: Colors.white)
        ],
      ),
    );
  }
}
