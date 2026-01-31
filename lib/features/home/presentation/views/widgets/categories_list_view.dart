import 'package:flutter/material.dart';

import '../../../data/models/category_ui_model.dart';
import 'categories_list_view_item.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({
    super.key,
  });
  static const List<CategoryUIModel> categories = [
    CategoryUIModel(icon: Icon(Icons.restaurant,size: 21,),name: 'All'),
    CategoryUIModel(icon: Icon(Icons.local_pizza_rounded,size: 21,),name: 'Italian '),
    CategoryUIModel(icon: Icon(Icons.bakery_dining,size: 21,),name: 'Mexican '),
    CategoryUIModel(icon: Icon(Icons.rice_bowl_sharp,size: 21,),name: 'Asian'),
    CategoryUIModel(icon: Icon(Icons.cookie,size: 21,),name: 'American'),
  ];


  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            bool isSelected = index == selectedIndex;

           return GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex = index;
                });
              },
              child: CategoriesListViewItem(
                categoriesModel: CategoriesListView.categories[index],
                isSelected: isSelected,
              ),
            );
          },
          separatorBuilder: (context,index)=>const SizedBox(width: 10),
          itemCount: CategoriesListView.categories.length,),
    );
  }
}