import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:project_111/features/conversation/presntation/pages/chat.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:path/path.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../../../conversation/presntation/widgets/input_widget.dart';

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
  var items = [
    'Remove From Favorites',
    'Add Review',
    'Send Message'
  ];
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

  late var context;

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

  Widget buildBody(BuildContext context) =>
      WillPopScope(
        onWillPop: onBackPress,
        child: SingleChildScrollView(
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
              const SizedBox(height: 20,),
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
              const SizedBox(height: 20,),
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
              const SizedBox(height: 20,),
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
              const SizedBox(height: 20,),
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
              const SizedBox(height: 20,),
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
              const SizedBox(height: 20,),
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
              const SizedBox(height: 20,),
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
              SizedBox(height: 30,),
              Divider(color: Colors.grey,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(child: Row(children: [
                    buildText('message', fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontsize: 15),
                    SizedBox(width: 5,),
                    Icon(Icons.wechat_outlined)
                  ]), onPressed: () {
                    print('heello');
                    Navigator.of(context).pushNamed(Chat.routeName);
                  },),
                  MaterialButton(child: Row(children: [
                    buildText('comment', fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontsize: 15),
                    SizedBox(width: 5,),
                    Icon(Icons.add_comment_outlined)
                  ],),
                  onPressed: ()=>showModalBottomSheet(context: context,
                     // isDismissible: false,
                    isScrollControlled: true,
                    shape:RoundedRectangleBorder(borderRadius:BorderRadius.vertical(
                      top: const Radius.circular(40.0),
                    ), ) ,
                      builder:(context)=>Container(
                        height: MediaQuery.of(context).size.height * 0.90,

                        child:buildSheet(),
                      )),
                  ),
                  MaterialButton(child: Row(children: [
                    buildText('like', fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontsize: 15),
                    SizedBox(width: 5,),
                    Icon(Icons.thumb_up_off_alt_outlined)
                  ],),
                  onPressed: (){},
                  ),
                ],
              ),
              SizedBox(height: 20,),
              // InputWidget(
              //   iscomment:true,
              //   onBlurred: toggleEmojiKeyboard,
              //   controller: controller,
              //   isEmojiVisible: isEmojiVisible,
              //   isKeyboardVisible: isKeyboardVisible,
              //   onSentMessage: (message) =>
              //       setState(() => messages.insert(0, message)),
              // ),
              // Offstage(
              //   offstage: !isEmojiVisible,
              //   child: SizedBox(
              //     height: 300,
              //     child:Builder(
              //       builder: (BuildContext context) {
              //         return  EmojiPicker(
              //             onEmojiSelected: (Category category, Emoji emoji) {
              //               onEmojiSelected(emoji.emoji);
              //             },
              //             onBackspacePressed:onBackPress,
              //             config: const Config(
              //                 columns: 7,
              //                 verticalSpacing: 0,
              //                 horizontalSpacing: 0,
              //                 initCategory: Category.RECENT,
              //                 bgColor: Color(0xFFF2F2F2),
              //                 indicatorColor: Colors.blue,
              //                 iconColor: Colors.grey,
              //                 iconColorSelected: Colors.blue,
              //                 progressIndicatorColor: Colors.blue,
              //                 backspaceColor: Colors.blue,
              //                 skinToneDialogBgColor: Colors.white,
              //                 skinToneIndicatorColor: Colors.grey,
              //                 enableSkinTones: true,
              //                 showRecentsTab: true,
              //                 recentsLimit: 28,
              //                 noRecentsText: 'No Recents',
              //                 noRecentsStyle:
              //                 TextStyle(fontSize: 20, color: Colors.black26),
              //                 tabIndicatorAnimDuration: kTabScrollDuration,
              //                 categoryIcons: CategoryIcons(),
              //                 buttonMode: ButtonMode.MATERIAL));
              //       },
              //
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      );
  Widget makeDismissible({required Widget child})=>GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: ()=>Navigator.of(context).pop(),
    child: GestureDetector(onTap: (){},child: child,),
  );
  Widget buildSheet(){
    return SingleChildScrollView(
      child: Column(
      children: [
        Container(
          height: 700,
          child: ListView(
            shrinkWrap: true,
             physics: NeverScrollableScrollPhysics(),
             children:[
               Container(),
              ],
                  ),
        ),
        Container(
          child: InputWidget(
            iscomment:true,
            onBlurred: toggleEmojiKeyboard,
            controller: controllerInputWidget,
            isEmojiVisible: isEmojiVisible,
            isKeyboardVisible: isKeyboardVisible,
            onSentMessage: (message) =>
                setState(() => messages.insert(0, message)),
          ),
        ),
        Offstage(
          offstage: !isEmojiVisible,
          child: SizedBox(
            height: 300,
            child:Builder(
              builder: (BuildContext context) {
                return  EmojiPicker(
                    onEmojiSelected: (Category category, Emoji emoji) {
                      onEmojiSelected(emoji.emoji);
                    },
                    onBackspacePressed:onBackPress,
                    config: const Config(
                        columns: 7,
                        verticalSpacing: 0,
                        horizontalSpacing: 0,
                        initCategory: Category.RECENT,
                        bgColor: Color(0xFFF2F2F2),
                        indicatorColor: Colors.blue,
                        iconColor: Colors.grey,
                        iconColorSelected: Colors.blue,
                        progressIndicatorColor: Colors.blue,
                        backspaceColor: Colors.blue,
                        skinToneDialogBgColor: Colors.white,
                        skinToneIndicatorColor: Colors.grey,
                        enableSkinTones: true,
                        showRecentsTab: true,
                        recentsLimit: 28,
                        noRecentsText: 'No Recents',
                        noRecentsStyle:
                        TextStyle(fontSize: 20, color: Colors.black26),
                        tabIndicatorAnimDuration: kTabScrollDuration,
                        categoryIcons: CategoryIcons(),
                        buttonMode: ButtonMode.MATERIAL));
              },

            ),
          ),
        ),
      ],
      ),
    );
  }
  void onEmojiSelected(String emoji) =>
      setState(() {
        controllerInputWidget.text = controllerInputWidget.text + emoji;
      });

  Future toggleEmojiKeyboard() async {
    if (isKeyboardVisible) {
      return FocusScope.of(context).unfocus();
    }

    setState(() {
      isEmojiVisible = !isEmojiVisible;
    });
  }

  Future<bool> onBackPress() {
    if (isEmojiVisible) {
      toggleEmojiKeyboard();
    } else {
      Navigator.pop(context);
    }

    return Future.value(false);
  }

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
