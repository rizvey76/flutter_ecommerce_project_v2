import 'package:flutter_application_ecom/repository/chat_repo.dart';
import 'package:flutter_application_ecom/socket/socket_service.dart';
import 'package:get/get.dart';

class ChatController extends GetxController{
 final ChatRepo chatRepo;

 ChatController({
  required this.chatRepo
 });
 

 var messages = [].obs;

//message will load autometically
 @override
 void onInit(){
  super.onInit();
  listenMessages();
 }

 @override
void onClose(){
  SocketService.socket.off("receive_message");
  super.onClose();
}


 void joinConversation(String conversationId){
  chatRepo.joinConversation(conversationId);
 }

 void sendMessage(String conversationId,String text){
  chatRepo.sendMessage(conversationId, text);
 }

 void listenMessages(){
  chatRepo.listenMessages(
    (data){
      messages.add(data);
      print("New message: $data");
    }
  );
 }


 Future<void> loadMessages(String conversationId) async{
  final data = await chatRepo.getMessages(conversationId);
  messages.assignAll(data);
 }

 //auto join conversation
 Future<void> openChat(String conversationId) async{
  await loadMessages(conversationId);
  joinConversation(conversationId);
 }


}