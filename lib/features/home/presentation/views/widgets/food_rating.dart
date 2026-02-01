import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homemade_food_app/features/home/data/models/cheif_model.dart';
import 'package:homemade_food_app/features/home/data/models/dish_model.dart';

class FoodRating extends StatelessWidget {
  const FoodRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.size,
    required this.rating,
  });
  final num rating ;
  final MainAxisAlignment mainAxisAlignment;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: const Color(0xffFFDD4F),
          size: size,
        ),
        const SizedBox(width: 6),
        Text(
          '${rating}',
          style: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.bold,
              color: Colors.black
          ),
        ),
      ],
    );
  }
}
