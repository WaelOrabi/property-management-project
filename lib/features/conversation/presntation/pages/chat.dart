import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:project_111/core/widgets/user.dart';
import 'package:project_111/features/conversation/presntation/widgets/chat/message_stream_builder_chat_widget.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import '../widgets/chat/input_widget.dart';

class Chat extends StatefulWidget {
 final User? user;
  static String routeName = 'chat';
  const Chat({Key? key, required this.user}) : super(key: key);
  @override
  ChatState createState() => ChatState();
}
class ChatState extends State<Chat> {
  final controllerAppBar = ScrollController();
  final messages = <String>[];
  final controller = TextEditingController();
  bool isEmojiVisible = false;
  bool isKeyboardVisible = false;

  @override
  void initState() {
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

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(context),
        body: buildBody(),
      );

  WillPopScope buildBody() {
    return WillPopScope(
        onWillPop: onBackPress,
        child: Column(
          children: <Widget>[
             MessageStreamBuilderChat(user: widget.user!,),
            InputWidget(
              onBlurred: toggleEmojiKeyboard,
              controller: controller,
              isEmojiVisible: isEmojiVisible,
              isKeyboardVisible: isKeyboardVisible,
              onSentMessage: (message) =>
                  setState(() => messages.insert(0, message)),
            ),
            buildlistEmoji(),
          ],
        ),
      );
  }

  Offstage buildlistEmoji() {
    return Offstage(
              offstage: !isEmojiVisible,
              child: SizedBox(
                height: 300,
                child: EmojiPicker(
                    onEmojiSelected: (Category category, Emoji emoji) {
                      onEmojiSelected(emoji.emoji);
                    },
                    onBackspacePressed: onBackPress,
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
                        buttonMode: ButtonMode.MATERIAL)),
              ),
            );
  }

  ScrollAppBar buildAppBar(BuildContext context) {
    return ScrollAppBar(
        titleSpacing: 20,
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
        title: Row(
          children: [
             CircleAvatar(
              radius: 25.0,
              backgroundImage:FileImage(widget.user!.image!),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    widget.user!.firstName!+widget.user!.lastName!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'last seen on 03:12 pm',
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
      );
  }

  void onEmojiSelected(String emoji) => setState(() {
        controller.text = controller.text + emoji;
      });

  Future toggleEmojiKeyboard() async {
    if (isKeyboardVisible) {
      FocusScope.of(context).unfocus();
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
}
