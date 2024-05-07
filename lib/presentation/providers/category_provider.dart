// lib/presentation/providers/category_provider.dart
import 'package:flutter/material.dart';

import '../../domain/entities/category.dart';
import '../../domain/usecases/get_categories.dart';

class CategoryProvider with ChangeNotifier {
  final GetCategories getCategories;
  List<Category> categories = [
    Category(
        title: 'Food',
        iconPath: 'assets/icons/Food.png',
        numberOfMerchants: 10,
        popularity: 1.0),
    Category(
        title: 'Toys & Games',
        iconPath: 'assets/icons/Toys & Games.png',
        numberOfMerchants: 4,
        popularity: 1.0),
    Category(
        title: 'Sports',
        iconPath: 'assets/icons/Sports.png',
        numberOfMerchants: 7,
        popularity: 1.0),
    Category(
        title: 'Food',
        iconPath: 'assets/icons/Food.png',
        numberOfMerchants: 10,
        popularity: 1.0),
  ];

  List<Category> allCategories = [
    Category(
        title: 'Gym',
        iconPath: 'assets/icons/Gym.png',
        numberOfMerchants: 9,
        popularity: 1.0),
    Category(
        title: 'Electrician',
        iconPath: 'assets/icons/Electrician.png',
        numberOfMerchants: 14,
        popularity: 1.0),
    Category(
        title: 'Hotels',
        iconPath: 'assets/icons/Hotels.png',
        numberOfMerchants: 4,
        popularity: 1.0),
    Category(
        title: 'Car Services',
        iconPath: 'assets/icons/Car Services.png',
        numberOfMerchants: 5,
        popularity: 1.0),
    Category(
        title: 'Beauty',
        iconPath: 'assets/icons/Beauty.png',
        numberOfMerchants: 12,
        popularity: 1.0),
    Category(
        title: 'Clothing',
        iconPath: 'assets/icons/Clothing.png',
        numberOfMerchants: 18,
        popularity: 1.0)
  ];
  String errorMessage = '';

  CategoryProvider(this.getCategories);

  Future<void> fetchCategories() async {
    final failureOrCategories = await getCategories();

    failureOrCategories.fold(
      (failure) => errorMessage = failure.message,
      (categoriesList) => categories = categoriesList,
    );
    notifyListeners();
  }
}
