import 'package:closeby/model/static/product_model.dart';
import 'package:closeby/model/static/review_model.dart';

class UserModel {
  final String uuid;
  final String firstName;
  final String lastName;
  final String joinYear;
  List<String>? spokenLanguages;
  String? responseTime;
  String? responseRate;
  String? profilePicture;
  final bool isHost;
  final bool isVerified;

  List<ReviewModel>? userReview;
  int totalReviews;
  double? averageRating;

  List<ProductModel>? products;

  UserModel({
    required this.uuid,
    required this.firstName,
    required this.lastName,
    required this.joinYear,
    this.spokenLanguages = const [],
    this.responseTime,
    this.responseRate,
    this.profilePicture,
    this.isHost = false,
    this.isVerified = false,
    this.userReview,
    this.totalReviews = 0,
    this.averageRating,
    this.products,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uuid: json['uuid'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      // map joinyear
      joinYear: json['joinYear'],
      spokenLanguages: List<String>.from(json['spokenLanguages']),
      responseTime: json['responseTime'],
      responseRate: json['responseRate'],
      profilePicture: json['profilePicture'],
      isHost: json['isHost'],
      isVerified: json['isVerified'],
      userReview: json['userReview']?.map<ReviewModel>((r) => ReviewModel.fromJson(r)),
      totalReviews: json['totalReviews'],
      averageRating: json['averageRating'],
      products: json['products']?.map<ProductModel>((p) => ProductModel.fromJson(p)),
    );
  }
}
