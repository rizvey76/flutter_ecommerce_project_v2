import 'package:flutter_application_ecom/models/products_model.dart';
import 'package:flutter_application_ecom/repository/compared_product_repo.dart';
import 'package:get/get.dart';

class ComparedProductController extends GetxController {
  List<dynamic> _comparedProductlist = [];
  List<dynamic> get comparedProductlist => _comparedProductlist;
  final ComparedProductRepo comparedProductRepo;
  ComparedProductController({required this.comparedProductRepo});

  Future<void> getComparedProductList() async {
    Response response = await comparedProductRepo.getComparedProducts();

    if (response.statusCode == 200) {
      _comparedProductlist = [];
      _comparedProductlist = ComparedProducts.fromJsonList(response.body);
      update();
      // print(_comparedProductlist);
      // print(
      //     "Pairs of products ----------------${ComparedProducts.fromJsonList(response.body)}");
    } else {
      print("check API");
    }
  }
}
