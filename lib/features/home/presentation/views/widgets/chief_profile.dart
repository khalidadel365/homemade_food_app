import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../../constants.dart';
import '../../../../../core/utilities/styles.dart';
import '../../../data/models/cheif_model.dart';

class ChefProfile extends StatelessWidget {
  const ChefProfile({super.key, required this.chefModel});

  final ChefModel? chefModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: SizedBox(
            height: MediaQuery.of(context).size.width * 0.06,
            width: MediaQuery.of(context).size.width * 0.06,
            child: CachedNetworkImage(
                fit: BoxFit.cover,
                placeholder: (context, url) => const SpinKitFadingCircle(
                  color: kPrimaryColor,
                  size: 10,
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 15,
                ),
                imageUrl: chefModel?.profilePicUrl ?? ''),
          ),
        ),
        Flexible(
          child: Text(
            '${chefModel?.firstName ?? 'Unknown'} ${chefModel?.lastName ?? ''}',
            style: Styles.textStyle11,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}