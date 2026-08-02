import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/test_widgets/autoComplete_search/a_productAutocomplete.dart';
import 'package:flutter_application_ecom/test_widgets/autoComplete_search/a_product_controller.dart';
import 'package:flutter_application_ecom/test_widgets/autoComplete_search/a_product_model.dart';
import 'package:get/get.dart';

class ProductSearchPage extends StatelessWidget {
  const ProductSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AProductController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AProductautocomplete(
              onProductSelected: (product) {
                controller.selectProduct(product);
              },
            ),

            const SizedBox(height: 24),

            Expanded(
              child: Obx(() {
                final AProductModel? product =
                    controller.selectedProduct.value;

                if (product == null) {
                  return const Center(
                    child: Text(
                      'Select a product',
                    ),
                  );
                }

                return Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage:
                                NetworkImage(product.image),
                          ),
                        ),

                        const SizedBox(height: 20),

                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall,
                        ),

                        const SizedBox(height: 8),

                        Text(
                          'Brand: ${product.brand}',
                        ),

                        Text(
                          'Category: ${product.category}',
                        ),

                        Text(
                          'Stock: ${product.stock}',
                        ),

                        const SizedBox(height: 12),

                        Text(
                          '\$${product.price}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}