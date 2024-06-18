import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hitpot/screens/chatpot.dart';
import 'package:hitpot/screens/mypot.dart';
import 'package:hitpot/screens/searchpot.dart';

// This is the main application widget.
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenstate();
}

class _MainScreenstate extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = const <Widget>[
    SearchPot(),
    ChatPot(),
    MyPot(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //TODO: BottomNavigationBar 높이 72지정, Custom으로 바꿔서 icon text위치 조정하기
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: '서치팟',
            icon: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset('assets/ic/git-merge-outline.svg'),
            ),
            activeIcon: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset('assets/ic/git-merge-outline.svg'),
            ),
          ),
          BottomNavigationBarItem(
            label: '채팅팟',
            icon: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset('assets/ic/chatbox-outline.svg'),
            ),
            activeIcon: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset('assets/ic/chatbox-outline.svg'),
            ),
          ),
          BottomNavigationBarItem(
            label: '마이팟',
            icon: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset('assets/ic/chatbox-outline.svg'),
            ),
            activeIcon: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset('assets/ic/chatbox-outline.svg'),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
