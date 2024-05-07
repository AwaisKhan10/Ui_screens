// lib/data/models/category_model.dart
class CategoryModel {
  final String title;
  final String iconPath;
  final int numberOfMerchants;
  final List<String> subcategories;
  final double popularity;

  CategoryModel({
    required this.title,
    required this.iconPath,
    required this.numberOfMerchants,
    required this.subcategories,
    required this.popularity,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      title: json['title'],
      iconPath: json['iconPath'],
      numberOfMerchants: json['numberOfMerchants'],
      subcategories: List<String>.from(json['subcategories']),
      popularity: json['popularity'].toDouble(),
    );
  }
}
