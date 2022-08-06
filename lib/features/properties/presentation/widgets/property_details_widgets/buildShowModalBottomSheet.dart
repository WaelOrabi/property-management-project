import 'package:flutter/material.dart';
import 'message_stream_builder_comment_widget.dart';
Future<dynamic> buildShowModalBottomSheet({required BuildContext context,required TextEditingController messageController,required String? comment}) {
  return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
      backgroundColor: Colors.white,
      context: context,
      isScrollControlled: true,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const MessageStreamBuilderComment(),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.green, width: 2),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Row(
                  children: [
                    IconButton(onPressed:(){}, icon:const Icon(Icons.keyboard)),
                    Expanded(
                        child: TextField(
                          controller: messageController,
                          onChanged: (value) {
                            comment = value;
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            hintText: 'write your message here...',
                            border: InputBorder.none,
                          ),
                        )),
                    TextButton(
                        onPressed: () {
                          messageController
                              .clear(); //here the value will be deleted controller
                          // here the value will be send comment
                        },
                        child: Text(
                          'send',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green[800],
                            fontSize: 18,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
}