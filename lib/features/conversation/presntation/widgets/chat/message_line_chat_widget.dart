
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
class MessageLineChat extends StatelessWidget {
  const MessageLineChat(
      {required this.text, required this.sender, required this.isMe, Key? key})
      : super(key: key);
  final String text;
  final String sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              sender,
              style: TextStyle(
                color: Colors.yellow[900],
                fontSize: 12,
              ),
            ),
           Container(
             constraints: BoxConstraints(
               maxWidth: double.infinity,
             ),
             // width: 350,
              child: Material(
                elevation: 5,
                color: isMe ? Colors.green : Theme
                    .of(context)
                    .colorScheme
                    .primary,
                borderRadius: isMe
                    ? const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
                    : const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 300,
                        child: AutoSizeText(
                         text,
                          style:TextStyle(
                            fontSize: 15,
                            color: isMe ? Colors.white : Theme
                                .of(context)
                                .colorScheme
                                .secondary,
                          ),
                          maxLines: null,
                        ),
                      ),

                      Align(
                          alignment: Alignment.topRight,
                          child: Row(mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.check, size: 12,),
                              Icon(Icons.check, size: 12,)
                            ],)),
                    ],
                  ),

                ),
              ),
            ),
          ],
        ),
      );
  }
}

