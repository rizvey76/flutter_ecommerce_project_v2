import 'package:flutter/foundation.dart';
import 'package:flutter_application_ecom/api/api_client_rev.dart';
import 'package:flutter_application_ecom/api/token_storage.dart';
import 'package:flutter_application_ecom/controllers/auth_controller_rev.dart';
import 'package:flutter_application_ecom/controllers/chat_controller.dart';
import 'package:flutter_application_ecom/controllers/conversation_controller.dart';
import 'package:flutter_application_ecom/controllers/product_controller_rev.dart';
import 'package:flutter_application_ecom/repository/auth_repo_rev.dart';
import 'package:flutter_application_ecom/repository/chat_repo.dart';
import 'package:flutter_application_ecom/repository/conversation_repo.dart';
import 'package:flutter_application_ecom/repository/product_repo_rev.dart';
import 'package:get/get.dart';

Future<void> initRev() async{
  //Platform-aware token storage
  Get.put<TokenStorage>(
    kIsWeb ? MemoryTokenStorage() : SecureTokenStorage(),
    permanent: true,
  );
  // Initialize Dio AFTER TokenStorage exists
 ApiClientRev.init();

  //repository
  Get.put<AuthRepoRev>(AuthRepoRev());
  Get.put<ProductRepoRev>(ProductRepoRev());
  Get.put<ChatRepo>(ChatRepo());
  Get.put<ConversationRepo>(ConversationRepo());

  //controller
 Get.lazyPut(()=> AuthControllerRev(authRepoRev: Get.find()));
 Get.lazyPut(()=> ProductControllerRev(productRepoRev: Get.find()));
 Get.lazyPut(()=> ChatController(chatRepo: Get.find()));
 Get.lazyPut(()=> ConversationController(repo: Get.find()));
}