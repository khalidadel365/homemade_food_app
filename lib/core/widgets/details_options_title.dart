import 'dart:ui';

import 'package:flutter/material.dart';

class DetailsOptionsTitle extends StatelessWidget {
  const DetailsOptionsTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$title',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
