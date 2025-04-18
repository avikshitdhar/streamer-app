import 'package:flutter/material.dart';
// import 'package:video_streaming_app/providers/user_provider.dart';
// import 'package:provider/provider.dart';
import 'package:video_streaming_app/screens/feed_screen.dart';
import 'package:video_streaming_app/screens/go_live_screen.dart';
import 'package:video_streaming_app/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  List<Widget> pages = [
    const FeedScreen(),
    const GoLiveScreen(),
    const Center(
      child: Text('Browser'),
    ),
  ];
  onPageChange(int page) {
    setState(() {});
    _page = page;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: buttonColor,
        unselectedItemColor: primaryColor,
        backgroundColor: backgroundColor,
        unselectedFontSize: 12,
        onTap: onPageChange,
        currentIndex: _page,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Following',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_rounded),
            label: 'Go Live',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.copy),
            label: 'Browsing',
          )
        ],
      ),
      body: pages[_page],
    );
  }
}
