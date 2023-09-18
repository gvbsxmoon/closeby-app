
import 'package:closeby/model/static/user_model.dart';

class ReviewModel {
  late String description;
  late int rating;
  late UserModel reviewer;

  ReviewModel({
    required this.description,
    required this.rating,
    required this.reviewer
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      description: json['description'],
      rating: json['rating'],
      reviewer: UserModel.fromJson(json['reviewer'])
    );
  }
}
