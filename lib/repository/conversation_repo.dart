import 'package:flutter_application_ecom/api/api_client_rev.dart';

class ConversationRepo {

  Future<String> createConversation(String sellerId, String productId) async{
    final res = await ApiClientRev.dioClient.post(
      "/api/conversations",
      data: {
        "sellerId": sellerId,
        "productId": productId
      },
    );

    if(res.data["conversationId"] == null){
      throw Exception("Conversation creation failed");
    }
    return res.data["conversationId"];
  }


  Future<List<dynamic>> getConversations() async{
    final res = await ApiClientRev.dioClient.get("/api/conversations");
    return res.data["conversations"];
  }
}