import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: Text('Product ${index + 1}'),
            subtitle: const Text('Product description'),
            trailing: const Text('\$99'),
          ),
        );
      },
    );
  }
}