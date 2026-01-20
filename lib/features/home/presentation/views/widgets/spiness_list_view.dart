import 'package:flutter/material.dart';

import 'custom_selection_option_button.dart';

class SpicinessListView extends StatelessWidget {
  const SpicinessListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (index, context) {
          return CustomSpicinessOptionButton();
        },
        separatorBuilder: (index, context) => const SizedBox(
          height: 10,
        ),
        itemCount: 3);
  }
}
