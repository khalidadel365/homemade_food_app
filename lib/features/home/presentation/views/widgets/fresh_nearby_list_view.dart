import 'package:flutter/material.dart';

import 'fresh_nearby_list_view_item.dart';

class FreshNearbyListView extends StatelessWidget {
  const FreshNearbyListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context,index)=> FreshNearbyListViewItem(),
          separatorBuilder: (context,index)=>const SizedBox(height: 10,),
          itemCount: 8),
    );
  }
}

