import 'package:flutter_application_ecom/repository/conversation_repo.dart';
import 'package:get/get.dart';

class ConversationController extends GetxController{
  var conversations = [].obs;
  final ConversationRepo repo;

  ConversationController({
    required this.repo
  });

    Future<String> createConversation(
      String sellerId,
      String productId,
  ) async {

    return await repo.createConversation(sellerId, productId);
  }


  Future<void> getConversations() async{
    final data = await repo.getConversations();
    conversations.assignAll(data);
  }
}