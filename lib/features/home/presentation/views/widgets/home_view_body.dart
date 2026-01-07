import 'package:flutter/material.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/core/widgets/custom_button.dart';
import 'package:homemade_food_app/core/widgets/custom_textformfield.dart';
import 'categories_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: searchController,
                    hintText:
                        'search  Craving lasagna, cookies, or anything else...',
                    hintTextStyle:
                        TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                        ),
                    circularRadius: 14,
                    verticalPadding: 13,
                    horizontalPadding: 20,
                    cursorWidth: 1.8,
                    cursorHeight: 20,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomButton(
                    width: 50,
                    height: 50,
                    elevation: 0,
                    backgroundColor: kPrimaryColor,
                    borderRadius: 12,
                    text: 'tune',
                    onPressed: () {},
                    textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                    )
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            CategoriesListView()
          ],
        ),
      ),
    );
  }
}


