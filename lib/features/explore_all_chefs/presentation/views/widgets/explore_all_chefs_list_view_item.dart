import 'package:flutter/material.dart';

import '../../../../../core/utilities/styles.dart';
import '../../../../../core/widgets/custom_chief_image.dart';

class ExploreAllChefsListViewItem extends StatelessWidget {
  const ExploreAllChefsListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white),
      height: 100,
      child: Row(
        children: [
          CustomChiefImage(
            height: 75,
            width: 75,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        'Chef Elena Rodriguez',
                        style: Styles.textStyle16
                            .copyWith(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.verified,
                        color: Colors.blue, size: 16),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Italian, Mediterranean',
                  style: Styles.textStyle14
                      .copyWith(color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star,
                      color: Colors.green, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    '4.8',
                    style: Styles.textStyle14
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '12Y EXP',
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
    );
  }
}
