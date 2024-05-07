// lib/domain/usecases/get_categories.dart
import 'package:dartz/dartz.dart';

import '../entities/category.dart';
import '../failures/failure.dart';
import '../repositories/category_repository.dart';

class GetCategories {
  final CategoryRepository repository;

  GetCategories(this.repository);

  Future<Either<Failure, List<Category>>> call() async {
    return repository.getCategories();
  }
}
