import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';

import '../../../../../core/utilities/app_router.dart';
import '../../../../../core/widgets/custom_textformfield.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
            controller: searchController,
            hintText:
            'search  Craving lasagna, cookies, or anything else...',
            hintTextStyle: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
            ),
            circularRadius: 14,
            verticalPadding: 13,
            horizontalPadding: 20,
            cursorWidth: 1.8,
            cursorHeight: 20,
            maxLines: 1,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kCartScreen);
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: kPrimaryColor,
              size: 30,
            )
        )
      ],
    );
  }
}