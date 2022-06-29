import 'package:flutter/material.dart';
import 'package:project_111/features/conversation/presntation/widgets/message_line_chat_widget.dart';
class MessageStreamBuilderChat extends StatelessWidget {
  const MessageStreamBuilderChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MessageLineChat> messageWidgets =const [
      MessageLineChat(text: 'message1', sender: "Ayham", isMe: false),
      MessageLineChat(text: 'message2', sender: "Wael", isMe: true),
      MessageLineChat(text: 'message3', sender: "Ayham", isMe: false)
    ];
    // here you must use streamBuilder to fill in the messageWidgets
    return Expanded(
      child: ListView(
        reverse: true,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: messageWidgets,
      ),
    );
  }
}