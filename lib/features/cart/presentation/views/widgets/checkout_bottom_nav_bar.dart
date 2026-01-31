import 'package:flutter/material.dart';
import '../../../../../constants.dart';

import '../../../../../core/utilities/functions/show_success_payment_overlay.dart';
import '../../../../../core/utilities/styles.dart';

class checkout_bottom_nav_bar extends StatelessWidget {
  const checkout_bottom_nav_bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 20,),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Total Price',
                style: TextStyle(fontSize: 12),
              ),
              Text(
                '540 EGY',
                style: Styles.textStyle18,
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: GestureDetector(
              onTap: () {
                showSuccessOverlay(context);
              },
              child: Container(
                height: 55,
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Place Order',
                      style: Styles.textStyle17.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}