// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:zarafa_app/constants/colors.dart';
import 'package:zarafa_app/constants/text_style.dart';
import 'package:zarafa_app/domain/entities/category.dart';

class CustomPopularCategories extends StatelessWidget {
  final Category category;
  const CustomPopularCategories({required this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
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
                style: style10.copyWith(
                    color: whiteColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            category.iconPath,
            scale: 4,
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Text(
              category.title,
              style:
                  style14.copyWith(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
