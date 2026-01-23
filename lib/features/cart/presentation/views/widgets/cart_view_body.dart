import 'package:flutter/material.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/core/utilities/styles.dart';
import 'package:homemade_food_app/core/widgets/custom_button.dart';

import 'cart_bottom_nav_bar.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.white,
        shadowColor: Colors.black.withOpacity(0.3),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          'My Basket',
          style: Styles.textStyle17,
        ),
      ),
      body: Text('body'),
      bottomNavigationBar: CartBottomNavBar(),
    );
  }
}


