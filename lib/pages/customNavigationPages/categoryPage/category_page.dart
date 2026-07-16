import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/pages/customNavigationPages/categoryPage/categoryItems/category_navbar.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoryNavbar(),
    );
  }
}
