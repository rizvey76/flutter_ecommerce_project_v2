import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/pages/home/home_page.dart';
import 'package:flutter_application_ecom/presentation/pages/home_pagen.dart';
import 'package:flutter_application_ecom/presentation/pages/order_pagen.dart';
import 'package:flutter_application_ecom/presentation/pages/product_pagen.dart';
import 'package:flutter_application_ecom/presentation/pages/profile_pagen.dart';
import 'package:flutter_application_ecom/presentation/pages/settings_pagen.dart';
import 'package:flutter_application_ecom/responsive/adaptive_scaffold.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int currentIndex = 0;

  final pages = const [
    HomePageN(),
    ProductsPage(),
    OrdersPage(),
    ProfilePage(),
    SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
   return AdaptiveScaffold(selectedIndex: currentIndex,
    onDestinationSelected: (index){
      setState(() {
        currentIndex = index;
      });
    }, child: IndexedStack(
      index: currentIndex,
      children: pages,
    ));
  }
}