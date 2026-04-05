import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homemade_food_app/constants.dart';

import '../../../../../core/utilities/styles.dart';

class AvailabilitySection extends StatelessWidget {
  const AvailabilitySection({
    super.key,
    required this.isAvailable,
    required this.onChanged,
  });

  final bool isAvailable;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Show available dishes only',
          style: Styles.textStyle16.copyWith(
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        const Spacer(),
        Transform.scale(
          scale: 0.8,
          child: CupertinoSwitch(
            value: isAvailable,
            activeColor: kPrimaryColor,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
