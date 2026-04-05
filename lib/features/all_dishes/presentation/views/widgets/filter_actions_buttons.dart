import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utilities/styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class FilterActionsButtons extends StatelessWidget {
  const FilterActionsButtons({
    super.key,
    required this.onReset,
    required this.onApply,
  });

  final VoidCallback onReset;
  final VoidCallback onApply;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
              text: 'Reset',
              textStyle: Styles.textStyle16
                  .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
              borderColor: kPrimaryColor,
              backgroundColor: Colors.white,
              height: 60,
              borderRadius: 12,
              onPressed: onReset),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: CustomButton(
              text: 'Apply Filters',
              textStyle: Styles.textStyle16
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              backgroundColor: kPrimaryColor,
              borderColor: Colors.white,
              height: 60,
              borderRadius: 12,
              onPressed: onApply),
        ),
      ],
    );
  }
}
