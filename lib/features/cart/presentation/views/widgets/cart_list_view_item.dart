import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utilities/styles.dart';
import '../../../data/models/cart_item_model.dart';
import '../../manager/cubit/cart_cubit.dart';
import 'custom_cart_image.dart';

class CartListViewItem extends StatelessWidget {
  const CartListViewItem({super.key, required this.cartItem});

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    var cartCubit = context.read<CartCubit>();

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCartImage(imageUrl: cartItem.dish.imageUrl),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        cartItem.dish.name ?? 'Unknown Dish',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle14
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      '${cartItem.totalPrice.toStringAsFixed(0)} EGP',
                      style: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                if (cartItem.selectedVarieties.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: cartItem.selectedVarieties.values.map((option) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Text(
                          option.name ?? '',
                          style: Styles.textStyle11.copyWith(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                  ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        cartCubit.removeFromCart(cartItem);
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.delete, color: Colors.redAccent, size: 19),
                          Text(
                            'Remove',
                            style: Styles.textStyle13
                                .copyWith(color: Colors.redAccent),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 80,
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(13)),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              cartCubit.updateQuantity(cartItem, cartItem.quantity - 1);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(7)),
                              child: const Icon(
                                Icons.remove,
                                size: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${cartItem.quantity}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              cartCubit.updateQuantity(cartItem, cartItem.quantity + 1);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(7)),
                              child: const Icon(
                                Icons.add,
                                size: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}