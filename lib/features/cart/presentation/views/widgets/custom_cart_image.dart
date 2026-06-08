import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../constants.dart';

class CustomCartImage extends StatelessWidget {
  const CustomCartImage({
    super.key,
    required this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.11,
        width: MediaQuery.of(context).size.width * 0.23,
        child: imageUrl != null && imageUrl!.isNotEmpty
            ? CachedNetworkImage(
          fit: BoxFit.cover,
          placeholder: (context, url) => SpinKitFadingCircle(
            color: kPrimaryColor,
          ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: Colors.red,
          ),
          imageUrl: imageUrl!,
        )
            : Container(
          color: Colors.grey.shade100,
          child: const Icon(
            Icons.fastfood,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}