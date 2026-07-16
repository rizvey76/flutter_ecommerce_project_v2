import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/presentation/components/product_card.dart';

class HomeTabletView extends StatelessWidget {
  const HomeTabletView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const  EdgeInsets.all(20),
      itemCount: 20,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.4,
        ), 
        itemBuilder: (_, index){
          return ProductCardN();
        });
  }
}