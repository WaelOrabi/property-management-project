import 'package:flutter/material.dart';
import '../../../../authentication/domain/entities/user.dart';
import 'message_line_chat_widget.dart';
class MessageStreamBuilderChat extends StatelessWidget {
  final User user;
  final bool? isRead;
  const MessageStreamBuilderChat({Key? key,required this.user, this.isRead}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      Iterable<String>messages=user.messages!.reversed;
    List<MessageLineChat> messageWidgets=messages.map((message) {
      return MessageLineChat(text: message,sender: user.firstName,isMe: false,isRead: isRead,);
    }).toList();
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: ListView(
          primary: false,
          reverse: true,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          children: messageWidgets,
        ),
      ),
    );
  }
}