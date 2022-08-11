import 'dart:io';
import 'package:flutter/material.dart';
import 'property_listing_details.dart';
import '../../../../tests/tests.dart';

class PageNotification extends StatefulWidget {
  static String routeName = 'PageNotification';
  final int ? idProperty;
  const PageNotification({Key? key, this.idProperty}) : super(key: key);

  @override
  State<PageNotification> createState() => _PageNotificationState();
}

class _PageNotificationState extends State<PageNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: buildAppBar(context),
      body: buildBody(),
    );
  }

  Padding buildBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: ListView.separated(
        itemCount: Te.notificationMessage.length,
        itemBuilder: (BuildContext context, index) {
          File? file = Te.notificationMessage[index].image;
          return InkWell(
            onLongPress: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Material(
                      color:Theme.of(context).backgroundColor,
                      child: SizedBox(
                        height: 100,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              Te.notificationMessage.removeAt(index);
                            });
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context)
                                .showSnackBar( SnackBar(
                              backgroundColor: Theme.of(context).colorScheme.secondary,
                              content: Text("This notice has been removed",style: TextStyle( color:Theme.of(context).colorScheme.primary,)),
                            ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children:  [
                                Icon(Icons.delete_forever,color: Theme.of(context).iconTheme.color,),
                                const SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  'remove this notice',
                                  style: TextStyle(
                                      color: Theme.of(context).colorScheme.secondary, fontSize: 20),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return PropertyListingDetails(
                  property: Te.user
                      .listProperty![Te.notificationMessage[index].idProperty],
                );
              }));
            },
            child: ListTile(
              leading:file==null?const CircleAvatar(
                backgroundImage:AssetImage('assets/images/download.png'),
                radius: 35,
              ): CircleAvatar(
                radius: 35,
                backgroundImage: FileImage(file),
              ),
              title: Te.notificationMessage[index].message != null
                  ? Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: "commented on your post by ",
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.secondary)),
                        TextSpan(
                            text:
                                " ${Te.notificationMessage[index].firstName} ${Te.notificationMessage[index].lastName}",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor)),
                      ]),
                    )
                  : Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  " ${Te.notificationMessage[index].firstName} ${Te.notificationMessage[index].lastName}",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor)),
                          TextSpan(
                              text: "mentioned you in a comment ",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                        ],
                      ),
                    ),
              subtitle: Text(
                Te.notificationMessage[index].message ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 30,
            child: Divider(
              endIndent: 20,
              indent: 25,
              height: 1,
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Notifications',
          style: Theme.of(context).appBarTheme.textTheme!.bodyText1),
    );
  }
}
// ElegantNotification.success(
// title: Text('notification'),
// description: Text('Your data has been updated'),
// notificationPosition: NotificationPosition.top,
// dismissible: true,
//
// onProgressFinished:  (){
// setState(() {
// Te.notificationMessage.add(value);
// Navigator.of(context).push('PageNotification');
// })
// },
// onDismiss: (){
// setState(() {
// Te.notificationMessage.add(value);
// Navigator.of(context).push('PageNotification');
// })
// },
// ),
