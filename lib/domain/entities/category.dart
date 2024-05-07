// lib/domain/entities/category.dart
import '../../data/models/category_model.dart';

class Category {
  final String title;
  final String iconPath;
  final int numberOfMerchants;
  final double popularity;

  Category({
    required this.title,
    required this.iconPath,
    required this.numberOfMerchants,
    required this.popularity,
  });

  factory Category.fromModel(CategoryModel model) {
    return Category(
      title: model.title,
      iconPath: model.iconPath,
      numberOfMerchants: model.numberOfMerchants,
      popularity: model.popularity,
    );
  }
}
