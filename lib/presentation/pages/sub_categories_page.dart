// lib/presentation/pages/categories_page.dart
// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zarafa_app/constants/colors.dart';
import 'package:zarafa_app/constants/text_style.dart';
import 'package:zarafa_app/presentation/pages/detail_page.dart';
import 'package:zarafa_app/presentation/providers/sub_categories_provider.dart';
import 'package:zarafa_app/widgets/custom_all_offer.dart';
import 'package:zarafa_app/widgets/custom_sub_category.dart';

class SubCategoriesPage extends StatelessWidget {
  String? title;
  SubCategoriesPage({required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      /// App Bar
      ///
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          '$title',
          style: style25,
        ),
      ),

      ///
      /// Start Body
      ///
      body: Consumer<SubCategoryProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sub Categories",
                    style: style22,
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  ///
                  /// Sub Categories List
                  ///
                  SizedBox(
                    height: 140,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: provider.subcategories.length,
                      itemBuilder: (context, index) {
                        final SubCategory = provider.subcategories[index];
                        return GestureDetector(
                          onTap: () {
                            // Navigate to subcategories screen
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => SubCategoriesPage(
                            //               title: category.title,
                            //             )));
                          },

                          ///
                          /// Custom Sub-Categories
                          ///
                          child: CustomSubCategory(
                            subCategory: SubCategory,
                            selectedIndex: provider.selectedIndex,
                            onPressed: () {
                              provider.setSelectedIndex(index);
                            },
                            index: index,
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 20,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  ///
                  /// Header
                  ///
                  _rowHeader(),

                  const SizedBox(
                    height: 10,
                  ),

                  ///
                  /// List Data Alphabets
                  ///
                  _alphabets(provider),
                  const SizedBox(
                    height: 30,
                  ),

                  ///
                  /// All Offers For Food, Drinks & Restaurants
                  ///
                  ///
                  ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: provider.listAllOffer.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                        imgUrl:
                                            provider.listAllOffer[index].imgURL,
                                      )));
                        },
                        child: CustomAllOffer(
                            allOffer: provider.listAllOffer[index]),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

_rowHeader() {
  return Row(
    children: [
      Expanded(
        child: Text(
          "All Offers For Food, Drinks & Restaurants",
          style: style18,
        ),
      ),
      Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          color: lightPurpleColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(
          "assets/icons/Search.png",
          color: purpleColor,
          scale: 5,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Container(
          height: 32,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text(
                "Sort",
                style: style14.copyWith(
                  color: purpleColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: purpleColor,
                size: 22,
              )
            ],
          ))
    ],
  );
}

_alphabets(provider) {
  return SizedBox(
    height: 32,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 9,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            provider.setAlphabetSelectedIndex(index);
          },
          child: Container(
            alignment: Alignment.center,
            height: 32,
            width: provider.isSelectedAlphabets == index ? 60 : 44,
            decoration: BoxDecoration(
                color: provider.isSelectedAlphabets == index
                    ? lightPurpleColor
                    : const Color(0xffF0F0F0),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              provider.listAlphates[index],
              style: style14.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: provider.isSelectedAlphabets == index
                      ? purpleColor
                      : blackColor),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 15,
        );
      },
    ),
  );
}
