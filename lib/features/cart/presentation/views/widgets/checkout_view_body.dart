import 'package:flutter/material.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/features/cart/presentation/views/widgets/map_section.dart';
import 'package:homemade_food_app/features/cart/presentation/views/widgets/payment_methods_list_view.dart';
import 'package:homemade_food_app/features/home/presentation/views/widgets/details_options_title.dart';

import '../../../../../core/utilities/styles.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  @override
  @override
  Widget build(BuildContext context) {
    // 3. الرسام بيشوف: لو العلبة لسه فاضية يعرض تحميل، لو مليانة يرسم
    return Scaffold(
        backgroundColor: kBackGroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MapSection(),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal:20, ),
                  height: 70,
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: kSecondaryColor,
                          ),
                          child: Icon(Icons.home,size:25,color: kPrimaryColor,),
                        ),
                        const SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Home'),
                            const SizedBox(height: 3,),
                            Text('123 Nile St,Cairo,Egypt',style: Styles.textStyle13.copyWith(color: Colors.grey[600]),),
                          ],
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Change',
                              style: TextStyle(color: kPrimaryColor),
                            ))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                DetailsOptionsTitle(title: 'Payment Method'),
                PaymentMethodsListView()
              ],
            ),
          ),
        ));
  }
}
