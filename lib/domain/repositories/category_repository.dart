// lib/domain/repositories/category_repository.dart
import 'package:dartz/dartz.dart';

import '../entities/category.dart';
import '../failures/failure.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getCategories();
}
