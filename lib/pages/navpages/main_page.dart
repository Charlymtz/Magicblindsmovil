import 'package:flutter/material.dart';
import 'package:magicblinds/pages/navpages/stats.dart';
import 'package:magicblinds/pages/home_page.dart';
import 'package:magicblinds/pages/navpages/my_page.dart';
import 'package:magicblinds/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    const Stats(),
    const SearchPage(),
    const MyPage()
  ];
  int currentIndex=0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type:BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(label:("Home"),icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label:("Bar"),icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(label:("Search"),icon: Icon(Icons.search)),
          BottomNavigationBarItem(label:("My page"),icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
