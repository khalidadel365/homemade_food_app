import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../constants.dart';
import '../../../../../core/utilities/styles.dart';
import '../../../../../core/widgets/all_dishes_list_view.dart';
import '../../../../../core/widgets/custom_search_text_field.dart';
import '../../manager/cubit/all_dishes_cubit.dart';
import '../../manager/states/all_dishes_states.dart';
import 'categories_list_view.dart';

class AllDishesViewBody extends StatefulWidget {
  const AllDishesViewBody({super.key});

  @override
  State<AllDishesViewBody> createState() => _AllDishesViewBodyState();
}

class _AllDishesViewBodyState extends State<AllDishesViewBody> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;


    if (maxScroll - currentScroll <= 100) {
      context.read<FetchAllDishesCubit>().fetchAllDishes(
        isFromPagination: true,
        search: searchController.text,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchTextField(
                searchController: searchController,
              ),
              const SizedBox(height: 15),
              const CategoriesListView(),
              const SizedBox(height: 18),
              Row(children: [
                Text('All Dishes ', style: Styles.textStyle20),
                const SizedBox(width: 3.5),
                const Icon(FontAwesomeIcons.fire,
                    color: kPrimaryColor, size: 18)
              ]),
              const SizedBox(height: 18),
              BlocBuilder<FetchAllDishesCubit, FetchAllDishesState>(
                buildWhen: (previous, current) =>
                current is FetchAllDishesSuccess ||
                    current is FetchAllDishesLoading ||
                    current is FetchAllDishesFailure,
                builder: (context, state) {
                  if (state is FetchAllDishesSuccess) {
                    if (state.dishes.isEmpty) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: const Center(
                          child: Text(
                            "No dishes found!",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ),
                      );
                    }
                    return AllDishesListView(dishes: state.dishes);
                  } else if (state is FetchAllDishesFailure) {
                    return Center(child: Text(state.errMessage));
                  } else {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: SpinKitPulse(size: 45, color: kPrimaryColor),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
