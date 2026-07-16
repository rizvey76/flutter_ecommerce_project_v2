import 'package:flutter/foundation.dart';
import 'package:flutter_application_ecom/api/api_client.dart';
import 'package:flutter_application_ecom/api/token_storage.dart';
import 'package:flutter_application_ecom/controllers/auth_controller.dart';
import 'package:flutter_application_ecom/controllers/compared_product_controller.dart';
import 'package:flutter_application_ecom/controllers/popular_product_controller.dart';
import 'package:flutter_application_ecom/controllers/user_controller.dart';
import 'package:flutter_application_ecom/repository/auth_repo.dart';
import 'package:flutter_application_ecom/repository/compared_product_repo.dart';
import 'package:flutter_application_ecom/repository/popular_product_repo.dart';
import 'package:flutter_application_ecom/repository/user_repo.dart';
import 'package:flutter_application_ecom/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  //for token 
  Get.put<TokenStorage>(
    kIsWeb ? MemoryTokenStorage() : SecureTokenStorage(),
    permanent: true,
  );




  // Get.put<TokenStorage>(
  //   _createTokenStorage(),
  //   permanent: true,
  // );
// TokenStorage _createTokenStorage() {
//   if (kIsWeb) {
//     return MemoryTokenStorage();
//   }
//   return SecureTokenStorage();
// }

  //api client
 // 🌐 Api Client
  // Get.put<ApiClient>(
  //   ApiClient(appBaseUrl: AppConstants.BASE_URL),
  //   permanent: true,
  // );

  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));

//repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => ComparedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

//controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => ComparedProductController(comparedProductRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
}
