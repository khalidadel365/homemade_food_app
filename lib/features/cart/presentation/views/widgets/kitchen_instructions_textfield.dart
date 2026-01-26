import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utilities/styles.dart';

class KitchenInstructionsTextfield extends StatelessWidget {
  const KitchenInstructionsTextfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      cursorHeight: 18,
      style: Styles.textStyle13,
      maxLines: 2,
      decoration: InputDecoration(
        hintText: 'Add note for the cheif (optional), e.g. allergies, spice level...',
        hintStyle: TextStyle(
            fontSize: 13,
            color: Colors.grey
        ),
        filled: true,
        fillColor: Colors.grey[100],
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey.shade300
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300
          ),
          borderRadius: BorderRadius.circular(10),
        )
      ),
    );
  }
}
