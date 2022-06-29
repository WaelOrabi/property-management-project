import 'package:flutter/material.dart';
import 'package:project_111/features/properties/presentation/widgets/property_details_widgets/message_line_comment_widget.dart';
class MessageStreamBuilderComment extends StatelessWidget {
  const MessageStreamBuilderComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MessageLineComment> messageWidgets =const [
      MessageLineComment(text: 'message1', sender: "Ayham"),
      MessageLineComment(text: 'message2', sender: "Wael"),
      MessageLineComment(text: 'message3', sender: "Ayham")
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