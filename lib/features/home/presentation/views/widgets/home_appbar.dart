import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utilities/app_router.dart';
import '../../../../../core/utilities/styles.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: kPrimaryColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deliver to',
                  style: Styles.textStyle14.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  'Maadi, Cairo',
                  style:
                      Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kCartScreen);
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: kPrimaryColor,
              size: 25,
            ))
      ],
    );
  }
}
