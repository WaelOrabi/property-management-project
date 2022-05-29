import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool isEmojiVisible;
  final bool isKeyboardVisible;
  final Function onBlurred;
  final ValueChanged<String> onSentMessage;
  final focusNode = FocusNode();
  final bool iscomment;

  InputWidget({
    required this.controller,
    required this.isEmojiVisible,
    required this.isKeyboardVisible,
    required this.onSentMessage,
    required this.onBlurred,
    this.iscomment = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.green,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    buildEmoji(),
                    Expanded(child: buildTextField(iscomment: iscomment)),
                  ],
                ),
              ),
            ),
          ),
          buildSend(iscomment: iscomment),
        ],
      );

  Widget buildEmoji() => IconButton(
        icon: Icon(
          isEmojiVisible
              ? Icons.keyboard_rounded
              : Icons.emoji_emotions_outlined,
        ),
        onPressed: onClickedEmoji,
      );

  Widget buildTextField({required bool iscomment}) => TextField(
        cursorColor: Colors.black,
        focusNode: focusNode,
        controller: controller,
        style: const TextStyle(fontSize: 16),
        decoration:  InputDecoration.collapsed(
          hintText: iscomment?'Add Comment':'Type your message...',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      );

  Widget buildSend({required bool iscomment}) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: iscomment == true
            ? TextButton(
                onPressed: () {},
                child: Text(
                  'send',
                  style: TextStyle(
                    color: Colors.green[400],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ))
            : CircleAvatar(
                backgroundColor: Colors.green,
                child: IconButton(
                  icon: const Icon(
                    Icons.mic,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ),
      );

  void onClickedEmoji() async {
    if (isEmojiVisible) {
      focusNode.requestFocus();
    } else if (isKeyboardVisible) {
      await SystemChannels.textInput.invokeMethod('TextInput.hide');
      await Future.delayed(const Duration(milliseconds: 50));
    }
    onBlurred();
  }
}
