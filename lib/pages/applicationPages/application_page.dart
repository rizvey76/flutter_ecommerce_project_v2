import 'package:flutter/material.dart';

import 'package:flutter_application_ecom/common/widgets/custom_search_bar.dart';
import 'package:flutter_application_ecom/common/widgets/navigation_widgets.dart';
import 'package:flutter_application_ecom/pages/customNavigationPages/cartPage/cart_page.dart';
import 'package:flutter_application_ecom/pages/customNavigationPages/categoryPage/category_page.dart';
import 'package:flutter_application_ecom/pages/customNavigationPages/favouritePage/favourite_page.dart';
import 'package:flutter_application_ecom/pages/customNavigationPages/menuPage/menu_page.dart';
import 'package:flutter_application_ecom/pages/home/home_page.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int selectedIndex = 2;

  final List<Map<String, dynamic>> _pages = [
    {'name': '/category', 'widget': CategoryPage()},
    {'name': '/favourite', 'widget': FavouritePage()},
    {'name': '/home', 'widget': HomePage()},
    {'name': '/menu', 'widget': MenuPage()},
    {'name': '/cart', 'widget': CartPage()},
  ];

  final List<Widget> icons = [
    // Icons.search,
    // Icons.camera_alt,
    // Icons.home,

    Text(
      "Home",
      style: TextStyle(fontSize: 10),
    ),

    Text(
      "Search",
      style: TextStyle(fontSize: 10),
    ),

    // CustomIcon(),
    SizedBox(
      width: 60,
    ),
    Text(
      "Person",
      style: TextStyle(fontSize: 10),
    ),

    Text(
      "Settings",
      style: TextStyle(fontSize: 10),
    ),

    // Icons.notifications,
    // Icons.person,
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    // Navigator.pushReplacementNamed(context, _pages[index]['name']);
  }

  // Widget _buildNavItem({required IconData icon, required int index}) {
  //   return IconButton(
  //       onPressed: () => onItemTapped(index),
  //       icon: Icon(
  //         icon,
  //       ));
  // }

  @override
  Widget build(BuildContext context) {
    // final double height;
    // final double width;
    // height = Responsive.of(context).height;
    // width = Responsive.of(context).width;

    // print("Application page height - $height");
    return Scaffold(
      appBar:
          selectedIndex == 0 || selectedIndex == 2 ? CustomSearchBar() : null,
      body: IndexedStack(
        index: selectedIndex,
        children: _pages.map((route) => route['widget'] as Widget).toList(),
      ),
      // floatingActionButton: FloatingActionButton(
      //   heroTag: "button1",
      //   onPressed: () {
      //     print("This is middle");
      //   },
      //   child: Icon(Icons.abc),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNavigation(
        widget: icons,
        onItemTapped: onItemTapped,
        selectedIndex: selectedIndex,
        context: context,
      ),
    );
  }
}
