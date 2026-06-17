import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/cubit/dish_details_cubit.dart';
import 'variety_option_list_view_item.dart';

class VarietyOptionsListView extends StatelessWidget {
  const VarietyOptionsListView({
    super.key,
    required this.options,
    required this.sectionId,
  });

  final List<dynamic> options;
  final int sectionId;

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<FetchDishDetailsCubit>();
    final selectedOptionInThisSection = cubit.selectedVarietiesMap[sectionId];

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: options.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final option = options[index];
        bool isSelected = selectedOptionInThisSection?.id == option.id;

        return VarietyOptionItem(
          name: option.name ?? '',
          price: option.priceAdjustment ?? '0.00',
          isSelected: isSelected,
          onTap: () {
            cubit.updateSectionSelection(sectionId: sectionId, option: option);
          },
        );
      },
    );
  }
}