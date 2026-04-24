import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomChiefImage extends StatelessWidget {
  const CustomChiefImage({
    super.key,
    this.height,
    this.width,
    this.imageUrl,
    this.isOnline,
  });

  final double? height;
  final double? width;
  final String? imageUrl;
  final bool? isOnline;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(70)),
          child: Container(
            height: height ?? 75,
            width: width ?? 75,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                  strokeWidth: 2,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.person),
              imageUrl: imageUrl ??
                  'https://cdn.psychologytoday.com/sites/default/files/styles/article-inline-half-caption/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=0hb44OrI',
            ),
          ),
        ),
        if (isOnline != null)
          Positioned(
            bottom: 2,
            right: 2,
            child: Container(
              height: 14,
              width: 14,
              decoration: BoxDecoration(
                color: isOnline! ? Colors.green : Colors.red,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
