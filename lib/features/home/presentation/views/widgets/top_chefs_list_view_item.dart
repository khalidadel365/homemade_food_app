import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/core/models/cheif_model.dart';
import 'package:homemade_food_app/core/utilities/app_router.dart';

import '../../../../../core/utilities/styles.dart';
import '../../../../../core/widgets/custom_chief_image.dart';
import '../../../../../core/widgets/custom_rating.dart';

class TopChefsListViewItem extends StatelessWidget {
  const TopChefsListViewItem({super.key, required this.chefModel});

  final ChefModel chefModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kChefProfileView, extra: chefModel.id);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              spreadRadius: 0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomChiefImage(
                height: 63,
                width: 68,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                '${chefModel.firstName} ${chefModel.lastName}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle15.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                chefModel.cuisineSpecialties ?? 'Chef',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle12.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.grey[400]),
              ),
              const SizedBox(
                height: 7,
              ),
              CustomRating(
                size: 13,
                rating: chefModel.rating?.toDouble() ?? 0.0,
                backgroundColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
