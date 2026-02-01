import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.borderRadius,
    this.text,
    required this.onPressed,
    this.textStyle,
    this.height,
    this.width,
    this.elevation,
    this.verticalPadding,
    this.horizontalPadding,
    this.icon,
  });

  final Color backgroundColor;
  final Icon? icon;
  final double? borderRadius;
  final String? text;
  final TextStyle? textStyle;
  final void Function()? onPressed;
  final double? height;
  final double? width;
  final double? elevation;
  final double? verticalPadding;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(
              vertical: verticalPadding ?? 0,
              horizontal: horizontalPadding ?? 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
          ),
          elevation: elevation,
        ),
        child: _buildButtonContent(),
      ),
    );
  }

  Widget _buildButtonContent() {
    if (icon != null && text != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon!,
          const SizedBox(width: 5),
          Text(text!, style: textStyle),
        ],
      );
    }
    else if (icon != null) {
      return icon!;
    }
    else {
      return Text(
        text ?? '',
        style: textStyle,
      );
    }
  }
}