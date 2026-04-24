import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/core/utilities/styles.dart';
import 'package:homemade_food_app/features/dish_details/presentation/views/widgets/variety_options_list_view.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/models/dish_model.dart';
import '../../../../../core/widgets/chief_info_row.dart';
import '../../../../../core/widgets/details_options_title.dart';
import '../../../../../core/widgets/custom_rating.dart';
import '../../../../all_dishes/data/models/category_model.dart';
import '../../manager/cubit/dish_details_cubit.dart';
import 'food_info_row.dart';

class DishInfoSection extends StatefulWidget {
  const DishInfoSection({super.key, required this.dishModel});

  final DishModel dishModel;

  @override
  State<DishInfoSection> createState() => _DishInfoSectionState();
}

class _DishInfoSectionState extends State<DishInfoSection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${widget.dishModel.name}', style: Styles.textStyle20),
                Text(
                  "${widget.dishModel.price}\$",
                  style: Styles.textStyle20.copyWith(color: kPrimaryColor),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ChefInfoRow(chefModel: widget.dishModel.chef),
                const Spacer(),
                CustomRating(
                  rating: widget.dishModel.averageRating ?? 0.0,
                  size: 15,
                  backgroundColor: Colors.amber.shade50,
                )
              ],
            ),
            const SizedBox(height: 16),
            FoodInfoRow(
              prepTime: '${widget.dishModel.preparationTime}',
              categoryModel:
                  widget.dishModel.category ?? CategoryModel(name: 'General'),
            ),
            const SizedBox(height: 16),
            const DetailsOptionsTitle(title: 'Description'),
            const SizedBox(height: 10),
            ReadMoreText(
              widget.dishModel.description ?? 'No description available',
              colorClickableText: kPrimaryColor,
              trimLines: 5,
              trimMode: TrimMode.Line,
              trimCollapsedText: ' Show more',
              trimExpandedText: ' Show less',
              style: Styles.textStyle14,
            ),
            const SizedBox(height: 30),
            if (widget.dishModel.varietySections != null)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.dishModel.varietySections!.length,
                itemBuilder: (context, index) {
                  final section = widget.dishModel.varietySections![index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailsOptionsTitle(title: section.name ?? ''),
                      const SizedBox(height: 10),
                      VarietyOptionsListView(
                        options: section.options ?? [],
                        onChanged: (option) {
                          context
                              .read<FetchDishDetailsCubit>()
                              .updateSelection(option);
                        },
                      ),
                      const SizedBox(height: 30),
                    ],
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
