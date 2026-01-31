import 'package:flutter/material.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/core/utilities/styles.dart';
import 'package:homemade_food_app/features/cart/presentation/views/widgets/cart_list_view_item.dart';
import 'package:homemade_food_app/features/cart/presentation/views/widgets/payment_summary_section.dart';
import 'package:homemade_food_app/features/cart/presentation/views/widgets/preparation_time_section.dart';

import 'cart_bottom_nav_bar.dart';
import 'cart_list_view.dart';
import 'kitchen_instructions_textfield.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBackGroundColor,
        shadowColor: Colors.black.withOpacity(0.3),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          'My Cart',
          style: Styles.textStyle17,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PreparationTimeSection(),
          const SizedBox(height: 10,),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: const Text(
              'Items Added',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const CartListView(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Kitchen Instructions',style: TextStyle(
                  fontSize:16,
                  fontWeight: FontWeight.bold,
                ),),
                const SizedBox(height: 15,),
                KitchenInstructionsTextfield(),
                const SizedBox(height: 15,),
                const Text('Payment Summary',style: TextStyle(
                  fontSize:16,
                  fontWeight: FontWeight.bold,
                ),),
                const SizedBox(height: 15,),
                PaymentSummarySection(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CartBottomNavBar(),
    );
  }
}


