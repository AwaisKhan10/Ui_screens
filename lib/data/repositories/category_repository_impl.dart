// lib/data/repositories/category_repository_impl.dart
import 'package:dartz/dartz.dart';

import '../../domain/entities/category.dart';
import '../../domain/failures/failure.dart';
import '../../domain/repositories/category_repository.dart';
import '../models/category_model.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      List<CategoryModel> categoryModels = [
        CategoryModel(
            title: 'Food',
            iconPath: 'assets/icons/Food.png',
            numberOfMerchants: 150,
            subcategories: ['Burgers', 'Pizza', 'Sushi'],
            popularity: 5.0),
        CategoryModel(
            title: 'Toys & Games',
            iconPath: 'assets/icons/Toys & Games.png',
            numberOfMerchants: 80,
            subcategories: ['Board Games', 'Action Figures'],
            popularity: 4.0),
        CategoryModel(
            title: 'Sports',
            iconPath: 'assets/icons/Sports.png',
            numberOfMerchants: 200,
            subcategories: ['Football', 'Basketball Gear'],
            popularity: 4.5),
        // Add other categories similarly
      ];
      List<Category> categories =
          categoryModels.map((model) => Category.fromModel(model)).toList();
      return Right(categories);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch categories'));
    }
  }
}
