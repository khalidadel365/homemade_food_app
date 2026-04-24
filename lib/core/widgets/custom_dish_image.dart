import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constants.dart';

class CustomDishImage extends StatelessWidget {
  const CustomDishImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
  });

  final String imageUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: MediaQuery.of(context).size.width * height,
        width: MediaQuery.of(context).size.width * width,
        child: CachedNetworkImage(
            fit: BoxFit.cover,
            placeholder: (context, url) => SpinKitFadingCircle(
                  color: kPrimaryColor,
                ),
            errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
            imageUrl: imageUrl),
      ),
    );
  }
}
