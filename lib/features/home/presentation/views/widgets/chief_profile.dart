import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:homemade_food_app/features/home/data/models/cheif_model.dart';

import '../../../../../constants.dart';
import '../../../../../core/utilities/styles.dart';

class ChefProfile extends StatelessWidget {
  const ChefProfile({super.key, required this.chefModel});

  final ChefModel? chefModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: SizedBox(
            height: MediaQuery.of(context).size.width * 0.06,
            width: MediaQuery.of(context).size.width * 0.06,
            child: CachedNetworkImage(
                fit: BoxFit.fill,
                placeholder: (context, url) => SpinKitFadingCircle(
                      color: kPrimaryColor,
                    ),
                errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                imageUrl: chefModel?.profilePicUrl ?? ''),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '${chefModel?.firstName ?? 'Unknown'} ${chefModel?.lastName ?? ''}',
          style: Styles.textStyle11,
        ),
      ],
    );
  }
}
