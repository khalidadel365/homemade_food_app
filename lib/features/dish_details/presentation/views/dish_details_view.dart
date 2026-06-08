import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_food_app/core/utilities/functions/show_snack_bar.dart';
import 'package:homemade_food_app/features/dish_details/data/repos/dish_details_repo_imp.dart';
import 'package:homemade_food_app/features/dish_details/presentation/manager/cubit/dish_details_cubit.dart';
import 'package:homemade_food_app/features/dish_details/presentation/views/widgets/dish_details_bottom_nav_bar.dart';
import 'package:homemade_food_app/features/dish_details/presentation/views/widgets/dish_details_view_body.dart';

import '../../../../core/utilities/service_locator.dart';
import '../../../cart/data/models/cart_item_model.dart';
import '../../../cart/presentation/manager/cubit/cart_cubit.dart';
import '../../../cart/presentation/manager/states/cart_states.dart';
import '../manager/states/dish_details_states.dart';

class DishDetailsView extends StatelessWidget {
  const DishDetailsView({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      FetchDishDetailsCubit(getIt.get<DishDetailsRepoImp>())
        ..fetchDishDetails(id: id),
      child: Scaffold(
        body: const DishDetailsViewBody(),
        bottomNavigationBar: BlocListener<CartCubit, CartStates>(
          bloc: getIt<CartCubit>(),
          listener: (context, cartState) {
            if (cartState is CartChefConflictState) {
              showSnackBar(
                context: context,
                message: cartState.errorMessage,
                color: Colors.red,
              );
            }
          },
          child: BlocBuilder<FetchDishDetailsCubit, FetchDishDetailsState>(
            builder: (context, state) {
              if (state is FetchDishDetailsSuccessState) {
                var cubit = context.read<FetchDishDetailsCubit>();
                double finalPrice = cubit.calculateTotalPrice(state.dish.price ?? '0');

                return DishDetailsBottomNavBar(
                  totalPrice: finalPrice,
                  onAddToCart: () {
                    var dish = state.dish;

                    bool hasVarieties = dish.varietySections != null &&
                        dish.varietySections!.isNotEmpty;

                    if (hasVarieties && cubit.selectedOption == null) {
                      showSnackBar(
                          context: context,
                          message: 'Please select an option before adding to cart.',
                          color: Colors.red);
                    } else {
                      getIt<CartCubit>().addToCart(
                        CartItemModel(
                          dish: dish,
                          selectedOption: cubit.selectedOption,
                          quantity: cubit.quantity,
                        ),
                      );

                      if (getIt<CartCubit>().state is! CartChefConflictState) {
                        showSnackBar(
                          context: context,
                          message: 'Item added to cart successfully!',
                          color: Colors.green,
                        );
                      }
                    }
                  },
                );
              }
              return DishDetailsBottomNavBar(totalPrice: 0, onAddToCart: null);
            },
          ),
        ),
      ),
    );
  }
}