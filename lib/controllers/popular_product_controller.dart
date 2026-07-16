import 'package:flutter_application_ecom/models/products_model.dart';
import 'package:flutter_application_ecom/repository/popular_product_repo.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  PopularProductController({required this.popularProductRepo});
  final PopularProductRepo popularProductRepo;

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  //Get Data to pass Client
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProducts();
    if (response.statusCode == 200) {
      // print("Product found");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      print('product list -- $_popularProductList');
      update();
    } else {
      print("Problem occured!!!!!!!!!!!!!!!!");
    }

    ///error handling
    // try {
    //   _popularProductList = [];
    //   _popularProductList.addAll(Product.fromJson(response.body).produts);
    //   print("Length of data is ====== ${_popularProductList.length}");
    //   update();
    // } catch (e) {
    //   print("problem is here $e");
    // }
  }
}
