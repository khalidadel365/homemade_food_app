import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/core/utilities/app_router.dart';

import '../../../../../core/models/profile_model.dart';
import '../../../../../core/utilities/styles.dart';
import '../../../../../core/widgets/custom_chief_image.dart';

class ExploreAllChefsListViewItem extends StatelessWidget {
  const ExploreAllChefsListViewItem({
    super.key,
    required this.chefModel,
  });

  final ProfileModel chefModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kChefProfileView, extra: chefModel.userData!.id);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        height: 110,
        child: Row(
          children: [
            CustomChiefImage(
              imageUrl: chefModel.userData?.accountInfo?.profilePicUrl ?? '',
              height: 75,
              width: 75,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          (chefModel.userData?.accountInfo?.firstName == null &&
                                  chefModel.userData?.accountInfo?.lastName ==
                                      null)
                              ? 'Unknown Chef'
                              : '${chefModel.userData?.accountInfo?.firstName ?? ''} ${chefModel.userData?.accountInfo?.lastName ?? ''}'
                                  .trim(),
                          style: Styles.textStyle16
                              .copyWith(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 4),
                      if (chefModel.isVerified ?? false)
                        const Icon(Icons.verified,
                            color: Colors.blue, size: 16),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    chefModel.cuisineSpecialties ?? 'General Cuisine',
                    style: Styles.textStyle14.copyWith(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      chefModel.rating?.toString() ?? '0.0',
                      style: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${chefModel.yearsOfExperience ?? 0}Y EXP',
                    style: Styles.textStyle12.copyWith(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
