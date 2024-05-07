// lib/data/models/category_model.dart
class SubuCategoryModel {
  final String title;
  final String iconPath;
  final int numberOfMerchants;
  final List<String> subcategories;
  final double popularity;

  SubuCategoryModel({
    required this.title,
    required this.iconPath,
    required this.numberOfMerchants,
    required this.subcategories,
    required this.popularity,
  });

  factory SubuCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubuCategoryModel(
      title: json['title'],
      iconPath: json['iconPath'],
      numberOfMerchants: json['numberOfMerchants'],
      subcategories: List<String>.from(json['subcategories']),
      popularity: json['popularity'].toDouble(),
    );
  }
}
