import 'package:flutter/material.dart';
import 'package:movies_app/core/colors_manager.dart';
import 'package:movies_app/screens/browse_screen/view/view.dart';
import 'package:movies_app/screens/search_screen/search_tab.dart';
import 'package:movies_app/screens/watch_list/watch_list.dart';
import 'screens/home_screen/home_screen.dart';


class Home extends StatefulWidget {
  Home({super.key});


  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTabView(),
    SearchTab(),
    BrowsetabView(),
    WatchListTab(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.background,
        body: tabs[selectedIndex],
              bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorsManager.darkGrey,
          unselectedItemColor: Colors.white,
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.open_in_browser_outlined),
                label: 'Browse'),
            BottomNavigationBarItem(
                icon: Icon(Icons.watch_later_outlined),
                label: 'Watch List'),
          ]
                ,selectedItemColor: Colors.yellow,),
    );
  }
}
