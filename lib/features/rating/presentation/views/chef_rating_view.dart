import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:homemade_food_app/constants.dart';
import 'package:homemade_food_app/core/utilities/loading_view.dart';
import 'package:homemade_food_app/core/utilities/styles.dart';
import 'package:homemade_food_app/core/widgets/custom_button.dart';
import 'package:homemade_food_app/core/widgets/custom_textformfield.dart';

import '../../../../core/utilities/api_constants.dart';
import '../manager/cubit/rating_cubit.dart';
import '../manager/states/rating_states.dart';

class ChefRatingView extends StatefulWidget {
  final int chefId;

  const ChefRatingView({super.key, required this.chefId});

  @override
  State<ChefRatingView> createState() => _ChefRatingViewState();
}

class _ChefRatingViewState extends State<ChefRatingView> {
  double _rating = 0;
  final TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rate Your Order")),
      body: BlocConsumer<RatingCubit, RatingState>(
        listener: (context, state) {
          if (state is RatingSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is RatingLoading) {
            return LoadingView();
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text("How was your meal?",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) =>
                      const Icon(Icons.star, color: kPrimaryColor),
                  onRatingUpdate: (rating) => setState(() => _rating = rating),
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                    controller: _reviewController,
                    hintText: "Write your review here...",
                    maxLines: 5),
                const Spacer(),
                CustomButton(
                  width: double.infinity,
                    backgroundColor: kPrimaryColor,
                    text: 'Submit Feedback',
                    textStyle: Styles.textStyle16.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    borderRadius: 10,
                    onPressed: (){
                      context.read<RatingCubit>().submitRating(
                        chefId: widget.chefId,
                        token: ApiConstants.token!,
                        rating: _rating.toInt(),
                        reviewText: _reviewController.text,
                      );
                    })
              ],
            ),
          );
        },
      ),
    );
  }
}
