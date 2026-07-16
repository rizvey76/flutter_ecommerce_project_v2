import 'package:flutter_application_ecom/repository/product_repo_rev.dart';
import 'package:get/get.dart';

class ProductControllerRev extends GetxController{
  // final ProductRepoRev productRepoRev;
  // ProductControllerRev({
  //   required this.productRepoRev
  // });

  // var products = [].obs;
  // var loading = false.obs;

  // Future<void> loadProducts() async {
  //   loading.value = true;
  //   products.value = await productRepoRev.getProducts();
  //   loading.value = false;
  // }
  final ProductRepoRev productRepoRev;

  ProductControllerRev({
    required this.productRepoRev,
  });

  var products = <dynamic>[].obs;
  var loading = false.obs;

  // Future<void> loadProducts() async {
  //   loading.value = true;
  //   products.value = await productRepoRev.getProducts();

  //   loading.value = false;
  // }

  Future<void> loadProducts() async {
  loading.value = true;

  final data = await productRepoRev.getProducts();
  print("PRODUCT JSON ----- $data"); // ✅ THIS

  products.value = data;
  loading.value = false;
}
}