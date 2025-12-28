import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homemade_food_app/core/utilities/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.borderRadius,
    required this.text,
    required this.onPressed,
    required this.textStyle,
  });

  final Color backgroundColor;

  final Color textColor;

  final double? borderRadius;

  final String text;
  final TextStyle textStyle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const HomeView()),
          // );
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          elevation: 4,
        ),
        child: Text(
          "$text",
          style: textStyle,
        ),
      ),
    );
  }
}
