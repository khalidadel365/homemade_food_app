import 'package:flutter/material.dart';
import 'package:homemade_food_app/core/utilities/styles.dart';

import '../../manager/cubit/explore_all_chefs_cubit.dart';
import '../../manager/states/explore_all_chefs_states.dart';
import 'explore_all_chefs_list_view.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreAllChefsViewBody extends StatefulWidget {
  const ExploreAllChefsViewBody({super.key});

  @override
  State<ExploreAllChefsViewBody> createState() =>
      _ExploreAllChefsViewBodyState();
}

class _ExploreAllChefsViewBodyState extends State<ExploreAllChefsViewBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<ExploreAllChefsCubit>().fetchAllChefs();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;

    if (maxScroll - currentScroll <= 100) {
      context.read<ExploreAllChefsCubit>().fetchAllChefs(
            isFromPagination: true,
          );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Rated Chefs',
              style: Styles.textStyle25,
            ),
            const SizedBox(height: 5),
            Text(
              'Local masters cooking for your family.',
              style: Styles.textStyle15.copyWith(color: Colors.grey[500]),
            ),
            const SizedBox(height: 20),
            BlocBuilder<ExploreAllChefsCubit, ExploreAllChefsState>(
              builder: (context, state) {
                if (state is ExploreAllChefsSuccess) {
                  if (state.chefs.isEmpty) {
                    return const Center(child: Text("No Chefs found"));
                  }
                  return ExploreAllChefsListView(chefs: state.chefs);
                } else if (state is ExploreAllChefsFailure) {
                  return Center(child: Text(state.errMessage));
                } else {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 350),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
            BlocBuilder<ExploreAllChefsCubit, ExploreAllChefsState>(
              builder: (context, state) {
                if (state is ExploreAllChefsSuccess &&
                    !state.hasReachedMax &&
                    context.read<ExploreAllChefsCubit>().isPaginationLoading) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
