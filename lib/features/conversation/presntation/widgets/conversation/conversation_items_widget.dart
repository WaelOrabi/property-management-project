
import 'package:flutter/material.dart';
import '../../../../../core/paramaters.dart';
import '../../pages/chat.dart';

InkWell buildChatItem({required User ? user,required BuildContext context}) {
  bool isRead=false;
  return InkWell(
    onTap: () {
      print(!isRead);
      Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Chat(user:user!,isRead: !isRead,)));
    },
    child: Row(
      children: [
        user!.image==null?const CircleAvatar(
        backgroundImage:AssetImage('assets/images/download.png'),
    radius: 30,
  ):CircleAvatar(
          radius: 30.0,
          backgroundImage: FileImage(user.image!),
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
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text:  user.firstName!+' ' + user.lastName!,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ],),
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