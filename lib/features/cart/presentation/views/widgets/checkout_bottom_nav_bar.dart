import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_food_app/core/utilities/api_constants.dart';
import '../../../../../constants.dart';
import '../../../../../core/utilities/styles.dart';
import '../../manager/cubit/cart_cubit.dart';
import '../../manager/states/cart_states.dart';

class checkout_bottom_nav_bar extends StatelessWidget {
  const checkout_bottom_nav_bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(
      builder: (context, state) {
        var cubit = context.read<CartCubit>();
        double total = 0.0;
        for (var item in cubit.cartItems) {
          total += item.totalPrice;
        }

        return Container(
          width: double.infinity,
          height: 100,
          decoration: const BoxDecoration(color: Colors.white),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
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
                    '$total EGP',
                    style: Styles.textStyle18,
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    String token = ApiConstants.token!;
                    print("TOKEN => ${ApiConstants.token}");
                    cubit.createOrder(token: token);
                  },
                  child: Container(
                    height: 55,
                    padding: const EdgeInsets.symmetric(
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
      },
    );
  }
}