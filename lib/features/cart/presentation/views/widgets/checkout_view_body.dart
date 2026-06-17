import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:homemade_food_app/features/cart/presentation/manager/states/cart_states.dart';
import 'package:homemade_food_app/features/cart/presentation/views/widgets/map_section.dart';
import 'package:homemade_food_app/features/cart/presentation/views/widgets/payment_methods_list_view.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../core/utilities/functions/show_success_payment_overlay.dart';
import '../../../../../core/utilities/styles.dart';
import '../../../../../core/widgets/details_options_title.dart';
import '../select_location_view.dart';
import 'checkout_bottom_nav_bar.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartStates>(
      listener: (context, state) {
        if (state is CreateOrderLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(color: kPrimaryColor),
            ),
          );
        } else if (state is CreateOrderFailureState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is CreateOrderSuccessState) {
          Navigator.pop(context);
          showSuccessOverlay(context);
        }
      },
      builder: (context, state) {
        var cubit = context.read<CartCubit>();
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: kBackGroundColor,
              shadowColor: Colors.black.withOpacity(0.3),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              title: Text(
                'Checkout',
                style: Styles.textStyle17,
              ),
            ),
            bottomNavigationBar: const checkout_bottom_nav_bar(),
            backgroundColor: kBackGroundColor,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MapSection(),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                              child: const Icon(
                                Icons.home,
                                size: 25,
                                color: kPrimaryColor,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('Delivery Address', style: TextStyle(fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 3),
                                  Text(
                                    cubit.deliveryAddress,
                                    style: Styles.textStyle13.copyWith(color: Colors.grey[600]),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            TextButton(
                                onPressed: () async {
                                  if (cubit.deliveryLatitude != 0.0) {
                                    final result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SelectLocationView(
                                          initialPosition: LatLng(cubit.deliveryLatitude, cubit.deliveryLongitude),
                                        ),
                                      ),
                                    );

                                    if (result != null && result is Map<String, dynamic>) {
                                      cubit.updateOrderAddress(
                                        address: result['address'],
                                        lat: result['lat'],
                                        lng: result['lng'],
                                      );
                                    }
                                  }
                                },
                                child: const Text(
                                  'Change',
                                  style: TextStyle(color: kPrimaryColor),
                                ))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const DetailsOptionsTitle(title: 'Payment Method'),
                    const PaymentMethodsListView()
                  ],
                ),
              ),
            ));
      },
    );
  }
}