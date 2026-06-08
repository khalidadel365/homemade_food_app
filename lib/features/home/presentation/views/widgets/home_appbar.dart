import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/core/utilities/styles.dart';

import '../../../../../constants.dart';
import '../../../../../core/utilities/app_router.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Home',
          style: Styles.textStyle18,
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
