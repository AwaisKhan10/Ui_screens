import 'package:dartz/dartz.dart';
import 'package:zarafa_app/data/models/sub_category.dart';
import 'package:zarafa_app/domain/entities/sub_category.dart';
import 'package:zarafa_app/domain/failures/failure.dart';
import 'package:zarafa_app/domain/repositories/sub_category_repository.dart';

class SubCategoryRepositoryImpl implements SubCategoryRepository {
  @override
  Future<Either<Failure, List<SubCategory>>> getSubCategories() async {
    try {
      List<SubuCategoryModel> subCategoryModels = [
        SubuCategoryModel(
          title: 'Food',
          iconPath: 'assets/icons/Food.png',
          numberOfMerchants: 150,
          subcategories: ['Burgers', 'Pizza', 'Sushi'],
          popularity: 5.0,
        ),
        SubuCategoryModel(
          title: 'Toys & Games',
          iconPath: 'assets/icons/Toys & Games.png',
          numberOfMerchants: 80,
          subcategories: ['Board Games', 'Action Figures'],
          popularity: 4.0,
        ),
        SubuCategoryModel(
          title: 'Sports',
          iconPath: 'assets/icons/Sports.png',
          numberOfMerchants: 200,
          subcategories: ['Football', 'Basketball Gear'],
          popularity: 4.5,
        ),
        // Add other categories similarly
      ];
      List<SubCategory> categories = subCategoryModels
          .map((model) => SubCategory.fromModel(model))
          .toList();
      return Right(categories);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch categories'));
    }
  }
}
