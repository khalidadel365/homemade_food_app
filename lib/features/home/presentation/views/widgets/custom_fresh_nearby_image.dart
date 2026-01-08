import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../constants.dart';

class CustomFreshNearbyImage extends StatelessWidget {
  const CustomFreshNearbyImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: SizedBox(
        height: MediaQuery.of(context).size.width*0.4,
        width: MediaQuery.of(context).size.width*0.25,
        child: CachedNetworkImage(
            fit: BoxFit.fill,
            placeholder: (context, url) => SpinKitFadingCircle(color: kPrimaryColor,),
            errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red,),
            imageUrl: 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Homemade-Pizza_EXPS_FT23_376_EC_120123_3.jpg'),
      ),
    );
  }
}