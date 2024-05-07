// lib/presentation/providers/category_provider.dart
import 'package:flutter/material.dart';

class DetailProvider with ChangeNotifier {
  int indexSelect = 0;
  void setIndex(int index) {
    indexSelect = index;
    notifyListeners();
  }

  bool customTileExpanded = false;
}
