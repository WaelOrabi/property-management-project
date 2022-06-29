import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:project_111/core/widgets/property.dart';
import 'package:project_111/features/conversation/presntation/pages/chat.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:path/path.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../widgets/property_details_widgets/buildShowModalBottomSheet.dart';

class PropertyListingDetails extends StatefulWidget {
  final Property? property;
  static String routeName = 'PropertyListingDetails';

  const PropertyListingDetails({Key? key, this.property}) : super(key: key);

  @override
  State<PropertyListingDetails> createState() => _PropertyListingDetailsState();
}

class _PropertyListingDetailsState extends State<PropertyListingDetails> {
  double _currentPosition = 0.0;
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
    );
  }

  Widget buildBody(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(""
                  //  join(widget.property!.image![_currentPosition.toInt()]),
                    //width: double.infinity,
                    //height: MediaQuery.of(context).size.height / 2.5,
                  ),
                ),
                buildDotsIndicator(),
              ],
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

  DotsIndicator buildDotsIndicator() {
    return DotsIndicator(
                dotsCount: widget.property!.image.length,
                position: _currentPosition,
                onTap: (position) {
                  if (position >= widget.property!.image.length) {
                    _currentPosition = 0;
                  }
                  setState(() => _currentPosition = position);
                },
                decorator: DotsDecorator(
                  activeColor: Colors.green,
                  size: const Size.square(10.0),
                  activeSize: const Size.square(10.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              );
  }

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
