import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utilities/custom_icon.dart';
import '../../../../../core/utilities/styles.dart';

class CustomProfileButton extends StatelessWidget {
  CustomProfileButton({
    super.key, required this.icon, required this.title,this.iconSize, required this.onTap
  });
  final IconData icon;
  final String title;
  double? iconSize;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        padding:
        const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle),
        child: Row(
          children: [
            CustomIcon(
                icon: icon,
                iconSize: iconSize??20,
                height: 70,
                width: 40,
                background: kSecondaryColor,
                iconColor: kPrimaryColor),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: Styles.textStyle16
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}