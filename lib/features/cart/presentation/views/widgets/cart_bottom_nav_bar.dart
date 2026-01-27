import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utilities/styles.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 15),
      child: GestureDetector(
        onTap: (){

        },
        child: Container(
          height: 60,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30,),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Text(
                'Checkout',
                style: Styles.textStyle17.copyWith(
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal:5,vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  shape: BoxShape.rectangle,
                  color: Colors.white.withOpacity(0.3),
                ),
                child: Text(
                  '150 EGY',
                  style: Styles.textStyle14.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 5,),
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}