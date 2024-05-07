// lib/domain/repositories/category_repository.dart
// ignore_for_file: non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:zarafa_app/domain/entities/sub_category.dart';
import '../failures/failure.dart';

abstract class SubCategoryRepository {
  Future<Either<Failure, List<SubCategory>>> getSubCategories();
}
