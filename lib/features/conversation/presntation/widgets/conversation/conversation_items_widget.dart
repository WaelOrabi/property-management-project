
import 'package:flutter/material.dart';
import '../../../../../core/paramaters.dart';
import '../../pages/chat.dart';

GestureDetector buildChatItem({required User ? user,required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Chat(user:user!)));
    },
    child: Row(
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage: FileImage(user!.image!),
          backgroundColor: Colors.transparent,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [

                  Text(
                    user.firstName!+' ' + user.lastName!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Text(user.sendTime!),
                ],
              ),

              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                        user.messages![user.messages!.length-1],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      child: Center(child: Text('${user.messages!.length}', style: const TextStyle(
                          color: Colors.white),)),
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}