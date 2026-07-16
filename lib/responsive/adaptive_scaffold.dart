import 'package:flutter/material.dart';

class AdaptiveScaffold extends StatelessWidget {

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final Widget child;
  const AdaptiveScaffold({super.key,
  required this.selectedIndex,
  required this.onDestinationSelected,
  required this.child});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final isMobile = width < 600;
    final isTablet = width >= 600 && width < 1024;
    final isDesktop = width >= 1024;

    const destinations = [
      NavigationRailDestination(
        icon: Icon(Icons.home_outlined),
         selectedIcon: Icon(Icons.home),
         label: Text('Home'),
         ),

           NavigationRailDestination(
        icon: Icon(Icons.shopping_bag_outlined),
        selectedIcon: Icon(Icons.shopping_bag),
        label: Text('Products'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.receipt_long_outlined),
        selectedIcon: Icon(Icons.receipt_long),
        label: Text('Orders'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.person_outline),
        selectedIcon: Icon(Icons.person),
        label: Text('Profile'),
      ),   
    ];
    return Scaffold(
      body: Row(
        children: [
          if(isTablet)
          NavigationRail(
            destinations: destinations, selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.all,),

         if(isDesktop)
         NavigationRail(
          extended: true,
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          destinations: destinations,
         ), 

         Expanded(child: child),  
        ],
      ),

      bottomNavigationBar: isMobile ? NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: const [
                          NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.shopping_bag_outlined),
                  selectedIcon: Icon(Icons.shopping_bag),
                  label: 'Products',
                ),
                NavigationDestination(
                  icon: Icon(Icons.receipt_long_outlined),
                  selectedIcon: Icon(Icons.receipt_long),
                  label: 'Orders',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: 'Profile',
                ),
        ]) : null ,
    );
  }
}