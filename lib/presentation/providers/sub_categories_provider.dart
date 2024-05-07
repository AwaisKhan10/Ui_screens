// lib/presentation/providers/category_provider.dart
import 'package:flutter/material.dart';
import 'package:zarafa_app/data/models/all_offer.dart';
import 'package:zarafa_app/domain/entities/sub_category.dart';
import 'package:zarafa_app/domain/usecases/get_sub_categories.dart';

class SubCategoryProvider with ChangeNotifier {
  final GetSubCategories getSubCategories;

  int selectedIndex = 0;
  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  int isSelectedAlphabets = 0;
  void setAlphabetSelectedIndex(int index) {
    isSelectedAlphabets = index;
    notifyListeners();
  }

  List<String> listAlphates = [
    'All',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  List<AllOffer> listAllOffer = [
    AllOffer(imgURL: 'assets/images/BJ’s.png', dishName: 'BJ’s'),
    AllOffer(imgURL: 'assets/images/FreshDirect.png', dishName: 'FreshDirect'),
    AllOffer(imgURL: 'assets/images/carrows.png', dishName: 'Carrows'),
    AllOffer(imgURL: 'assets/images/foodCirlce.png', dishName: 'FreshDirect'),
    AllOffer(imgURL: 'assets/images/Leaon.png', dishName: 'Leaon'),
  ];

  List<SubCategory> subcategories = [
    SubCategory(
        title: 'Shawerma',
        iconPath: 'assets/icons/Shawerma.png',
        numberOfMerchants: 10,
        popularity: 1.0),
    SubCategory(
        title: 'Burger',
        iconPath: 'assets/icons/Food.png',
        numberOfMerchants: 4,
        popularity: 1.0),
    SubCategory(
        title: 'Cofee',
        iconPath: 'assets/icons/cofee.png',
        numberOfMerchants: 7,
        popularity: 1.0),
    SubCategory(
        title: 'Food',
        iconPath: 'assets/icons/Food.png',
        numberOfMerchants: 10,
        popularity: 1.0),
  ];

  String errorMessage = '';

  SubCategoryProvider(this.getSubCategories);

  // Future<void> fetchSubCategories() async {
  //   final failureOrSubCategories = await getSubCategories();
  //   failureOrSubCategories.fold(
  //     (failure) => errorMessage = failure.message,
  //     (categoriesList) => subcategories = categoriesList,
  //   );
  //   notifyListeners();
  // }
}
