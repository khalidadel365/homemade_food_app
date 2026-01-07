import 'package:flutter/material.dart';

import '../../../data/models/categories_model.dart';
import 'categories_list_view_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });
  static const List<CategoriesModel> categories = [
    CategoriesModel(icon: Icon(Icons.restaurant,size: 21,),name: 'All'),
    CategoriesModel(icon: Icon(Icons.lunch_dining,size: 21,),name: 'Mains'),
    CategoriesModel(icon: Icon(Icons.bakery_dining,size: 21,),name: 'Bakery'),
    CategoriesModel(icon: Icon(Icons.cookie,size: 21,),name: 'Desserts'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index)=>CategoriesListViewItem(categoriesModel: categories[index],),
          separatorBuilder: (context,index)=>const SizedBox(width: 10),
          itemCount: categories.length,),
    );
  }
}