import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/core/utilities/app_router.dart';
import 'package:homemade_food_app/core/widgets/all_dishes_list_view_item.dart';
import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_chief_image.dart';
import '../../manager/cubit/profile_cubit.dart';
import '../../manager/states/profile_states.dart';
import 'chief_rating.dart';

class ChefProfileViewBody extends StatelessWidget {
  const ChefProfileViewBody({super.key, required this.chefId});

  final int chefId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          return Scaffold(
            backgroundColor: kBackGroundColor,
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 15),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.black),
                            onPressed: () =>
                                GoRouter.of(context).go(AppRouter.kMainView),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              )
                            ],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  CustomChiefImage(
                                    isOnline: state.profileModel.isOnline,
                                    imageUrl: state.profileModel.userData
                                            ?.accountInfo?.profilePicUrl ??
                                        '',
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${state.profileModel.userData?.accountInfo?.firstName ?? ""} ${state.profileModel.userData?.accountInfo?.lastName ?? ""}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),
                                        ChiefRating(
                                          rating:
                                              state.profileModel.rating ?? 0,
                                          totalReviews:
                                              state.profileModel.totalReviews ??
                                                  0,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 12),
                              Text(
                                state.profileModel.bio ??
                                    "No bio available for this chef.",
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    height: 1.4),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 30)),
                  const SliverToBoxAdapter(
                    child: Text(
                      "Chef's Menu",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 15)),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final dish = state.profileModel.dishes![index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: AllDishesListViewItem(
                            dishModel: dish,
                          ),
                        );
                      },
                      childCount: state.profileModel.dishes?.length ?? 0,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is ProfileFailure) {
          return Scaffold(body: Center(child: Text(state.errMessage)));
        } else {
          return const Scaffold(
            body: Center(child: SpinKitPulse(color: kPrimaryColor, size: 45)),
          );
        }
      },
    );
  }
}
