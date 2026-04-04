import 'package:flutter/material.dart';

import 'variety_option_list_view_item.dart';

class VarietyOptionsListView extends StatefulWidget {
  const VarietyOptionsListView({
    super.key,
    required this.options,
    required this.isRequired,
  });

  final List<dynamic> options;
  final bool isRequired;

  @override
  State<VarietyOptionsListView> createState() => _VarietyOptionsListViewState();
}

class _VarietyOptionsListViewState extends State<VarietyOptionsListView> {
  int? selectedId;
  List<int> multiSelectedIds = [];

  @override
  Widget build(BuildContext context) {
    print(
        '--- Check Section: ${widget.options.isNotEmpty ? widget.options[0].name : "Empty"} ---');
    print('isRequired value: ${widget.isRequired}');
    print('Options IDs: ${widget.options.map((e) => e.id).toList()}');
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.options.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final option = widget.options[index];

        bool isSelected = widget.isRequired
            ? selectedId == option.id
            : multiSelectedIds.contains(option.id);

        return VarietyOptionItem(
          name: option.name ?? '',
          price: option.priceAdjustment ?? '0.00',
          isSelected: isSelected,
          onTap: () {
            setState(() {
              if (widget.isRequired) {
                selectedId = option.id;
              } else {
                if (multiSelectedIds.contains(option.id)) {
                  multiSelectedIds.remove(option.id);
                } else {
                  multiSelectedIds.add(option.id);
                }
              }
            });
          },
        );
      },
    );
  }
}
