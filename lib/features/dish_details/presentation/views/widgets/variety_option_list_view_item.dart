import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utilities/styles.dart';

class VarietyOptionItem extends StatelessWidget {
  const VarietyOptionItem({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.name,
    this.price = "0.00",
  });

  final bool isSelected;
  final VoidCallback onTap;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 58,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isSelected ? kSecondaryColor : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? kPrimaryColor : Colors.grey.shade200,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              height: 21,
              width: 21,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 1.3),
                shape: BoxShape.circle,
                color: isSelected ? kPrimaryColor : Colors.white,
              ),
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
              ),
            ),
            const SizedBox(width: 10),
            Text(name, style: Styles.textStyle14),
            const Spacer(),
            if (price != "0.00")
              Text("+$price EGY",
                  style: TextStyle(color: kPrimaryColor, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
