import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../../constants.dart';
import '../../../../../core/utilities/styles.dart';

class CheifProfile extends StatelessWidget {
  const CheifProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect (
          borderRadius: BorderRadius.circular(50),
          child: SizedBox(
            height: MediaQuery.of(context).size.width*0.06,
            width: MediaQuery.of(context).size.width*0.06,
            child: CachedNetworkImage(
                fit: BoxFit.fill,
                placeholder: (context, url) => SpinKitFadingCircle(color: kPrimaryColor,),
                errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red,),
                imageUrl: 'https://static.vecteezy.com/system/resources/previews/025/267/741/non_2x/male-chef-portrait-side-view-suitable-for-avatar-social-media-profile-photo-graphic-vector.jpg'),
          ),
        ),
        const SizedBox(width: 5,),
        Text("Mario's oven",style: Styles.textStyle11),
      ],
    );
  }
}