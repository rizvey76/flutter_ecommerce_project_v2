import 'package:flutter_application_ecom/test_widgets/segmentedButton/segmented_controller.dart';
import 'package:get/get.dart';

class SegmentedDependency extends Bindings {
  @override
  void dependencies() {

   

    //controller
    Get.lazyPut<ProductViewController>(() => ProductViewController());
  }
}