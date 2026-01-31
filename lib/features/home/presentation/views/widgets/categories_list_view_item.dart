import 'package:flutter/material.dart';
import 'package:homemade_food_app/features/home/data/models/category_ui_model.dart';

import '../../../../../constants.dart';

class CategoriesListViewItem extends StatelessWidget {
  const CategoriesListViewItem({
    super.key,
    required this.categoriesModel,
    this.isSelected = false,
  });

  final CategoryUIModel categoriesModel;

  final isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
          color: isSelected ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconTheme(
            data: IconThemeData(
              color: isSelected ? Colors.white : Colors.black,
            ),
              child: categoriesModel.icon),
          SizedBox(
            width: 8,
          ),
          Text(
            categoriesModel.name,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 13.5, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
