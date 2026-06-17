import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:homemade_food_app/core/utilities/loading_view.dart';

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
                const Text("How was your meal?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) => setState(() => _rating = rating),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _reviewController,
                  maxLines: 5,
                  decoration: const InputDecoration(hintText: "Care to share more?", border: OutlineInputBorder()),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: _rating == 0 ? null : () {
                    context.read<RatingCubit>().submitRating(
                      chefId: widget.chefId,
                      token: ApiConstants.token!,
                      rating: _rating.toInt(),
                      reviewText: _reviewController.text,
                    );
                  },
                  child: const Text("Submit Feedback"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}