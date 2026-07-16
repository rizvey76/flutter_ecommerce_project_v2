import 'package:flutter/material.dart';
import 'package:flutter_application_ecom/controllers/chat_controller.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {

  final String conversationId;

  const ChatPage({
    super.key,
    required this.conversationId,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final ChatController controller = Get.find<ChatController>();
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    controller.joinConversation(widget.conversationId);
    controller.listenMessages();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),

      body: Column(
        children: [

          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {

                  final msg = controller.messages[index];

                  return ListTile(
                    title: Text(msg["text"] ?? ""),
                  );
                },
              ),
            ),
          ),

          Row(
            children: [

              Expanded(
                child: TextField(
                  controller: textController,
                ),
              ),

              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {

                  controller.sendMessage(
                    widget.conversationId,
                    textController.text,
                  );

                  textController.clear();
                },
              )

            ],
          )

        ],
      ),
    );
  }
}
