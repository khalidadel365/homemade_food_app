import 'package:flutter/material.dart';

class ChiefRating extends StatelessWidget {
  const ChiefRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.amberAccent,
          size: 17,
        ),
        const SizedBox(width: 5,),
        Text(
          '4.8',style: TextStyle(
            fontSize: 12
        ),
        ),
        const Spacer(),
        Text(
          '(120+ reviews)',style: TextStyle(
            color: Colors.grey[500],
            fontSize: 12
        ),
        ),
      ],
    );
  }
}