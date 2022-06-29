import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:project_111/features/conversation/presntation/pages/chat.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:path/path.dart';
import 'package:dots_indicator/dots_indicator.dart';

class PropertyListingDetails extends StatefulWidget {
  static String routeName = 'PropertyListingDetails';

  const PropertyListingDetails({Key? key}) : super(key: key);

  @override
  State<PropertyListingDetails> createState() => _PropertyListingDetailsState();
}

class _PropertyListingDetailsState extends State<PropertyListingDetails> {
  final messages = <String>[];
  final controllerInputWidget = TextEditingController();
  bool isEmojiVisible = false;
  bool isKeyboardVisible = false;
  var items = ['Remove From Favorites', 'Add Review', 'Send Message'];
  final _totalDots = 5;
  double _currentPosition = 0.0;
  var controllerAppBar = ScrollController();

  double _validPosition(double position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1.0;
    return position;
  }

  void _updatePosition(double position) {
    setState(() => _currentPosition = _validPosition(position));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    KeyboardVisibilityController().onChange.listen((bool isKeyboardVisible) {
      setState(() {
        this.isKeyboardVisible = isKeyboardVisible;
      });

      if (isKeyboardVisible && isEmojiVisible) {
        setState(() {
          isEmojiVisible = false;
        });
      }
    });
  }

  late BuildContext context;
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    context = context;
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  ScrollAppBar buildAppBar(BuildContext context) {
    final List<String> items = [
      'Remove From Favorites',
      'Send Message',
    ];
    String? selectedValue;
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
      title: const Text('1100 Sacramento Street',
          style: TextStyle(fontSize: 20, color: Colors.green)),

    );
  }

  Widget buildBody(BuildContext context) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      join('assets', 'images', 'image1.jpg'),
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 140,
                    child: DotsIndicator(
                      dotsCount: 7,
                      position: _currentPosition,
                      onTap: (position) {
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
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              buildText('1100 Sacramento Street        3,540,000',
                  left: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontsize: 20),
              const SizedBox(
                height: 20,
              ),
              buildText(
                  'Fabulous and modern two - bedroom two bath , home located in the heart of North Beach ! IninThe unit has a contemporary and inviting floor plan characterized with gorgeous wood floors , gourmet kitchen with high - end appliances , a comfortable living / dining area , and two significant bedrooms that are separated for privacy .',
                  left: 10,
                  right: 10,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                  fontsize: 15,
                  maxLines: null),
              const SizedBox(
                height: 20,
              ),
              buildText('Location',
                  left: 10,
                  fontWeight: FontWeight.bold,
                  fontsize: 20,
                  color: Colors.black),
              const SizedBox(
                height: 200,
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
                  text1: 'Baths',
                  left1: 20,
                  color1: Colors.black,
                  fontsize1: 15,
                  fontWeight1: FontWeight.bold,
                  text2: '1ba',
                  right2: 100,
                  color2: Colors.grey,
                  fontsize2: 15),
              const SizedBox(
                height: 20,
              ),
              buildExtraInfo(
                  text1: 'Rent or Buy',
                  left1: 20,
                  color1: Colors.black,
                  fontsize1: 15,
                  fontWeight1: FontWeight.bold,
                  text2: 'Rent',
                  right2: 100,
                  color2: Colors.grey,
                  fontsize2: 15),
              const SizedBox(
                height: 20,
              ),
              buildExtraInfo(
                  text1: 'Bedrooms',
                  left1: 20,
                  color1: Colors.black,
                  fontsize1: 15,
                  fontWeight1: FontWeight.bold,
                  text2: '1bd',
                  right2: 100,
                  color2: Colors.grey,
                  fontsize2: 15),
              const SizedBox(
                height: 20,
              ),
              buildExtraInfo(
                  text1: 'Close to Public TransPortation',
                  left1: 20,
                  color1: Colors.black,
                  fontsize1: 15,
                  fontWeight1: FontWeight.bold,
                  text2: 'Yes',
                  right2: 100,
                  color2: Colors.grey,
                  fontsize2: 15),
              const SizedBox(
                height: 20,
              ),
              buildExtraInfo(
                  text1: 'New Construction',
                  left1: 20,
                  color1: Colors.black,
                  fontsize1: 15,
                  fontWeight1: FontWeight.bold,
                  text2: 'No',
                  right2: 100,
                  color2: Colors.grey,
                  fontsize2: 15),
              const SizedBox(
                height: 20,
              ),
              buildExtraInfo(
                  text1: 'Year Built',
                  left1: 20,
                  color1: Colors.black,
                  fontsize1: 15,
                  fontWeight1: FontWeight.bold,
                  text2: '<2000',
                  right2: 100,
                  color2: Colors.grey,
                  fontsize2: 15),
              const SizedBox(
                height: 20,
              ),
              buildExtraInfo(
                  text1: 'Square feet',
                  left1: 20,
                  color1: Colors.black,
                  fontsize1: 15,
                  fontWeight1: FontWeight.bold,
                  text2: '1ba',
                  right2: 100,
                  color2: Colors.grey,
                  fontsize2: 15),
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
                    onPressed: ()async{
                      await buildShowModalBottomSheet(context);
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

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        builder: (context) => Container(
          height: MediaQuery.of(context).size.height * 0.90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: buildTextField(
                            iscomment: true, context: context)),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget buildSend({required bool iscomment}) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: iscomment == true
            ? TextButton(
                onPressed: () {},
                child: Text(
                  'send',
                  style: TextStyle(
                    color: Colors.green[400],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ))
            : CircleAvatar(
                backgroundColor: Colors.green,
                child: IconButton(
                  icon: const Icon(
                    Icons.mic,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ),
      );



  Widget buildTextField(
          {required bool iscomment, required BuildContext context}) =>
      Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: TextField(
          decoration: InputDecoration(
            suffixIcon: buildSend(iscomment: true),
            hintText: iscomment ? 'Add Comment' : 'Type your message...',
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.keyboard_rounded),
          ),
          cursorColor: Colors.black,
          autofocus: true,
          focusNode: focusNode,
          controller: controllerInputWidget,
          style: const TextStyle(fontSize: 16),
        ),
      );






  Row buildExtraInfo({required String text1,
    required String text2,
    double left1 = 0.0,
    double right1 = 0.0,
    double top1 = 0.0,
    double bottom1 = 0.0,
    FontWeight fontWeight1 = FontWeight.normal,
    required Color color1,
    required double fontsize1,
    int? maxLines1 = 1,
    double left2 = 0.0,
    double right2 = 0.0,
    double top2 = 0.0,
    double bottom2 = 0.0,
    FontWeight fontWeight2 = FontWeight.normal,
    required Color color2,
    required double fontsize2,
    int? maxLines2 = 1}) {
    return Row(
      children: [
        buildText(text1,
            left: left1,
            right: right1,
            bottom: bottom1,
            top: top1,
            fontWeight: fontWeight1,
            color: color1,
            fontsize: fontsize1,
            maxLines: maxLines1),
        const Spacer(),
        buildText(text2,
            left: left2,
            right: right2,
            bottom: bottom2,
            top: top2,
            fontWeight: fontWeight2,
            color: color2,
            fontsize: fontsize2),
      ],
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
