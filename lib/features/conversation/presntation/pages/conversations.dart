import 'package:flutter/material.dart';
import '../../../../core/paramaters.dart';
import '../widgets/conversation/conversation_items_widget.dart';
import '../../../../tests/tests.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
class Conversations extends StatefulWidget {
  static String routeName = 'Conversation';
  final List<User>? useres;
  const Conversations({Key? key,required this.useres}) : super(key: key);
  @override
  State<Conversations> createState() => _ConversationsState();
}
class _ConversationsState extends State<Conversations> {
  final controllerAppBar = ScrollController();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .backgroundColor,
      appBar: buildScrollAppBar(),
      body: buildBody(),
    );
  }

  Container buildBody() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          controller: controllerAppBar,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      buildChatItem(
                          user: widget.useres![index], context: context),
                  separatorBuilder: (context, index) =>
                  const SizedBox(
                    height: 20,
                  ),
                  itemCount: widget.useres!.length),
            ],
          ),
        ),
      ),
    );
  }

  ScrollAppBar buildScrollAppBar() {
    return ScrollAppBar(
      titleSpacing: 20,
      controller: controllerAppBar,
      elevation: 4.0,
      shadowColor: Theme.of(context).colorScheme.secondary,
      backgroundColor: Theme
          .of(context)
          .appBarTheme
          .backgroundColor,
      centerTitle: true,
      title: Row(
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage: FileImage(Te.user.image!),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            'Conversations',
            textAlign: TextAlign.center,
            style: Theme
                .of(context)
                .appBarTheme
                .textTheme!
                .bodyText1,
          ),
        ],
      ),
    );
  }
}