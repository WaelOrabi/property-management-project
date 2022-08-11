import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import '../../../../core/paramaters.dart';
import '../widgets/chat/message_stream_builder_chat_widget.dart';
import '../widgets/chat/input_widget.dart';

class Chat extends StatefulWidget {
 final User ? user;
  static String routeName = 'chat';
  final bool ? isRead;
  const Chat({Key? key, required this.user, this.isRead}) : super(key: key);
  @override
  ChatState createState() => ChatState();
}
class ChatState extends State<Chat> {
  final ScrollController controllerAppBar = ScrollController();
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
    backgroundColor: Theme.of(context).backgroundColor,
        appBar: buildAppBar(context),
        body: buildBody(),
      );

   buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
           SizedBox(height:700,child: MessageStreamBuilderChat(user: widget.user!,isRead: widget.isRead,)),
          InputWidget(
            message: widget.user!.messages,
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

  AppBar buildAppBar(BuildContext context) {
    return AppBar(

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
            widget.user!.image==null?
            const CircleAvatar(
              backgroundImage:AssetImage('assets/images/download.png'),
              radius: 25,
            ): CircleAvatar(
              radius: 25.0,
              backgroundImage:FileImage(widget.user!.image!),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                widget.user!.firstName!+widget.user!.lastName!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
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
