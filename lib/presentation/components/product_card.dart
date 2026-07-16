import 'package:flutter/material.dart';

class ProductCardN extends StatelessWidget {
  const ProductCardN({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints){
        final compact = constraints.maxWidth < 250;

        return Card(
          child: compact
           ? const Column(
            children: [
              Placeholder(),
              Text("Compact Card")
            ],
           ) 
           : Row(
            children: [
              Expanded(child: Placeholder()),
              Expanded(child: Text("Expanded Card")),
            ],
           ),
        );
      });
  }
}