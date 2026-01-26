import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utilities/styles.dart';

class PreparationTimeSection extends StatelessWidget {
  const PreparationTimeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      width: double.infinity,
      height: 60,
      color: Color(0xffFFF7ED),
      child: Row(
        children: [
          const Icon(
            Icons.access_time_filled,
            color: kPrimaryColor,
            size: 25,),
          const SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Preparation Time',
                style: Styles.textStyle14.copyWith(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600
                ),
              ),
              Text(
                  '35 - 45 mins',
                  style: Styles.textStyle14
              ),
            ],
          )
        ],
      ),
    );
  }
}