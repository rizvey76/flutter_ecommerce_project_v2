import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/test_widgets/statefulBuilderFull/statefulBuilder_model.dart';
import 'package:flutter_application_ecom/test_widgets/statefulBuilderFull/statefulBuilder_order_repo.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final OrderRepository _orderRepository;

  CheckoutController(this._orderRepository);

  //Observable loading state
  final RxBool isLoading = false.obs;

  Future<void> placeOrder(OrderConfirmation order) async {
    // prevent duplicate tabs
    if (isLoading.value) return;

    //validation
    final error = _validate(order);

    if(error != null){
      Get.snackbar(
        'Validation Error',
        error,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFB00020),
        colorText: Colors.white,
      );
     return;
    }


    try{
      isLoading.value = true;
      await _orderRepository.placeOrder(order);
      Get.snackbar(
        'Success',
        'Order placed successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFFB00020),
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }

  }


  String? _validate(OrderConfirmation order){

    if(order.deliveryMethod.isEmpty){
      return 'Delivery method is required';
    }

    if(order.note.length > 200){
      return 'Note cannot exceed 200 characters';
    }

    return null;
  }





  void checkout() {
    // Implement checkout logic using _orderRepository
  }
}