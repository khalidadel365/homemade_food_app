import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/fresh_nearby_dishes_cubit/fresh_nearby_dishes_cubit.dart';
import '../../manager/fresh_nearby_dishes_cubit/fresh_nearby_dishes_states.dart';
import 'fresh_nearby_list_view_item.dart';

class FreshNearbyListView extends StatelessWidget {
  const FreshNearbyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FreshNearbyDishesCubit, FreshNearbyDishesState>(
      builder: (context, state) {
        if (state is FreshNearbyDishesSuccess) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => FreshNearbyListViewItem(
              dishModel: state.dishes[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: state.dishes.length,
          );
        } else if (state is FreshNearbyDishesFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}