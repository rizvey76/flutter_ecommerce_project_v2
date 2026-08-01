import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/test_widgets/statefulBuilderFull/statefulBuilder_checkout_controller.dart';
import 'package:flutter_application_ecom/test_widgets/statefulBuilderFull/statefulBuilder_model.dart';
import 'package:flutter_application_ecom/test_widgets/statefulBuilderFull/statefulBuilder_order_dialog.dart';
import 'package:get/get.dart';

class CheckoutPage extends GetView<CheckoutController>{
  const CheckoutPage({super.key});

  Future<void> _onPlaceOrder() async {
    //open dialog
    final OrderConfirmation? order = 
        await OrderDialog.show(Get.context!);

    //user pressed cancel 
    if(order == null) return;

    // call controller
    await controller.placeOrder(order);    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),
      body: Center(
        child: Obx(
          () {


      return Column(
        mainAxisSize: MainAxisSize.min,

        children: [

        if(controller.isLoading.value) const CircularProgressIndicator(),
       
       const SizedBox(height: 20),

       FilledButton(
        onPressed: controller.isLoading.value ? null : _onPlaceOrder,
         child: const Text("Place Order"),
       ),

        ],
      );


        }
        ),
      ),
    );
  }
}