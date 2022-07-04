import 'package:flutter/material.dart';
import 'package:project_111/core/widgets/user.dart';
import 'package:project_111/features/conversation/presntation/widgets/chat/message_line_chat_widget.dart';
class MessageStreamBuilderChat extends StatelessWidget {
  final User user;
  const MessageStreamBuilderChat({Key? key,required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MessageLineChat> messageWidgets=user.messages!.map((message) {
      return MessageLineChat(text: message,sender: user.firstName!,isMe: false,);
    }).cast<MessageLineChat>().toList();

    return Expanded(
      child: ListView(
        reverse: true,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: messageWidgets,
      ),
    );
  }
}