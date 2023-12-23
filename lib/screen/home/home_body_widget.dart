import 'package:arrivo_frond_end_assignment/screen/post/post_screen.dart';
import 'package:flutter/material.dart';

class HomeBodyWidget extends StatelessWidget {
  final String menu;
  const HomeBodyWidget({Key? key, required this.menu}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (menu) {
      case 'Dashboard':
        page = const Center(
          child: Text(
            "Dashboard Page",
            style: TextStyle(
              color: Color(0xFF171719),
              fontSize: 22,
            ),
          ),
        );
        break;
      case 'Post':
        page = PostScreen();
        break;
      default:
        page = const Center(
          child: Text(
            "Other Page",
            style: TextStyle(
              color: Color(0xFF171719),
              fontSize: 22,
            ),
          ),
        );
    }
    return page;
  }
}
