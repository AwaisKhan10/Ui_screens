// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:zarafa_app/constants/colors.dart';
import 'package:zarafa_app/domain/entities/sub_category.dart';

class CustomSubCategory extends StatelessWidget {
  final SubCategory subCategory;
  final int index; // Add index parameter
  final int selectedIndex; // Add selectedIndex parameter
  final VoidCallback onPressed;

  const CustomSubCategory({
    required this.subCategory,
    required this.index,
    required this.selectedIndex,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = index == selectedIndex;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onPressed();
          },
          child: Container(
            height: 80,
            width: 80,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: lightPurpleColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected ? purpleColor : Colors.transparent,
                width: 2,
              ),
            ),
            child: Image.asset(
              subCategory.iconPath,
              scale: 3.5,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subCategory.title,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
