import 'dart:async';

import 'package:flutter_application_ecom/test_widgets/autoComplete_search/a_product_model.dart';
import 'package:flutter_application_ecom/test_widgets/autoComplete_search/a_product_repo.dart';
import 'package:get/get.dart';

class AProductController extends GetxController{
  AProductController(this._repository);

  final AProductRepository _repository;

  //search results
  final RxList<AProductModel> products = <AProductModel>[].obs;

  ///Loading state
  final RxBool isLoading = false.obs;

  //Error message
  final RxnString errorMessage =  RxnString();

  //Currently selected product
  final Rxn<AProductModel> selectedProduct = Rxn<AProductModel>();

  Timer? _debounce;


  //called when the user types in the search field
  void onSearchChanged(String keyword){
    //cancel the previous timer if it exists
    _debounce?.cancel();

    final query = keyword.trim();

    if(query.isEmpty){
      products.clear();
      errorMessage.value = null;
      isLoading.value = false;
      return;
    }

    _debounce = Timer(
      const Duration(milliseconds: 400),
      () => _search(query),
    );
  }

  Future<void> _search(String keyword) async {

    try{
      isLoading.value = true;
      errorMessage.value = null;

      final result = await _repository.searchProducts(keyword);
      products.assignAll(result);
    }catch(e){
      errorMessage.value = 'An error occurred while searching for products.';
      products.clear();
    } finally {
      isLoading.value = false;
    }

  }


    void selectProduct(AProductModel product) {
    selectedProduct.value = product;
  }


void clearSearch() {
    products.clear();
    errorMessage.value = null;
    isLoading.value = false;
    // selectedProduct.value = null;
  }

  @override
  void onClose() {
    _debounce?.cancel();
    super.onClose();
  }

}