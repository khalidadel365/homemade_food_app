import 'package:flutter/material.dart';

import '../../../../../core/utilities/styles.dart';
import '../../../../home/presentation/views/widgets/custom_fresh_nearby_image.dart';
import 'custom_cart_image.dart';

class CartListViewItem extends StatefulWidget {
  const CartListViewItem({super.key});

  @override
  State<CartListViewItem> createState() => _CartListViewItemState();
}

class _CartListViewItemState extends State<CartListViewItem> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
     margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(
          vertical: 10, horizontal: 10),
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
          CustomCartImage(),
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
                        'Homemade Pepproni Pizza',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle14.copyWith(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Text(
                      '250 EGY', style: Styles.textStyle14.copyWith(
                        fontWeight: FontWeight.bold
                    ),
                    ),
                  ],
                ),
                const SizedBox(height: 2,),
                Text(
                  'Extra Cheese, Extra Sauce',
                  style: Styles.textStyle11.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                            Icons.delete,
                            color: Colors.redAccent,
                            size:19),
                        Text(
                          'Remove',
                          style: Styles.textStyle13.copyWith(
                              color: Colors.redAccent
                          ),
                        )
                      ],
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
                              setState(() {
                                if(counter > 0){
                                  counter--;
                                }
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(7)),
                              child: Icon(
                                Icons.remove,
                                size: 20,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '$counter',
                              textAlign: TextAlign.center,
                              style:
                              TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                counter++;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(7)),
                              child: Icon(
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
