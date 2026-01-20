import 'package:flutter/material.dart';
import '../../../../../constants.dart';

import '../../../../../core/utilities/styles.dart';

class FreshNearbyDetailsBottomNavBar extends StatefulWidget {
  const FreshNearbyDetailsBottomNavBar({
    super.key,
  });

  @override
  State<FreshNearbyDetailsBottomNavBar> createState() => _FreshNearbyDetailsBottomNavBarState();
}

class _FreshNearbyDetailsBottomNavBarState extends State<FreshNearbyDetailsBottomNavBar> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 85,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 140,
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(13)),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if(counter >0){
                        counter--;
                      }
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 28,
                    height: 30,
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
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    width: 28,
                    height: 30,
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
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 53,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Text(
                    'Add to Cart',
                    style: Styles.textStyle18.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}