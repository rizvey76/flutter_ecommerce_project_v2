import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/presentation/components/product_card.dart';

class HomeMobileView extends StatelessWidget {
  const HomeMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 20,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1.5,),
       itemBuilder: (_, index){
        return ProductCardN();
       });
  }
}