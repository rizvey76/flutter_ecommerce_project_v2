import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/presentation/components/filter_panel.dart';
import 'package:flutter_application_ecom/presentation/components/product_card.dart';

class HomeDesktopView extends StatelessWidget {
  const HomeDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
           child: FilterPanel()),

          Expanded(
            flex: 4,
             child: GridView.builder(
               padding: const EdgeInsets.all(24),
               itemCount: 20,
               gridDelegate: 
                const SliverGridDelegateWithFixedCrossAxisCount(
                  
                  crossAxisCount: 4,
                  childAspectRatio: 1.3,
                  ),
                 itemBuilder: (_, index){
                  return const ProductCardN();
                 })) 
      ],
    );
  }
}