import 'package:flutter/material.dart';

class ChiefRating extends StatelessWidget {
  const ChiefRating({
    super.key,
    required this.rating,
    required this.totalReviews,
  });

  final double rating;
  final int totalReviews;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.amberAccent,
          size: 17,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '${rating}',
          style: TextStyle(fontSize: 12),
        ),
        const Spacer(),
        Text(
          (totalReviews == 0) ? '0 reviews' : '$totalReviews+ reviews',
          style: TextStyle(color: Colors.grey[500], fontSize: 12),
        ),
      ],
    );
  }
}
