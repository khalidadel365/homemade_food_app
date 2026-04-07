import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.size,
    required this.rating,
    required this.backgroundColor,
  });

  final num rating;
  final MainAxisAlignment mainAxisAlignment;
  final double size;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            FontAwesomeIcons.solidStar,
            color: Colors.yellow[700],
            size: size,
          ),
          const SizedBox(width: 8),
          Text(
            '$rating',
            style: TextStyle(
                fontSize: size,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ],
      ),
    );
  }
}
