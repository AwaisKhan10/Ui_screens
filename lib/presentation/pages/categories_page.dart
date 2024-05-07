// lib/presentation/pages/categories_page.dart
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zarafa_app/constants/text_field_decoration.dart';
import 'package:zarafa_app/constants/text_style.dart';
import 'package:zarafa_app/presentation/pages/sub_categories_page.dart';
import 'package:zarafa_app/widgets/custom_all_categories.dart';

import '../../widgets/custom_categories.dart';
import '../providers/category_provider.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      /// App Bar
      ///
      appBar: AppBar(
        title: Text(
          'Categories',
          style: style25,
        ),
      ),

      ///
      /// Start Body
      ///
      body: Consumer<CategoryProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                      decoration: authFieldDecoration.copyWith(
                    hintText: 'Search categories',
                    prefixIcon: Image.asset(
                      "assets/icons/Search.png",
                      scale: 4,
                    ),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Popular Categories",
                    style: style22.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 140,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: provider.categories.length,
                      itemBuilder: (context, index) {
                        final category = provider.categories[index];
                        return GestureDetector(
                          onTap: () {
                            // Navigate to subcategories screen
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SubCategoriesPage(
                                          title: category.title,
                                        )));
                          },

                          ///
                          /// Custom Popular Categories
                          ///
                          child: CustomPopularCategories(
                            category: category,
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
                    height: 30,
                  ),
                  Text(
                    "All Categories",
                    style: style22.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 20,
                      crossAxisCount: 3,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: provider.allCategories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SubCategoriesPage(
                                        title:
                                            provider.allCategories[index].title,
                                      )));
                        },
                        child: CustomAllCategories(
                          category: provider.allCategories[index],
                        ),
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
