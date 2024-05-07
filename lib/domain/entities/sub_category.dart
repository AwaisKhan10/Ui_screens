// lib/domain/entities/category.dart
import 'package:zarafa_app/data/models/sub_category.dart';

class SubCategory {
  final String title;
  final String iconPath;
  final int numberOfMerchants;
  final double popularity;

  SubCategory({
    required this.title,
    required this.iconPath,
    required this.numberOfMerchants,
    required this.popularity,
  });

  factory SubCategory.fromModel(SubuCategoryModel model) {
    return SubCategory(
      title: model.title,
      iconPath: model.iconPath,
      numberOfMerchants: model.numberOfMerchants,
      popularity: model.popularity,
    );
  }
}
