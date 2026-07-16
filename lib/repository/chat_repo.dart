import 'package:flutter_application_ecom/api/api_client_rev.dart';
import 'package:flutter_application_ecom/socket/socket_service.dart';

class ChatRepo{


   void joinConversation(String conversationId){
  // SocketService.socket.emit(
  //   "join_conversation",
  //   conversationId
  // );
  SocketService.joinConversation(conversationId);
 }

 void sendMessage(String conversationId,String text){
  SocketService.emit(
    "send_message",
    {
      "conversationId": conversationId,
      "text": text
    }
  );
 }


 void listenMessages( Function(dynamic) callback){
  //prevent duplicate listener
  SocketService.socket.off("receive_message");


   SocketService.socket.on(
    "receive_message",
     (data){
      callback(data);
     });
 }


 Future<List<dynamic>> getMessages(String conversationId) async{
  final res = await ApiClientRev.dioClient.get(
    "/api/conversations/$conversationId/messages",
  );
  return res.data["messages"];
 }
}