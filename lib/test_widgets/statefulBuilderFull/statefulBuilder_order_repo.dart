import 'dart:math';

import 'package:flutter_application_ecom/test_widgets/statefulBuilderFull/statefulBuilder_model.dart';

class OrderRepository{
  Future<void> placeOrder(OrderConfirmation order) async {

    //simulate network delay
    await Future.delayed( const Duration(seconds: 2));

    //simulate random api failure
    final random = Random();
    if(random.nextBool()){
      throw Exception('Failed to place order');
    }

    print("========================");
    print("API REQUEST");
    print(order.toJson());
    print("========================");

  }
}