import 'package:flutter/material.dart';
import 'package:homemade_food_app/features/cart/data/models/payment_methods_model.dart';
import 'package:homemade_food_app/features/cart/presentation/views/widgets/custom_selection_payment_method.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  int selectedIndex = 0;
  List<PaymentMethodsModel> paymentMethods = [
    PaymentMethodsModel(
        icon: Icons.credit_card,
        title: 'Credit Card',
        ),
    PaymentMethodsModel(
      icon: Icons.money,
      title: 'Cash on Delivery',
    )
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CustomSelectionPaymentMethod(
            paymentMethodsModel: paymentMethods[index],
            isSelected: selectedIndex == index,
            onTap: (){
              setState(() {
                selectedIndex = index;
              });
            },
          );
        },
        separatorBuilder: (index, context) => const SizedBox(
          height: 10,
        ),
        itemCount: 2);
  }
}
