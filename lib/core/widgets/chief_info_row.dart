import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../constants.dart';
import '../models/cheif_model.dart';
import '../utilities/styles.dart';

class ChefInfoRow extends StatelessWidget {
  const ChefInfoRow({super.key, required this.chefModel});

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
                  size: 20,
                ),
                imageUrl: chefModel?.profilePicUrl ?? ''),
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          chefModel?.fullName ??
              ((chefModel?.firstName != null || chefModel?.lastName != null)
                  ? 'by ${chefModel?.firstName ?? ''} ${chefModel?.lastName ?? ''}'.trim()
                  : 'Unknown'),
          style: Styles.textStyle13.copyWith(
            color: Colors.black,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}