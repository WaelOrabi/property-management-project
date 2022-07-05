import 'dart:io';
import 'package:flutter/material.dart';
import 'property_listing_details.dart';
import '../../../../tests/tests.dart';

class PageNotification extends StatefulWidget {
  static String routeName = 'PageNotification';

  const PageNotification({Key? key}) : super(key: key);

  @override
  State<PageNotification> createState() => _PageNotificationState();
}

class _PageNotificationState extends State<PageNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(),
    );
  }

  Padding buildBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
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
                      child: SizedBox(
                        height: 100,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              Te.notificationMessage.removeAt(index);
                            });
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("This notice has been removed"),
                            ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: const [
                                CircleAvatar(
                                  child: Icon(Icons.delete_forever),
                                  backgroundColor: Colors.grey,
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  'remove this notice',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
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
              selectedColor: Colors.white,
              leading: CircleAvatar(
                radius: 35,
                backgroundImage: FileImage(file),
              ),
              title: Text(
                Te.notificationMessage[index].message != null
                    ? 'commented on your post by ${Te.notificationMessage[index].firstName} ${Te.notificationMessage[index].lastName}'
                    : '${Te.notificationMessage[index].firstName} ${Te.notificationMessage[index].lastName} mentioned you in a comment',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.green),
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
          return const Divider(
            endIndent: 20,
            indent: 25,
            height: 1,
            color: Colors.grey,
          );
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 5.0,
      backgroundColor: Colors.white,
      title: const Text(
        'Notifications',
        style: TextStyle(color: Colors.green, fontSize: 20),
      ),
      centerTitle: true,
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
