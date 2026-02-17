import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:homemade_food_app/features/home/presentation/views/widgets/fresh_nearby_list_view.dart';

import '../../../../../constants.dart';
import 'chief_rating.dart';
import 'custom_chief_image.dart';

class ChefProfileViewBody extends StatelessWidget {
  const ChefProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                    imageUrl: 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Homemade-Pizza_EXPS_FT23_376_EC_120123_3.jpg',
                    placeholder: (context, url) => const SpinKitFadingCircle(color: kPrimaryColor),
                    errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
                  ),
                ),

                Positioned(
                  top: 40,
                  left: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Maria Homemade Delights',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 4),
                                  const ChiefRating(),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Authentic Egyptian home-cooked meals made with love and fresh organic ingredients specializing in traditional recipes passed down through generations.',
                          style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.4),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 120),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Chef's Menu",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: FreshNearbyListView(),
                  );
                },
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}