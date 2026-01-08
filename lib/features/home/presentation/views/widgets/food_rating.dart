import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utilities/styles.dart';

class FoodRating  extends StatelessWidget {
  const FoodRating ({super.key,this.mainAxisAlignment = MainAxisAlignment.start, required this.rating,});
  final MainAxisAlignment mainAxisAlignment;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F), size: 14,
        ),
        const SizedBox(width: 6),
        Text(
          '$rating',
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}