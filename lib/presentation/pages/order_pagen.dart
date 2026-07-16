import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: const Icon(Icons.receipt_long),
            title: Text('Order #${1000 + index}'),
            subtitle: const Text('Completed'),
            trailing: const Text('\$250'),
          ),
        );
      },
    );
  }
}