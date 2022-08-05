import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class InputWidget extends StatefulWidget {
  final List<String> ? message;
 String ?x;
  final TextEditingController controller;
  final bool isEmojiVisible;
  final bool isKeyboardVisible;
  final Function onBlurred;
  final ValueChanged<String> onSentMessage;
  final bool iscomment;

  InputWidget({
    required this.controller,
    required this.isEmojiVisible,
    required this.isKeyboardVisible,
    required this.onSentMessage,
    required this.onBlurred,
    this.iscomment = false,
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {

  final focusNode = FocusNode();

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
                    Expanded(child: buildTextField(iscomment: widget.iscomment,context:context)),
                  ],
                ),
              ),
            ),
          ),
          buildSend(iscomment: widget.iscomment),
        ],
      );

  Widget buildEmoji() => IconButton(
        icon: Icon(
          widget.isEmojiVisible
              ? Icons.keyboard_rounded
              : Icons.emoji_emotions_outlined,color: Theme.of(context).textTheme.bodyText2!.color,
        ),
        onPressed: onClickedEmoji,
      );

  Widget buildTextField({required bool iscomment,required BuildContext context}) => Padding(
    padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    child: TextFormField(

          cursorColor: Colors.black,
          autofocus: true,
          focusNode: focusNode,
          controller: widget.controller,
          onChanged: (val){

          },
      style: TextStyle(
          color: Theme.of(context).textTheme.bodyText2!.color),
          decoration:  InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: iscomment?'Add Comment':'Type your message...',
          ),
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
                  icon: Icon(
                   widget.controller.text.isEmpty? Icons.mic:Icons.play_arrow_sharp,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.message!.add(widget.controller.text);
                      widget.controller.clear();
                    });


                  },
                ),
              ),
      );

  void onClickedEmoji() async {
    if (widget.isEmojiVisible) {
      focusNode.requestFocus();
    } else if (widget.isKeyboardVisible) {
      await SystemChannels.textInput.invokeMethod('TextInput.hide');
      await Future.delayed(const Duration(milliseconds: 50));
    }
    widget.onBlurred();
  }
}
