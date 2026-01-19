import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utilities/styles.dart';

class CustomSelectionOptionButton extends StatelessWidget {
  const CustomSelectionOptionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 58,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(6),
            height: 21,
            width: 21,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor,
            ),
            child: Container(
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'Medium',
            style: Styles.textStyle14,
          )
        ],
      ),
    );
  }
}