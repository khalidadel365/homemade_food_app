import 'package:flutter/material.dart';

import '../../../../../core/utilities/styles.dart';

class FoodInfoRow extends StatelessWidget {
  const FoodInfoRow({
    super.key,
    required this.prepTime,
    required this.calories,
  });
  final String prepTime;
  final String calories;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            shape: BoxShape.rectangle,
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                        color: Colors.yellow.shade100,
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.timelapse_sharp,
                      color: Colors.yellow.shade800,
                      size: 20,
                    )
                ),
                SizedBox(width: 8,),
                Text(
                  '25m',
                  style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(width: 5,),
                Text(
                  'Prep time',
                  style: Styles.textStyle13,
                ),
              ],
            ),
          ),
        ),
        Spacer(),
        Container(
          height: 80,
          width: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            shape: BoxShape.rectangle,
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.local_fire_department,
                      color: Colors.red.shade600,
                      size: 20,
                    )
                ),
                SizedBox(width: 8,),
                Text(
                  '350',
                  style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.bold
                  ),),
                const SizedBox(width: 5,),
                Text(
                  'Kcal',
                  style: Styles.textStyle13
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}