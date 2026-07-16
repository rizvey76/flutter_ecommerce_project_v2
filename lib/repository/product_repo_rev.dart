import 'package:flutter_application_ecom/api/api_client_rev.dart';

class ProductRepoRev {
  // Future<List<dynamic>> getProducts() async{
  //   final res = await ApiClientRev.dioClient.get("/api/products");
  //   return res.data;
  // }

   Future<List<dynamic>> getProducts() async {
    final res = await ApiClientRev.dioClient.get("/api/products");

    // ✅ extract the list only
    return res.data['products'] as List<dynamic>;
  }
}