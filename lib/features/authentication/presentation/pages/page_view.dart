import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_111/features/authentication/presentation/pages/welcome.dart';

class PageViewData {
  final String title;
  final String description;
  final IconData icon;

  PageViewData(
      {required this.title, required this.description, required this.icon});
}

class PagesView extends StatefulWidget {
  const PagesView({Key? key}) : super(key: key);
  static String routeName = 'Pagesview';

  @override
  State<PagesView> createState() => _PagesViewState();
}

class _PagesViewState extends State<PagesView> {
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );
  final List<PageViewData> myDataOfPageView = [
    PageViewData(
      title: "BUILD YOUR PERFECT APP",
      description:
          "Use this starter kit to make your own real estate app in minutes. ",
      icon: Icons.location_on,
    ),
    PageViewData(
      title: "MAP VIEW",
      description: "Visualize listings on the map to make your search easier.",
      icon: Icons.map,
    ),
    PageViewData(
      title: "SAVED LISTINGS",
      description: "Save your favorite listings to come back to them later.",
      icon: Icons.favorite_border,
    ),
    PageViewData(
      title: "ADVANCED CUSTOM FILTERS",
      description:
          "Custom dynamic filters to accommodate all markets and all customer needs .",
      icon: Icons.settings,
    ),
    PageViewData(
      title: "ADD NEW LISTINGS",
      description:
          "Add new listing directly from the app including photo gallery and filters.",
      icon: Icons.camera_alt,
    ),
    PageViewData(
      title: "CHAT",
      description: "Communicate with your customers and vendors in real-time.",
      icon: Icons.chat,
    ),
    PageViewData(
      title: "GET NOTIFIED",
      description:
          "Stay on top of your game with real-time push notifications.",
      icon: Icons.notifications_none,
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_currentIndex < 6) _currentIndex++;
      if (_controller.hasClients) {
        _controller.animateToPage(_currentIndex,
            duration: const Duration(microseconds: 300), curve: Curves.easeIn);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          children: myDataOfPageView
              .map((item) => Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item.icon,
                            size: 150,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            item.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            item.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey.shade300),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
          controller: _controller,
          onPageChanged: (val) {
            setState(() {
              _currentIndex = val;
              if (_currentIndex == 6) {
                Future.delayed(
                    const Duration(seconds: 2),
                    () => Navigator.pushReplacementNamed(
                        context, Welcome.routeName));
              }
            });
          },
        ),
        Center(
          child: Indicator(index: _currentIndex),
        ),
        Align(
          alignment: const Alignment(0.9, -0.85),
          child: GestureDetector(
            child: Container(
              width: 100,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: const [
                  Text("Skip",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300)),
            ),
            onTap: () =>
                Navigator.pushReplacementNamed(context, Welcome.routeName),
          ),
        ),
      ],
    ));
  }
}

class Indicator extends StatelessWidget {
  final int index;

  const Indicator({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildContainer(index == 0 ? Colors.white : Colors.grey),
          buildContainer(index == 1 ? Colors.white : Colors.grey),
          buildContainer(index == 2 ? Colors.white : Colors.grey),
          buildContainer(index == 3 ? Colors.white : Colors.grey),
          buildContainer(index == 4 ? Colors.white : Colors.grey),
          buildContainer(index == 5 ? Colors.white : Colors.grey),
          buildContainer(index == 6 ? Colors.white : Colors.grey),
        ],
      ),
    );
  }

  Container buildContainer(Color color1) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color1,
      ),
    );
  }
}
