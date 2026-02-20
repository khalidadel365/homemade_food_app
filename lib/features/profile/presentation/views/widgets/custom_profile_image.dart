import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({
    super.key,
    required this.profileImage
  });
  final String profileImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(70)),
          child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageUrl: '${profileImage}')
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(70)),
          child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kPrimaryColor,
              ),
              child: Icon(
                color: Colors.white,
                Icons.edit,
                size: 17,
              )
          ),
        ),
      ],
    );
  }
}