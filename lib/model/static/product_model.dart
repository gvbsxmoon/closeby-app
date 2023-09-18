import 'package:closeby/model/static/procuct_amenities_model.dart';
import 'package:closeby/model/static/review_model.dart';
import 'package:closeby/model/static/user_model.dart';

class ProductModel {
  late List<String> images;
  late String title;
  late String city;
  late String province;
  late UserModel host;
  late String description;
  List<ProductAmenitiesModel> amenities;

  late List<ReviewModel> reviews;
  late int totalReviews;
  double? averageRating;

  late double price;

  late bool isFavorite;

  ProductModel({
    required this.images,
    required this.title,
    required this.city,
    required this.province,
    required this.host,
    required this.description,
    this.amenities = const [],
    this.reviews = const [],
    this.totalReviews = 0,
    this.averageRating = 0,
    required this.price,
    this.isFavorite = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      images: json['images']?.map<String>((i) => i).toList(),
      title: json['title'],
      city: json['city'],
      province: json['province'],
      host: UserModel.fromJson(json['host']),
      description: json['description'],
      amenities: json['amenities']?.map<ProductAmenitiesModel>((a) => ProductAmenitiesModel.fromJson(a)),
      reviews: json['reviews']?.map<ReviewModel>((r) => ReviewModel.fromJson(r)),
      totalReviews: json['totalReviews'],
      averageRating: json['averageRating'],
      price: json['price'],
      isFavorite: json['isFavorite'],
    );
  }
}
