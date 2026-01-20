import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utilities/styles.dart';

class CustomAddOnOptionButton extends StatelessWidget {
  const CustomAddOnOptionButton({
    super.key,
    required this.onTap,
    required this.isSelected,
  });

  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 58,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: isSelected ? kSecondaryColor : Colors.white,
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
                  shape: BoxShape.rectangle,
                  color: isSelected ? kPrimaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(width: 1, color: Colors.grey.shade300)),
            ),
            const SizedBox(
              width: 10,
            ),
            Text('Extra Cheese', style: Styles.textStyle14),
            const Spacer(),
            Text(
              '+150 EGY',
              style: Styles.textStyle14.copyWith(color: kPrimaryColor),
            )
          ],
        ),
      ),
    );
  }
}
