import 'package:flutter_application_ecom/test_widgets/autoComplete_search/a_product_controller.dart';
import 'package:flutter_application_ecom/test_widgets/autoComplete_search/a_product_repo.dart';
import 'package:get/get.dart';

class AProductBinding extends Bindings {
  @override
  void dependencies() {

    // repository
    Get.lazyPut<AProductRepository>(() => AProductRepository(),fenix: true);

    //controller
    Get.lazyPut<AProductController>(() => AProductController(Get.find()));
  }
}