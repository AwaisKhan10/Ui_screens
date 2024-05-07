// lib/domain/usecases/get_categories.dart
import 'package:dartz/dartz.dart';
import 'package:zarafa_app/domain/entities/sub_category.dart';
import 'package:zarafa_app/domain/repositories/sub_category_repository.dart';
import '../failures/failure.dart';

class GetSubCategories {
  final SubCategoryRepository repository;

  GetSubCategories(this.repository);

  Future<Future<Either<Failure, List<SubCategory>>>> call() async {
    return repository.getSubCategories();
  }
}
