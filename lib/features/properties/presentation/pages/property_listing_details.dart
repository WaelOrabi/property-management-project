import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:project_111/core/widgets/map_widget.dart';
import 'package:project_111/core/widgets/property.dart';
import 'package:project_111/features/conversation/presntation/pages/chat.dart';
import 'package:project_111/features/properties/presentation/pages/map_screen.dart';
import 'package:project_111/tests/tests.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import '../widgets/property_details_widgets/buildShowModalBottomSheet.dart';

class PropertyListingDetails extends StatefulWidget {
  final Property? property;
  static String routeName = 'PropertyListingDetails';

  const PropertyListingDetails({Key? key, required this.property})
      : super(key: key);

  @override
  State<PropertyListingDetails> createState() => _PropertyListingDetailsState();
}

class _PropertyListingDetailsState extends State<PropertyListingDetails> {
  final double _currentPosition = 0.0;
  ScrollController controllerAppBar = ScrollController();
  final TextEditingController messageController = TextEditingController();
  String? comment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  ScrollAppBar buildAppBar(BuildContext context) {
    return ScrollAppBar(
      titleSpacing: 30,
      controller: controllerAppBar,
      elevation: 0.0,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.green,
          )),
      title: const Text('Property details',
          style: TextStyle(fontSize: 20, color: Colors.green)),
      actions: [ Visibility(
          visible: Te.user.isAdmin==true?true:false,
          child:  IconButton(
          onPressed: () {
            var ad = AlertDialog(
              title:const Text("Do you want to :"),
              content: SizedBox(
                height: 150,
                child: Column(
                  children: [
                    const Divider(
                      height: 10,
                    ),
                    Container(
                      color: Colors.red,
                      child: ListTile(
                        leading:const  Icon(Icons.delete,color: Colors.white,),
                        title:const  Text("Delete this property"),
                        onTap: () =>AwesomeDialog(
                            context: context,
                            animType: AnimType.SCALE,
                            dialogType: DialogType.QUESTION,
                            title: 'ِDelete',
                            desc: 'Do you want to delete this property?',
                            btnOkOnPress: () {
                              setState(() {
                              Navigator.of(context).pop();
                              });
                            },
                          )..show(),


                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.orange,
                      child: ListTile(
                        leading:const Icon(Icons.block,color: Colors.white,),
                        title: const Text("Block this user"),
                        onTap: ()=> AwesomeDialog(
                        context: context,
                        animType: AnimType.SCALE,
                        dialogType: DialogType.WARNING,
                        title: 'ِBlock',
                        desc: 'Do you want to block this user?',
                        btnOkOnPress: () {
                          setState(() {
                            Navigator.of(context).pop();
                          });
                        },
                      )..show(),
                      ),
                    ),
                  ],
                ),
              ),
            );
            showDialog(context: context, builder: (_) => ad);
                },
          icon: const Icon(
            Icons.more_vert,
            color: Colors.green,)
          )),],
    );
  }

  Widget buildBody(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.6,
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.property!.image.length,
                itemBuilder: (context, index) {
                  return Image.file(
                    File(widget.property!.image[_currentPosition.toInt()]
                        .modifiedPath),
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width / 1,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            buildText(widget.property!.category,
                left: 10,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontsize: 20),
            const SizedBox(
              height: 20,
            ),
            buildText('Description',
                left: 10,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontsize: 20),
            buildText(widget.property!.description,
                left: 10,
                right: 10,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
                fontsize: 15,
                maxLines: null),
            const SizedBox(
              height: 20,
            ),


            buildText('Extra info',
                left: 10,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontsize: 20),
            const SizedBox(
              height: 20,
            ),
            buildExtraInfo(
              text1: 'Price',
              text2: widget.property!.price,
            ),
            const SizedBox(
              height: 20,
            ),
            buildExtraInfo(
              text1: 'Space',
              text2: widget.property!.space,
            ),
            const SizedBox(
              height: 20,
            ),
            buildExtraInfo(
              text1: 'Storeys',
              text2: widget.property!.storeys,
            ),
            const SizedBox(
              height: 20,
            ),
            buildExtraInfo(
              text1: 'Bed Room',
              text2: widget.property!.bedRooms,
            ),
            const SizedBox(
              height: 20,
            ),
            buildExtraInfo(
              text1: 'Baths',
              text2: widget.property!.baths,
            ),
            const SizedBox(
              height: 20,
            ),
            buildExtraInfo(
              text1: 'Country',
              text2: widget.property!.address!.country,
            ),
            const SizedBox(
              height: 20,
            ),
            buildExtraInfo(
              text1: 'City',
              text2: widget.property!.address!.city,
            ),
            const SizedBox(
              height: 20,
            ),
            buildExtraInfo(
              text1: 'Region',
              text2: widget.property!.address!.region,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: MediaQuery.of(context).size.height/3,
              width: MediaQuery.of(context).size.width,
              child: MapWidget(latDestination: widget.property!.address!.latitude,longDestination: widget.property!.address!.longitude,),),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              color: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  child: Row(children: [
                    buildText('message',
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontsize: 15),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(Icons.wechat_outlined)
                  ]),
                  onPressed: () {
                    Navigator.of(context).pushNamed(Chat.routeName);
                  },
                ),
                MaterialButton(
                  child: Row(
                    children: [
                      buildText('comment',
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontsize: 15),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(Icons.add_comment_outlined)
                    ],
                  ),
                  onPressed: () async {
                    await buildShowModalBottomSheet(
                        context: context,
                        messageController: messageController,
                        comment: comment);
                  },
                ),
                MaterialButton(
                  child: Row(
                    children: [
                      buildText('like',
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontsize: 15),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(Icons.thumb_up_off_alt_outlined)
                    ],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );

  Padding buildExtraInfo({required String text1, required String text2}) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 20),
      child: Row(
        children: [
          buildText(text1,
              fontsize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          const Spacer(),
          buildText(text2,
              fontsize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
        ],
      ),
    );
  }

  Padding buildText(String text,
      {double left = 0.0,
      double right = 0.0,
      double top = 0.0,
      double bottom = 0.0,
      required FontWeight fontWeight,
      required Color color,
      required double fontsize,
      int? maxLines = 1}) {
    return Padding(
      padding:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: Text(
        text,
        style:
            TextStyle(color: color, fontWeight: fontWeight, fontSize: fontsize),
        maxLines: maxLines,
      ),
    );
  }
}
