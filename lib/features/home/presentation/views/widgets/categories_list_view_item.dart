import 'package:flutter/material.dart';
import 'package:homemade_food_app/features/home/data/models/categories_model.dart';

class CategoriesListViewItem extends StatelessWidget {
  const CategoriesListViewItem({super.key, required this.categoriesModel});
  final CategoriesModel categoriesModel ;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1,
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          categoriesModel.icon,
          SizedBox(
            width: 8,
          ),
          Text(categoriesModel.name,style: TextStyle(fontSize: 13.5,fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }
}
