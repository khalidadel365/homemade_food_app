import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/features/home/data/models/dish_model.dart';

import 'order_details_body.dart';

class FreshNearbyDetailsViewBody extends StatelessWidget {
  const FreshNearbyDetailsViewBody({super.key, required this.dishModel});
  final DishModel dishModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 280,
            child: CachedNetworkImage(
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red,),
                placeholder: (context, url) => SpinKitFadingCircle(color: kPrimaryColor,),
                imageUrl: 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Homemade-Pizza_EXPS_FT23_376_EC_120123_3.jpg',
          )
            ,),
          Positioned(
            top: 22,
            left: 10,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
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
              child:  OrderDetailsBody(
                dishModel: dishModel,
              ),
            ),
          ),
        ],
      ),
    );
  }
}