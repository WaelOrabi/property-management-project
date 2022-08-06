import 'package:flutter/material.dart';
class MessageLineComment extends StatelessWidget {
  const MessageLineComment(
      {required this.text, required this.sender, Key? key})
      : super(key: key);
  final String text;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              color: Colors.yellow[900],
              fontSize: 12,
            ),
          ),
          Material(
            elevation: 5,
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),

            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  color:  Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}