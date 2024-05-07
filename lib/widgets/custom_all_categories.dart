// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:zarafa_app/constants/colors.dart';
import 'package:zarafa_app/domain/entities/category.dart';

class CustomAllCategories extends StatelessWidget {
  final Category category;
  const CustomAllCategories({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: lightPurpleColor,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: purpleColor,
              child: Text(
                category.numberOfMerchants.toString(),
                style: const TextStyle(
                  color: whiteColor,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10), // Adjust spacing as needed
          Expanded(
            child: Image.asset(
              category.iconPath,
              scale: 3.5,
            ),
          ),
          const SizedBox(height: 10), // Adjust spacing as needed
          Expanded(
            child: Text(
              category.title,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
