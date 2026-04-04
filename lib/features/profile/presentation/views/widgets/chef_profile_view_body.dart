import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/core/utilities/api_constants.dart';
import 'package:homemade_food_app/features/profile/presentation/profile_cubit/profile_cubit.dart';
import 'package:homemade_food_app/features/profile/presentation/profile_cubit/profile_states.dart';

import '../../../../../constants.dart';
import 'chief_rating.dart';
import 'custom_chief_image.dart';

class ChefProfileViewBody extends StatefulWidget {
  const ChefProfileViewBody({super.key, required this.chefId});

  final int chefId;

  @override
  State<ChefProfileViewBody> createState() => _ChefProfileViewBodyState();
}

class _ChefProfileViewBodyState extends State<ChefProfileViewBody> {
  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).fetchProfile(
      token: ApiConstants.token!,
      id: widget.chefId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          return Scaffold(
            backgroundColor: kBackGroundColor,
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        height: 280,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              'https://www.tasteofhome.com/wp-content/uploads/2018/01/Homemade-Pizza_EXPS_FT23_376_EC_120123_3.jpg',
                          placeholder: (context, url) =>
                              const SpinKitFadingCircle(color: kPrimaryColor),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error, color: Colors.red),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 20,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.black),
                            onPressed: () => GoRouter.of(context).pop(),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 200,
                        left: 20,
                        right: 20,
                        child: Container(
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
                                  const CustomChiefImage(),
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
                      ),
                    ],
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 120)),
                const SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      "Chef's Menu",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          // child: AllDishesListView(),
                        );
                      },
                      childCount: 1,
                    ),
                  ),
                ),
              ],
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
