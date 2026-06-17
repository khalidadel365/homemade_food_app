class RatingModel {
  final int rating;
  final String reviewText;

  RatingModel({required this.rating, required this.reviewText});

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'review_text': reviewText,
    };
  }
}