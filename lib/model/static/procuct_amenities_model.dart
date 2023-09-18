
class ProductAmenitiesModel {
  late String iconName;
  late String amenity;
  late bool isAvailable;

  ProductAmenitiesModel({
    required this.iconName,
    required this.amenity,
    this.isAvailable = false,
  });

  factory ProductAmenitiesModel.fromJson(Map<String, dynamic> json) {
    return ProductAmenitiesModel(
      iconName: json['iconName'],
      amenity: json['amenity'],
      isAvailable: json['isAvailable'],
    );
  }
}
