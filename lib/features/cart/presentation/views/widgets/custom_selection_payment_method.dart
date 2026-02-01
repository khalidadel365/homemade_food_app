import 'package:flutter/material.dart';
import 'package:homemade_food_app/core/utilities/custom_icon.dart';
import 'package:homemade_food_app/features/cart/data/models/payment_methods_model.dart';
import '../../../../../constants.dart';

class CustomSelectionPaymentMethod extends StatelessWidget {
  const CustomSelectionPaymentMethod({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.paymentMethodsModel,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final PaymentMethodsModel paymentMethodsModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 65,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(6),
              height: 21,
              width: 21,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 1.3),
                shape: BoxShape.circle,
                color: isSelected ? kPrimaryColor : Colors.white,
              ),
              child: Container(
                height: 5,
                width: 5,
                decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            CustomIcon(
              height: 70,
              width: 40,
              icon: paymentMethodsModel.icon,
              background: Colors.grey.withOpacity(0.2),
              iconColor: Colors.black.withOpacity(0.5),
            ),
            const SizedBox(
              width: 12,
            ),
            Text('${paymentMethodsModel.title}', style: TextStyle(
                fontWeight: FontWeight.w500
            ),),
          ],
        ),
      ),
    );
  }
}
