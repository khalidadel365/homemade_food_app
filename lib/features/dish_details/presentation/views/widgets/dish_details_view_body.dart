import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/features/dish_details/presentation/manager/cubit/dish_details_cubit.dart';
import 'package:homemade_food_app/features/dish_details/presentation/manager/states/dish_details_states.dart';
import 'dish_info_section.dart';
class DishDetailsViewBody extends StatelessWidget {
  const DishDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FetchDishDetailsCubit, FetchDishDetailsState>(
        builder: (context, state) {
          if (state is FetchDishDetailsSuccessState) {
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 280,
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error, color: Colors.red,
                    ),
                    placeholder: (context, url) => SpinKitFadingCircle(
                      color: kPrimaryColor,
                    ),
                    //imageUrl: state.dish.imageUrl ?? '',
                    imageUrl: 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Homemade-Pizza_EXPS_FT23_376_EC_120123_3.jpg',
                  ),
                ),
                Positioned(
                  top: 22,
                  left: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => GoRouter.of(context).pop(),
                    ),
                  ),
                ),
                Positioned(
                  top: 240,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: kBackGroundColor,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                    ),
                    child: DishInfoSection(
                      dishModel: state.dish,
                    ),
                  ),
                ),
              ],
            );
          } else if (state is FetchDishDetailsFailureState) {
            return Center(child: Text(state.errMessage));
          } else {
            return Center(
              child: SpinKitPulse(size: 45, color: kPrimaryColor),
            );
          }
        },
      ),
    );
  }
}
