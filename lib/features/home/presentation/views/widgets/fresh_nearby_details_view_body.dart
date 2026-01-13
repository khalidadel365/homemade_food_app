import 'package:flutter/material.dart';
import 'package:homemade_food_app/constants.dart';

import 'order_details_body.dart';

class FreshNearbyDetailsViewBody extends StatelessWidget {
  const FreshNearbyDetailsViewBody({super.key});

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
            child: Image.network(
              'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg',
              fit: BoxFit.cover,
            ),
          ),
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
              child: const OrderDetailsBody(),
            ),
          ),
        ],
      ),
    );
  }
}