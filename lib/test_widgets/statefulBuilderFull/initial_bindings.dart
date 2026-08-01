import 'package:flutter_application_ecom/test_widgets/statefulBuilderFull/statefulBuilder_checkout_controller.dart';
import 'package:flutter_application_ecom/test_widgets/statefulBuilderFull/statefulBuilder_order_repo.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<OrderRepository>(
      () => OrderRepository(),
      fenix: true,
    );

    Get.lazyPut<CheckoutController>(
      () => CheckoutController(
        Get.find<OrderRepository>(),
      ),
    );
  }
}