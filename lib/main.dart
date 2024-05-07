import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zarafa_app/data/repositories/sub_category_repository_impl.dart';
import 'package:zarafa_app/domain/repositories/sub_category_repository.dart';
import 'package:zarafa_app/domain/usecases/get_sub_categories.dart';
import 'package:zarafa_app/presentation/providers/sub_categories_provider.dart';

import 'data/repositories/category_repository_impl.dart';
import 'domain/repositories/category_repository.dart';
import 'domain/usecases/get_categories.dart';
import 'presentation/pages/categories_page.dart';
import 'presentation/providers/category_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CategoryRepository>(
          create: (_) => CategoryRepositoryImpl(),
        ),
        ProxyProvider<CategoryRepository, GetCategories>(
          update: (context, repo, previous) => GetCategories(repo),
        ),
        ChangeNotifierProvider<CategoryProvider>(
          create: (context) => CategoryProvider(context.read<GetCategories>()),
        ),
        Provider<SubCategoryRepository>(
          create: (_) => SubCategoryRepositoryImpl(),
        ),
        ProxyProvider<SubCategoryRepository, GetSubCategories>(
          update: (context, repo, previous) => GetSubCategories(repo),
        ),
        ChangeNotifierProvider<SubCategoryProvider>(
          create: (context) =>
              SubCategoryProvider(context.read<GetSubCategories>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Colors.white),
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CategoriesPage(),
      ),
    );
  }
}
