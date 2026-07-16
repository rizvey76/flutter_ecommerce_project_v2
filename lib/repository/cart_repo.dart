import 'dart:convert';

import 'package:flutter_application_ecom/models/cart_model.dart';
import 'package:flutter_application_ecom/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  ///add data to cart
  void addToCartList(List<CartModel> cartList) {
    var time = DateTime.now().toString();
    cart = [];
    for (var element in cartList) {
      element.time = time;
      continue;
    }

    /// temporay saving of cart info in memory database
    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);

    print(sharedPreferences.getStringList(AppConstants.CART_LIST));
  }

  ///get cart info
  List<CartModel> getCartList() {
    List<String> carts = [];
    List<CartModel> cartList = [];

    ///search data on in memory database through key
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      print("inside getCartList$carts");
    } else {
      print("your cart is empty");
    }

    for (var element in carts) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    }

    return cartList;
  }

  ///add to cart history
  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    } else {
      for (int i = 0; i < cart.length; i++) {
        cartHistory.add(cart[i]);
      }
      removeCart();
      sharedPreferences.setStringList(
          AppConstants.CART_HISTORY_LIST, cartHistory);
    }
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }

  ///get cart history list
  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    } else {
      print("CartHistoryList not found");
    }

    List<CartModel> cartHistoryList = [];
    for (var element in cartHistory) {
      continue;
    }
    return cartHistoryList;
  }

  void clearCartHistory() {
    removeCart();
    cartHistory = [];
    sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
  }
}
