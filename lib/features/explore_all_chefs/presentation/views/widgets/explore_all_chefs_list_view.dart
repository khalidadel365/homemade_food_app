import 'package:flutter/material.dart';

import '../../../../../core/models/profile_model.dart';
import 'explore_all_chefs_list_view_item.dart';

class ExploreAllChefsListView extends StatelessWidget {
  const ExploreAllChefsListView({
    super.key,
    required this.chefs,
  });

  final List<ProfileModel> chefs;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return ExploreAllChefsListViewItem(
          chefModel: chefs[index],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 15,
      ),
      itemCount: chefs.length,
    );
  }
}
