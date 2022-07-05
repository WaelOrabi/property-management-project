import 'package:flutter/material.dart';
import '../../../../../core/paramaters.dart';
import 'message_line_chat_widget.dart';
class MessageStreamBuilderChat extends StatelessWidget {
  final User ? user;
  const MessageStreamBuilderChat({Key? key,required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<MessageLineChat> messageWidgets=user!.messages!.map((message) {
      return MessageLineChat(text: message,sender: user!.firstName!,isMe: false,);
    }).toList();

    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          reverse: true,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          children: messageWidgets,
        ),
      ),
    );
  }
}