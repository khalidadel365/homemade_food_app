import 'package:flutter/material.dart';

import 'variety_option_list_view_item.dart';

class VarietyOptionsListView extends StatefulWidget {
  const VarietyOptionsListView({
    super.key,
    required this.options,
    this.onChanged,
  });

  final List<dynamic> options;
  final ValueChanged<dynamic>? onChanged;

  @override
  State<VarietyOptionsListView> createState() => _VarietyOptionsListViewState();
}

class _VarietyOptionsListViewState extends State<VarietyOptionsListView> {
  int? selectedId;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.options.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final option = widget.options[index];

        bool isSelected = selectedId == option.id;

        return VarietyOptionItem(
          name: option.name ?? '',
          price: option.priceAdjustment ?? '0.00',
          isSelected: isSelected,
          onTap: () {
            setState(() {
              selectedId = option.id;
            });

            if (widget.onChanged != null) {
              widget.onChanged!(option);
            }
          },
        );
      },
    );
  }
}
