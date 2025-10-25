import 'package:event_app/core/Theme/app_Color.dart';
import 'package:event_app/ui/mange%20event/mange_event.dart';
import 'package:flutter/material.dart';

import '../../tabs/favorite tab/favorite_tab.dart';
import '../../tabs/home tab/home_tab.dart';
import '../../tabs/map tab/map_tab.dart';
import '../../tabs/profile tab/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "HomeScreen ";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
late List<Widget> tabs = [
  HomeTab(),
  MapTab(),
  FavoriteTab(),
  ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Expanded(child: tabs[selectedIndex]),],),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MangeEvent.routeName);

        },
        shape: CircleBorder(
          side: BorderSide(
            color: AppColor.white,
            width: 2,
          ),
        ),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
bottomNavigationBar:
BottomNavigationBar(
currentIndex: selectedIndex,
onTap: (value) {
  if(value ==2 ){
Navigator.pushNamed(context, MangeEvent.routeName);
  }else{
    selectedIndex = value ;
  }
setState(() {
});
},
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        activeIcon: Icon(Icons.home),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.location_on_outlined),
        activeIcon: Icon(Icons.location_on),
        label: "location",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.location_on_outlined ,
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,),
        label: "",
      ),

      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border_outlined),
        activeIcon: Icon(Icons.favorite),
        label: "favorite",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_2_outlined),
        activeIcon: Icon(Icons.person_2),
        label: "Profile",
      ),


    ]
),
    );
  }
}
