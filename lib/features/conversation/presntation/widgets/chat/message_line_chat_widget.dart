import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MessageLineChat extends StatefulWidget {
  final bool ?isRead;
  const MessageLineChat(
      {required this.text, required this.sender, required this.isMe, Key? key, this.isRead})
      : super(key: key);
  final String text;
  final String sender;
  final bool isMe;

  @override
  State<MessageLineChat> createState() => _MessageLineChatState();
}

class _MessageLineChatState extends State<MessageLineChat> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  void initState() {
    super.initState();

    if (widget.text.length > 50) {
      firstHalf = widget.text.substring(0, 50);
      secondHalf = widget.text.substring(50, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            widget.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            widget.sender,
            style: TextStyle(
              color: Colors.yellow[900],
              fontSize: 12,
            ),
          ),
          Material(
            elevation: 5,
            color: widget.isMe
                ? Colors.green
                : Theme.of(context).colorScheme.primary,
            borderRadius: widget.isMe
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
              padding: const EdgeInsets.only(
                  right: 8, top: 20, bottom: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  secondHalf.isEmpty
                      ? AutoSizeText(
                          widget.text,
                          style: TextStyle(
                            fontSize: 15,
                            color: widget.isMe
                                ? Colors.white
                                : Theme.of(context).colorScheme.secondary,
                          ),
                          maxLines: 100,
                        )
                      : Column(

                          children: <Widget>[
                            AutoSizeText(
                              flag
                                  ? (firstHalf + "...")
                                  : (firstHalf + secondHalf),
                              style: TextStyle(
                                fontSize: 15,
                                color: widget.isMe
                                    ? Colors.white
                                    : Theme.of(context).colorScheme.secondary,
                              ),
                              maxLines: 100,
                            ),
                            InkWell(
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                   Text(
                                    flag ? "show more" : "show less",
                                    style: TextStyle(color: Colors.green),
                                  ),
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  flag = !flag;
                                });
                              },
                            ),
                          ],
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children:  [
                        if(widget.isRead==true)  const Icon(
                            Icons.check,
                            size: 12,
                          color: Colors.blue,
                          ),

                          Icon(
                            Icons.check,
                            size: 12,
                         color:widget.isRead==true?Colors.blue:Colors.grey,
                          ),
                          Text(
                            '12:00',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
