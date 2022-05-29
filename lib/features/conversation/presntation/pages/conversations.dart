import 'package:flutter/material.dart';
import 'package:project_111/features/conversation/presntation/pages/chat.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class Conversations extends StatefulWidget {
  static String routeName = 'Conversation';

  const Conversations({Key? key}) : super(key: key);

  @override
  State<Conversations> createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations> {
  final controllerAppBar = ScrollController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScrollAppBar(
        titleSpacing: 20,
        controller: controllerAppBar,
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2018/01/06/09/25/hijab-3064633_960_720.jpg'),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Conversations',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[300],
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: const [
                      Icon(Icons.search),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Search'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => buildChatItem(),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                    itemCount: 30),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: SizedBox(
      //   height: 58,
      //   child: BottomNavigationBar(
      //     selectedFontSize: 0.0,
      //     unselectedFontSize: 0.0,
      //     backgroundColor: Colors.white,
      //     type: BottomNavigationBarType.fixed,
      //     elevation: 0.0,
      //     currentIndex: _selectedIndex,
      //     onTap: _onItemTapped,
      //     selectedItemColor: Colors.green,
      //     selectedIconTheme: const IconThemeData(color: Colors.green, size: 30),
      //     unselectedItemColor: Colors.grey,
      //     items: <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //         icon: IconButton(
      //             onPressed: () {
      //               Navigator.of(context)
      //                   .pushReplacementNamed(Conversations.routeName);
      //             },
      //             icon: const Icon(Icons.home)),
      //         label: 'Calls',
      //       ),
      //      const BottomNavigationBarItem(
      //         icon: Icon(Icons.category),
      //         label: 'Camera',
      //       ),
      //      const  BottomNavigationBarItem(
      //         icon: Icon(Icons.chat),
      //         label: 'Chats',
      //       ),
      //      const BottomNavigationBarItem(
      //         icon: Icon(Icons.search),
      //         label: 'Chats',
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  GestureDetector buildChatItem() => GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(Chat.routeName);
        },
        child: Row(
          children: [
            Stack(
              children: const [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2018/01/06/09/25/hijab-3064633_960_720.jpg'),
                  backgroundColor: Colors.transparent,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 45, start: 40),
                  child: CircleAvatar(
                    radius: 7.0,
                    backgroundColor: Colors.green,
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ayham ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Expanded(
                          child: Text(
                        'hello Ayham hello Ayham hello Ayham hello Ayhamhello Ayhamhello Ayham hello Ayham hello Ayham',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          width: 7,
                          height: 7,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      const Text('02:00 pm')
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
