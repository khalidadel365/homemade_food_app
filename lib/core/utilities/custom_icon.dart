import 'package:flutter/cupertino.dart';

class CustomIcon extends StatelessWidget {
  CustomIcon({super.key, required this.icon,required this.height,required this.width, required this.background, required this.iconColor, this.iconSize});
  final IconData icon;
  final double height;
  final double width;
  final Color background;
  final Color iconColor;
  double? iconSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: background,
      ),
      child: Icon(
        icon,
        size: iconSize ?? 20,
        color: iconColor,
      ),
    );
  }
}
