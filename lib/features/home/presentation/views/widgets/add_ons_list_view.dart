
import 'package:flutter/material.dart';
import 'package:homemade_food_app/features/home/presentation/views/widgets/custom_addon_option_button.dart';

class AddOnsListView extends StatelessWidget {
  const AddOnsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (index, context) => CustomAddOnOptionButton(),
        separatorBuilder: (index, context) => const SizedBox(
          height: 10,
        ),
        itemCount: 3);
  }
}