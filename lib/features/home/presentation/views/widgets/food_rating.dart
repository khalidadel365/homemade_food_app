import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FoodRating extends StatelessWidget {
  const FoodRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
    required this.size,
  });

  final MainAxisAlignment mainAxisAlignment;
  final double rating;
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
          '$rating',
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
