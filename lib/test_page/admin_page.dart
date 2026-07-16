import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller_rev.dart';

class AdminPage extends StatelessWidget {
  AdminPage({super.key});

  // Get controller from DI
  final ProductControllerRev productController =
      Get.find<ProductControllerRev>();

  @override
  Widget build(BuildContext context) {
    // Load products when page opens
    productController.loadProducts();
      
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin – Products"),
      ),
      body: Obx(() {
        if (productController.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (productController.products.isEmpty) {
          return const Center(child: Text("No products found"));
        }

        return  Container();
        // ListView.builder(
        //   itemCount: productController.products.length,
        //   itemBuilder: (context, index) {
        //     final product = productController.products[index];

        //     return Card(
        //       margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        //       child: ListTile(
        //         title: Text(
        //           product['name']?.toString() ?? 'No name',
        //         ),
        //         subtitle: Text(
        //           product['price']?.toString() ?? 'No price',
        //         ),
        //       ),
        //     );
        //   },
        // );
      }),
    );
  }
}
